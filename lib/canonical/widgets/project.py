# Copyright 2007 Canonical Ltd.  All rights reserved.

"""Widgets related to IProject."""

__metaclass__ = type

from textwrap import dedent

from zope.app.form import InputWidget
from zope.app.form.browser.interfaces import IWidgetInputErrorView
from zope.app.form.browser.widget import BrowserWidget, renderElement
from zope.app.form.interfaces import (
    ConversionError, IInputWidget, InputErrors, MissingInputError,
    WidgetInputError)
from zope.app.form.utility import setUpWidget
from zope.component import getMultiAdapter, getViewProviding
from zope.interface import implements
from zope.schema import Choice
from zope.schema._bootstrapinterfaces import RequiredMissing

from canonical.launchpad.interfaces import UnexpectedFormData
from canonical.launchpad.validators import LaunchpadValidationError
from canonical.launchpad.webapp.interfaces import IAlwaysSubmittedWidget


class ProjectScopeWidget(BrowserWidget, InputWidget):
    """Widget for selecting a scope. Either 'All projects' or only one."""

    implements(IAlwaysSubmittedWidget, IInputWidget)

    default_option = "all"
    _error = None

    def __init__(self, field, vocabulary, request):
        super(ProjectScopeWidget, self).__init__(field, request)

        # We copy the title, description and vocabulary from the main
        # field since it determines the valid target types.
        target_field = Choice(
            __name__='target', title=field.title,
            description=field.description, vocabulary=vocabulary,
            required=True)
        setUpWidget(
            self, target_field.__name__, target_field, IInputWidget,
            prefix=self.name)
        self.setUpOptions()

    def setUpOptions(self):
        """Set up options to be rendered."""
        self.options = {}
        for option in ['all', 'project']:
            attributes = dict(
                type='radio', name=self.name, value=option,
                id='%s.option.%s' % (self.name, option))
            if self.request.form.get(self.name, self.default_option) == option:
                attributes['checked'] = 'checked'
            if option == 'project':
                attributes['onclick'] = (
                    "document.getElementById('field.scope.target').focus();")
            self.options[option] = renderElement('input', **attributes)
        self.target_widget.onKeyPress = (
            "selectWidget('%s.option.project', event)" % self.name)

    def hasInput(self):
        """See zope.app.form.interfaces.IInputWidget."""
        return self.name in self.request.form

    def hasValidInput(self):
        """See zope.app.form.interfaces.IInputWidget."""
        try:
            self.getInputValue()
            return True
        except (InputErrors, UnexpectedFormData, LaunchpadValidationError):
            return False

    def getInputValue(self):
        """See zope.app.form.interfaces.IInputWidget."""
        scope = self.request.form.get(self.name)
        if scope == 'all':
            return None
        elif scope == 'project':
            try:
                return self.target_widget.getInputValue()
            except MissingInputError:
                self._error = LaunchpadValidationError(
                    'Please enter a project name')
            except ConversionError:
                entered_name = self.request.form.get("%s.target" % self.name)
                self._error = LaunchpadValidationError(
                    "There is no project named '%s' registered in"
                    " Launchpad", entered_name)
        else:
            raise UnexpectedFormData("No valid option was selected.")
        if self._error:
            raise(self._error)

    def setRenderedValue(self, value):
        """See IWidget."""
        if value is None:
            self.default_option = 'all'
            self.target_widget.setRenderedValue(None)
        else:
            self.default_option = 'project'
            self.target_widget.setRenderedValue(value)
        self.setUpOptions()

    def __call__(self):
        """See zope.app.form.interfaces.IBrowserWidget."""
        return "\n".join([
            self.renderScopeOptions(),
            self.target_widget()])

    def renderScopeOptions(self):
        """Render the HTML for the scope radio widgets."""
        return dedent('''\
        <label>
          %(all)s All projects
        </label>
        <label>
          %(project)s One project:
        </label>
        ''' % self.options)

    def error(self):
        """See zope.app.form.browser.interfaces.IBrowserWidget"""
        if self._error:
            return self._error.doc()
        else:
            return u""
