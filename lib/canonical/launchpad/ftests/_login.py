# Copyright 2004-2005 Canonical Ltd.  All rights reserved.
# We like global statements!
# pylint: disable-msg=W0602,W0603
__metaclass__ = type

from zope.component import getUtility
from zope.security.management import endInteraction
from canonical.launchpad.webapp.interfaces import IPlacelessAuthUtility
from canonical.launchpad.webapp.interaction import setupInteraction
from canonical.launchpad.webapp.servers import LaunchpadTestRequest
from canonical.launchpad.webapp.vhosts import allvhosts

__all__ = [
    'login',
    'login_person',
    'logout',
    'ANONYMOUS',
    'is_logged_in']


ANONYMOUS = 'launchpad.anonymous'

_logged_in = False

def is_logged_in():
    global _logged_in
    return _logged_in

def login(email, participation=None):
    """Simulates a login, using the specified email.

    If the canonical.launchpad.ftests.ANONYMOUS constant is supplied
    as the email, you'll be logged in as the anonymous user.

    You can optionally pass in a participation to be used.  If no
    participation is given, a LaunchpadTestRequest is used.

    If the participation provides IPublicationRequest, it must implement
    setPrincipal(), otherwise it must allow setting its principal attribute.
    """
    global _logged_in
    _logged_in = True
    authutil = getUtility(IPlacelessAuthUtility)

    if email != ANONYMOUS:
        # Create an anonymous interaction first because this calls
        # IPersonSet.getByEmail() and since this is security wrapped, it needs
        # an interaction available.
        setupInteraction(authutil.unauthenticatedPrincipal())
        principal = authutil.getPrincipalByLogin(email, want_password=False)
        assert principal is not None, "Invalid login"
    else:
        principal = authutil.unauthenticatedPrincipal()

    if participation is None:
        # we use the main site as the host name.  This is a guess, to make
        # canonical_url produce a real-looking host name rather than
        # 127.0.0.1.
        participation = LaunchpadTestRequest(
            environ={'HTTP_HOST': allvhosts.configs['mainsite'].hostname,
                     'SERVER_URL': allvhosts.configs['mainsite'].rooturl})

    setupInteraction(principal, login=email, participation=participation)


def login_person(person, participation=None):
    """Login the person with their preferred email."""
    from zope.security.proxy import removeSecurityProxy
    # Bypass zope's security because IEmailAddress.email is not public.
    naked_email = removeSecurityProxy(person.preferredemail)
    return login(naked_email.email, participation)


def logout():
    """Tear down after login(...), ending the current interaction.

    Note that this is done automatically in
    canonical.launchpad.ftest.LaunchpadFunctionalTestCase's tearDown method so
    you generally won't need to call this.
    """
    global _logged_in
    _logged_in = False
    endInteraction()
