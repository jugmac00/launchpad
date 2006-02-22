# Copyright 2005 Canonical Ltd.  All rights reserved.

"""Generalised Form View Classes
"""

__docformat__ = 'restructuredtext'

__all__ = [
    'GeneralFormView',
    'GeneralFormViewFactory',
    'NoRenderingOnRedirect',
    ]

from transaction import get_transaction

from zope.interface import Interface
from zope.schema import getFieldNamesInOrder
from zope.publisher.interfaces.browser import IBrowserRequest
from zope.security.checker import defineChecker, NamesChecker

from zope.app import zapi
from zope.app.i18n import ZopeMessageIDFactory as _
from zope.app.form.interfaces import WidgetsError
from zope.app.form.interfaces import IInputWidget
from zope.app.pagetemplate.viewpagetemplatefile import ViewPageTemplateFile
from zope.app.pagetemplate.simpleviewclass import SimpleViewClass
from zope.app.publisher.browser import BrowserView

from zope.app.form.utility import setUpWidgets, getWidgetsData


class NoRenderingOnRedirect:
    """Mix-in for not rendering the page on redirects."""

    def __call__(self):
        # Call update() here instead of from the template to avoid
        # rendering the page on redirects.
        self.update()
        if self.request.response.getStatus() in [302, 303]:
            # Don't render the page on redirects.
            return ''
        else:
            page_attribute = getattr(self, '__page_attribute__', None)
            if page_attribute is not None:
                output = getattr(self, page_attribute)
            else:
                output = self.index
            return output()


class GeneralFormView(BrowserView, NoRenderingOnRedirect):
    """Simple Generalised Form Base Class

    Subclasses should provide a `schema` attribute defining the schema
    to be edited.

    The automatically generated widgets are available by name through
    the attributes `*_widget`.
    (E.g. ``view.title_widget for the title widget``)
    """

    top_of_page_errors = ()
    label = ''
    _arguments = []
    _keyword_arguments = []
    _nextURL = None

    # Fall-back field names computed from schema
    fieldNames = property(lambda self: getFieldNamesInOrder(self.schema))

    # Fall-back template
    generated_form = ViewPageTemplateFile('../templates/launchpad-generalform.pt')

    # methods that should be overridden
    def process(self, *args, **kw):
        """Override this method in your own browser class, to process the
        form submission results.
        """
        pass

    def nextURL(self):
        """Override this to tell the form where to go after it has
        processed. Alternatively, just set self._nextURL and this method
        will send you there after self.process()
        """
        return self._nextURL

    def validate(self, data):
        """Validate the form.

        If errors are encountered, a WidgetsError exception is raised.

        Returns a dict of fieldname:value pairs if all form data
        submitted is valid.
        """
        pass

    @property
    def initial_values(self):
        """Override this in your subclass if you want any widgets to have
        initial values.
        """
        return {}

    # internal methods, should not be overridden
    def __init__(self, context, request):
        BrowserView.__init__(self, context, request)

        self.errors = {}
        self.process_status = None

        self._setUpWidgets()

    def _setUpWidgets(self):
        setUpWidgets(self, self.schema, IInputWidget, names=self.fieldNames,
                     initial=self.initial_values)

    def setPrefix(self, prefix):
        for widget in self.widgets():
            widget.setPrefix(prefix)

    def widgets(self):
        return [getattr(self, name+'_widget')
                for name in self.fieldNames]

    def process_form(self):
        """This method extracts all the meaningful data from the form, and
        then calls self.process(), passing the contents of the form. You
        should override self.process() in your own View class.
        """
        if self.process_status is not None:
            # We've been called before, so just return the status we previously
            # computed.
            return self.process_status

        if "FORM_SUBMIT" not in self.request:
            self.process_status = ''
            if self.request.method == 'POST':
                self.process_status = 'Please fill in the form.'
            return self.process_status

        # Extract and validate the POSTed data.
        try:
            data = getWidgetsData(self, self.schema, names=self.fieldNames)
        except WidgetsError, errors:
            self.errors = errors
            self._abortAndSetStatus()
            return self.process_status

        # Do custom validation defined in subclasses. This would generally
        # include form-level validation, or validation of fields shown on the
        # form that don't map to schema fields, and thus don't have "widgets" in
        # the Zope 3 sense.
        try:
            self.validate(data)
        except WidgetsError, errors:
            self.top_of_page_errors = errors
            self._abortAndSetStatus()
            return self.process_status

        # Pass the validated data to the form's self.process().
        args = []
        if self._arguments:
            for name in self._arguments:
                args.append(data[name])

        kw = {}
        if self._keyword_arguments:
            for name in self._keyword_arguments:
                if name in data:
                    kw[str(name)] = data[name]

        self.process_status = self.process(*args, **kw)

        # Go to the nextURL(), if we have one.
        if self.nextURL():
            self.request.response.redirect(self.nextURL())

        return self.process_status

    def update(self):
        """NoRenderingOnRedirect class calls this method."""
        return self.process_form()

    def _abortAndSetStatus(self):
        """Abort the current transaction and set self.process_status."""
        self.process_status = _("Please fix the problems below and try again.")
        get_transaction().abort()

    def __call__(self):
        return NoRenderingOnRedirect.__call__(self)


def GeneralFormViewFactory(name, schema, label, permission, layer,
                    template, default_template, bases, for_, fields,
                    arguments, keyword_arguments, fulledit_path=None,
                    fulledit_label=None, menu=u''):
    class_ = SimpleViewClass(template, used_for=schema, bases=bases)
    class_.schema = schema
    class_.label = label
    class_.fieldNames = fields
    class_._arguments = arguments
    class_._keyword_arguments = keyword_arguments

    class_.fulledit_path = fulledit_path
    if fulledit_path and (fulledit_label is None):
        fulledit_label = "Full edit"

    class_.fulledit_label = fulledit_label

    class_.generated_form = ViewPageTemplateFile(default_template)

    defineChecker(class_,
                  NamesChecker(("__call__", "__getitem__",
                                "browserDefault", "publishTraverse"),
                               permission))
    if layer is None:
        layer = IBrowserRequest

    s = zapi.getGlobalService(zapi.servicenames.Adapters)
    s.register((for_, layer), Interface, name, class_)

