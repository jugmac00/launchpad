# Copyright 2005 Canonical Ltd

__metaclass__ = type

__all__ = ['StandardShipItRequestAddView', 'ShippingRequestAdminView',
           'ShippingRequestsView', 'ShipItLoginView', 'ShipItRequestView',
           'ShipItUnauthorizedView', 'StandardShipItRequestsView',
           'ShippingRequestURL', 'StandardShipItRequestURL']

from zope.event import notify
from zope.component import getUtility
from zope.interface import implements
from zope.app.form.browser.add import AddView
from zope.app.form.utility import setUpWidgets
from zope.app.form.interfaces import IInputWidget
from zope.app.event.objectevent import ObjectCreatedEvent
from zope.app.pagetemplate.viewpagetemplatefile import ViewPageTemplateFile

from canonical.lp.z3batching import Batch
from canonical.lp.batching import BatchNavigator
from canonical.launchpad.webapp.error import SystemErrorView
from canonical.launchpad.webapp.login import LoginOrRegister
from canonical.launchpad.webapp import canonical_url
from canonical.launchpad.mail.sendmail import simple_sendmail
from canonical.database.sqlbase import flush_database_updates
from canonical.launchpad.helpers import positiveIntOrZero, intOrZero
from canonical.launchpad.interfaces import (
    IStandardShipItRequestSet, IShippingRequestSet, ILaunchBag, IShipItCountry,
    ShippingRequestStatus, ILaunchpadCelebrities, ICanonicalUrlData)

from canonical.launchpad import _


class ShippingRequestURL:
    implements(ICanonicalUrlData)
    inside = None

    def __init__(self, context):
        self.path = '/requests/%d' % context.id
        self.context = context


class StandardShipItRequestURL:
    implements(ICanonicalUrlData)
    inside = None

    def __init__(self, context):
        self.path = '/standardoptions/%d' % context.id
        self.context = context


class ShipItUnauthorizedView(SystemErrorView):

    forbidden_page = ViewPageTemplateFile(
        '../templates/launchpad-forbidden.pt')

    def __call__(self):
        # Users should always go to shipit.ubuntu.com and login before
        # going to any other page.
        self.request.response.setStatus(403) # Forbidden
        return self.forbidden_page()


# XXX: The LoginOrRegister class is not really designed to be reused. That
# class must either be fixed to allow proper reuse or we should write a new
# class which doesn't reuses LoginOrRegister here. -- GuilhermeSalgado
# 2005-09-09
class ShipItLoginView(LoginOrRegister):
    """Process the login form and redirect the user to the request page."""

    def process_form(self):
        if getUtility(ILaunchBag).user is not None:
            # Already logged in.
            self._redirect()
            return
        LoginOrRegister.process_form(self)
        if self.login_success():
            self._redirect()

    def _redirect(self):
        """Redirect the logged in user to the request page.

        If the logged in user is a ShipIt administrator, then he's redirected
        to the 'requests' page, where all requests are shown.
        """
        user = getUtility(ILaunchBag).user
        assert user is not None
        if user.inTeam(getUtility(ILaunchpadCelebrities).shipit_admin):
            self.request.response.redirect('requests')
        else:
            self.request.response.redirect('myrequest')


class ShipItRequestView:
    """The view for people to create/edit ShipIt requests."""

    # XXX: These 2 email addresses must go into launchpad.conf
    # -- GuilhermeSalgado 2005-09-01
    shipit_admins = 'info@shipit.ubuntu.com'
    from_addr = "ShipIt <noreply@ubuntu.com>"
    mail_template = """
The user %(recipientname)s (%(recipientemail)s) placed a new request in ShipIt.
This request can be seen at:
%(requesturl)s


The request details are as follows:

  X86: %(quantityx86)d
AMD64: %(quantityamd64)d
  PPC: %(quantityppc)d
Reason:
%(reason)s
"""
    def __init__(self, context, request):
        self.context = context
        self.request = request
        self.user = getUtility(ILaunchBag).user
        setUpWidgets(self, IShipItCountry, IInputWidget,
                     initial={'country': getattr(self.user, 'country', None)})
        self.addressFormMessages = []
        self.requestFormMessages = []
        self.currentOrder = None
        self.isCustomOrder = False
        self.orderCreated = False
        self.orderChanged = False

    def hasErrorMessages(self):
        """Return True if there are any error messages we need to display."""
        return bool(self.addressFormMessages or self.requestFormMessages)

    def standardShipItRequests(self):
        """Return all standard ShipIt Requests."""
        return getUtility(IStandardShipItRequestSet).getAll()

    def processForm(self):
        """Process the ShipIt form, if it was submitted."""
        self.currentOrder = self.user.currentShipItRequest()

        if self.request.method != "POST":
            if self.currentOrder is not None:
                self._loadRequestForDisplay()
            return

        form = self.request.form
        if 'newrequest' in form or 'changerequest' in form:
            self._readAndValidateRequestDetails()
            self._readAndValidateContactDetails()
            if not self.hasErrorMessages():
                self._saveContactDetails()
                if 'newrequest' in form:
                    if self.currentOrder is not None:
                        # User reloaded the page after posting a new order;
                        # when we accept multiple orders at once this will
                        # need to be changed.
                        return
                    self._createNewRequest()
                elif 'changerequest' in form:
                    assert self.currentOrder
                    self._changeExistingRequest()
        elif 'cancelrequest' in form:
            assert self.currentOrder
            self.currentOrder.cancel(getUtility(ILaunchBag).user)
            self.currentOrder = None

        flush_database_updates()

    def _loadRequestForDisplay(self):
        order = self.currentOrder
        standardrequestset = getUtility(IStandardShipItRequestSet)
        standardrequest = standardrequestset.getByNumbersOfCDs(
            order.quantityx86, order.quantityamd64, order.quantityppc)
        if standardrequest is not None:
            self.selectedOrder = standardrequest.id
            self.reason = None
        else:
            self.quantityx86 = order.quantityx86
            self.quantityamd64 = order.quantityamd64
            self.quantityppc = order.quantityppc
            self.isCustomOrder = True
            self.reason = order.reason

    def _notifyShipItAdmins(self, order):
        """Notify the shipit admins by email that there's a new request."""
        subject = ('[ShipIt] New Custom Request for %d CDs' % order.totalCDs)
        recipient = order.recipient
        headers = {'Reply-To': recipient.preferredemail.email}
        replacements = {'recipientname': recipient.displayname,
                        'recipientemail': recipient.preferredemail.email,
                        'requesturl': canonical_url(order),
                        'quantityx86': order.quantityx86,
                        'quantityamd64': order.quantityamd64,
                        'quantityppc': order.quantityppc,
                        'reason': order.reason}
        message = self.mail_template % replacements
        simple_sendmail(self.from_addr, self.shipit_admins, subject, message,
                        headers)

    def _createNewRequest(self):
        """Create and return a new ShippingRequest.

        If this is a custom request, then send an email to the shipit admins
        with the details of the request.
        The attributes used to create this ShippingRequest are the ones stored
        in this object by the _readAndValidateRequestDetails() method.
        """
        self.orderCreated = True
        order = getUtility(IShippingRequestSet).new(
            self.user, self.quantityx86, self.quantityamd64,
            self.quantityppc, self.reason)

        self.currentOrder = order
        # Orders with a total of 80 CDs or less get approved automatically.
        # XXX: Ideally it should be possible to tweak this number through
        # a web interface. -- Guilherme Salgado 2005-09-27
        if self.isCustomOrder and order.totalCDs > 80:
            self._notifyShipItAdmins(order)
        else:
            order.approve(
                self.quantityx86, self.quantityamd64, self.quantityppc)

        return order

    def _saveContactDetails(self):
        """Save the contact details for this user.

        This method assumes the contact details are stored as attributes of
        this object. This is obtained by calling
        self._readAndValidateContactDetails().
        """
        contact_fields = ['addressline1', 'addressline2', 'postcode', 'city',
                          'province', 'organization', 'phone']

        for field in contact_fields:
            setattr(self.user, field, getattr(self, field))
        self.user.country = self.country

    def _changeExistingRequest(self):
        """Save the request details in the current request.

        This method assumes the request details are stored as attributes of
        this object. This is obtained by calling
        self._readAndValidateRequestDetails().
        """
        self.orderChanged = True
        order = self.currentOrder
        wasStandard = order.isStandardRequest()
        order.quantityx86 = self.quantityx86
        order.quantityppc = self.quantityppc
        order.quantityamd64 = self.quantityamd64
        order.reason = self.reason
        if order.totalCDs <= 80 and order.isAwaitingApproval():
            # Orders with 80 or less CDs get approved automatically.
            order.approve(
                order.quantityx86, order.quantityamd64, order.quantityppc)
        elif order.totalCDs > 80 and order.isApproved():
            order.clearApproval()
            self._notifyShipItAdmins(order)

    def _readAndValidateRequestDetails(self):
        """Read the request details from the form, do any necessary validation
        and save them in the view."""
        form = self.request.form
        requesttype = form.get('requesttype')
        if requesttype == 'standard':
            self.isCustomOrder = False
            self.selectedOrder = int(form.get('standardrequest'))
            order = getUtility(IStandardShipItRequestSet).get(
                self.selectedOrder)
            if order is None:
                msg = _('The standard request numbers have changed since you '
                        'submitted your request; please review the new numbers '
                        'and make a new selection.')
                self.requestFormMessages.append(msg)
                return
            self.quantityx86 = order.quantityx86
            self.quantityamd64 = order.quantityamd64
            self.quantityppc = order.quantityppc
            self.reason = None
        elif requesttype == 'custom':
            self.isCustomOrder = True
            self.quantityx86 = intOrZero(form.get('quantityx86'))
            self.quantityamd64 = intOrZero(form.get('quantityamd64'))
            self.quantityppc = intOrZero(form.get('quantityppc'))

            if (self.quantityx86 < 0 or self.quantityamd64 < 0 or
                self.quantityppc < 0):
                self.requestFormMessages.append(_(
                    "You requested a negative number of CDs, which doesn't "
                    "make sense. Please correct the number below."))

            if (self.quantityx86 + self.quantityamd64 + self.quantityppc) == 0:
                self.requestFormMessages.append(_(
                    "You have requested a total of zero CDs. An order must "
                    "have at least one CD requested; please correct below."))

            self.reason = form.get('reason')
            if not self.reason:
                msg = _(("You've chosen to make a custom request. Please "
                         "provide a reason to justify it."))
                self.requestFormMessages.append(msg)

    def _readAndValidateContactDetails(self):
        """Read the contact details from the form, do any necesary validation
        and save them in the view."""
        # Mandatory fields as defined in the old shipit.
        #   - addressline1
        #   - city
        #   - zip (only if in ['US', 'GB', 'FR', 'IT', 'DE', 'NO', 'SE', 'ES'])
        validators = {'organization': ("Organization",
                                       self._validateorganization),
                      'addressline1': ("Address", self._validateaddressline1),
                      'addressline2': ("Address", self._validateaddressline2),
                      'city': ("City", self._validatecity),
                      'province': ("State", None),
                      'postcode': ("Postcode", self._validatepostcode),
                      'phone': ("Phone", self._validatephone)}
        form = self.request.form
        msg = None
        self.country = self.country_widget.getInputValue()
        for field, (field_title, validator) in validators.items():
            value = form.get(field)
            # Save all field values in the view so we can display them, if
            # anything goes wrong.
            setattr(self, field, value)
            try:
                value.encode('ascii')
            except UnicodeEncodeError, e:
                first_non_ascii_char = value[e.start:e.end]
                e_with_accute = u'\N{LATIN SMALL LETTER E WITH ACUTE}'
                msg = _("Sorry, but address fields containing non-ASCII "
                        "characters (such as '%s', in the %s field) aren't "
                        "accepted by our shipping company. Please change "
                        "these to ASCII equivalents. (For instance, '%s' "
                        "should be changed to 'e')"
                        % (first_non_ascii_char, field_title, e_with_accute))

            if validator is not None:
                validator(value)

        # Add the error message only once, even if there's errors in more
        # than one field.
        if msg:
            self.addressFormMessages.append(msg)

    #
    # Following are validator methods to make sure we follow the constraints
    # of the shipping companies.
    #

    def _validatepostcode(self, value):
        """Make sure postcode follows the mailing constraints.

        Add an error message to self.addressFormMessages if it doesn't.
        """
        code = self.country.iso3166code2
        if (not value and
            code in ('US', 'GB', 'FR', 'IT', 'DE', 'NO', 'SE', 'ES')):
            self.addressFormMessages.append(_(
                "Shipping to your country requires a postcode, but you didn't "
                "provide one. Please enter one below."))
        elif len(value) > 12:
            self.addressFormMessages.append(_(
                "Your postcode can't have more than 12 characters."))

    def _validatecity(self, value):
        """Make sure city follows the mailing constraints.

        Add an error message to self.addressFormMessages if it doesn't.
        """
        if not value:
            self.addressFormMessages.append(_(
                'You must enter your city in the form.'))
        elif len(value) > 30:
            self.addressFormMessages.append(_(
                "Your city name can't have more than 30 characters."))

    def _validateaddressline1(self, value):
        """Make sure addressline1 follows the mailing constraints.

        Add an error message to self.addressFormMessages if it doesn't.
        """
        if not value:
            self.addressFormMessages.append(_('You must enter an address.'))
        elif len(value) > 30:
            self.addressFormMessages.append(_(
                "Address (first line) can't have more than 30 characters. "
                "You should use the second line if your address is too long."))

    def _validateaddressline2(self, value):
        """Make sure addressline2 follows the mailing constraints.

        Add an error message to self.addressFormMessages if it doesn't.
        """
        if value and len(value) > 30:
            self.addressFormMessages.append(_(
                "Address (second line) can't have more than 30 characters. "
                "You should use the first line if your address is too long."))

    def _validatephone(self, value):
        """Make sure phone follows the mailing constraints.

        Add an error message to self.addressFormMessages if it doesn't.
        """
        if value and len(value) > 16:
            self.addressFormMessages.append(_(
                "Your phone mumber must be less than 16 characters. Leave it "
                "blank if it will not fit."))

    def _validateorganization(self, value):
        """Make sure organization follows the mailing constraints.

        Add an error message to self.addressFormMessages if it doesn't.
        """
        if value and len(value) > 30:
            self.addressFormMessages.append(_(
                "Your organization can't have more than 30 characters."))


BATCH_SIZE = 50

class ShippingRequestsView:
    """The view to list ShippingRequests that match a given criteria."""

    submitted = False
    results = None
    selectedStatus = 'pending'
    selectedType = 'custom'

    def standardShipItRequests(self):
        """Return a list with all standard ShipIt Requests."""
        return getUtility(IStandardShipItRequestSet).getAll()

    def processForm(self):
        """Process the form, if it was submitted."""
        request = self.request
        status = request.get('statusfilter')
        if not status:
            self.batchNavigator = self._getBatchNavigator([])
            return

        self.submitted = True
        self.selectedStatus = status
        if status == 'pending':
            status = ShippingRequestStatus.PENDING
        elif status == 'approved':
            status = ShippingRequestStatus.APPROVED
        elif status == 'denied':
            status = ShippingRequestStatus.DENIED
        else:
            status = ShippingRequestStatus.ALL

        requestset = getUtility(IShippingRequestSet)
        type = request.get('typefilter')
        self.selectedType = type
        if type == 'custom':
            results = requestset.searchCustomRequests(status=status)
        elif type == 'standard':
            results = requestset.searchStandardRequests(status=status)
        else:
            # Must cast self.selectedType to an int so we can compare with the
            # value of standardrequest.id in the template to see if it must be
            # the selected option or not.
            self.selectedType = int(self.selectedType)
            type = getUtility(IStandardShipItRequestSet).get(type)
            results = requestset.searchStandardRequests(
                status=status, standard_type=type)

        self.batchNavigator = self._getBatchNavigator(results)

    def _getBatchNavigator(self, list):
        start = int(self.request.get('batch_start', 0))
        batch = Batch(list=list, start=start, size=BATCH_SIZE)
        return BatchNavigator(batch=batch, request=self.request)


class StandardShipItRequestsView:
    """The view for the list of all StandardShipItRequests."""

    def processForm(self):
        if self.request.method != 'POST':
            return

        for key, value in self.request.form.items():
            if value == 'Delete':
                id = int(key)
                getUtility(IStandardShipItRequestSet).get(id).destroySelf()


class StandardShipItRequestAddView(AddView):
    """The view to add a new Standard ShipIt Request."""

    def nextURL(self):
        return '.'

    def createAndAdd(self, data):
        quantityx86 = data.get('quantityx86')
        quantityamd64 = data.get('quantityamd64')
        quantityppc = data.get('quantityppc')
        description = data.get('description')
        isdefault = data.get('isdefault')
        request = getUtility(IStandardShipItRequestSet).new(
            quantityx86, quantityamd64, quantityppc, description, isdefault)
        notify(ObjectCreatedEvent(request))


class ShippingRequestAdminView:
    """The view for ShipIt admins to approve/reject requests."""

    def _getApprovedQuantities(self):
        """Return a list containing the approved quantities for each
        architecture.

        The first element is the quantity of X86 CDs approved, the second is
        for AMD64 CDs and the third is for PPC CDs.
        If the value for any of these architectures is less than zero, we'll
        return zero for that architecture.
        """
        form = self.request.form
        x86approved = positiveIntOrZero(form.get('quantityx86'))
        amd64approved = positiveIntOrZero(form.get('quantityamd64'))
        ppcapproved = positiveIntOrZero(form.get('quantityppc'))
        return [x86approved, amd64approved, ppcapproved]

    def processForm(self):
        user = getUtility(ILaunchBag).user
        context = self.context
        request = self.request
        highpriority = False
        if self.request.form.get('highpriority'):
            highpriority = True

        if 'DENY' in request:
            if not context.isDenied():
                context.deny()
                flush_database_updates()
                self._goToNextPending(previous_action='denied')
            else:
                # XXX: Must give some kind of warning in this case.
                # GuilhermeSalgado - 2005-09-02
                pass
        elif 'CHANGE' in request:
            if not context.approved:
                # XXX: Must give some kind of warning in this case.
                # GuilhermeSalgado - 2005-09-02
                return
            x86, amd64, ppc = self._getApprovedQuantities()
            context.setApprovedTotals(x86, amd64, ppc)
            context.highpriority = highpriority
            flush_database_updates()
            self._goToNextPending(previous_action='changed')
        elif 'APPROVE' in request:
            if not context.approved:
                x86, amd64, ppc = self._getApprovedQuantities()
                context.approve(x86, amd64, ppc, whoapproved=user)
                context.highpriority = highpriority
                flush_database_updates()
                self._goToNextPending(previous_action='approved')
            else:
                # XXX: Must give some kind of warning in this case.
                # GuilhermeSalgado - 2005-09-02
                pass
        else:
            # User tried to poison the form. Let's simply ignore
            pass

    def _goToNextPending(self, previous_action):
        """Redirect to the next pending request, if there's one."""
        next_order = getUtility(IShippingRequestSet).getOldestPending()
        if next_order:
            url = '%s?previous=%d&%s=1' % (canonical_url(next_order),
                                           self.context.id, previous_action)
            self.request.response.redirect(url)

