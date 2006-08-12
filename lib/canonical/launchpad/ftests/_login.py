# Copyright 2004-2005 Canonical Ltd.  All rights reserved.

__metaclass__ = type

from zope.component import getUtility
from zope.security.management import queryInteraction, endInteraction
from canonical.launchpad.webapp.interfaces import IPlacelessAuthUtility
from canonical.launchpad.webapp.interaction import setupInteraction

__all__ = ['login', 'logout', 'ANONYMOUS', 'is_logged_in']


ANONYMOUS = 'launchpad.anonymous'

_logged_in = False

def is_logged_in():
    global _logged_in
    return _logged_in

def login(email, participation=None):
    """Simulates a login, using the specified email.

    If the canonical.launchpad.ftests.ANONYMOUS constant is supplied
    as the email, you'll be logged in as the anonymous user.

    You can optionally pass in a participation to be used.  If no participation
    is given, a MockParticipation is used.

    The participation passed in must allow setting of its principal.
    """
    global _logged_in
    _logged_in = True
    authutil = getUtility(IPlacelessAuthUtility)

    # Login in anonymously even if we're going to log in as a user. We
    # need to do this because there is a check that the email address
    # is valid. This check goes via a security proxy, so we need an
    # interaction in order to log in with an email address.
    setupInteraction(
        authutil.unauthenticatedPrincipal(), participation=participation)

    if email != ANONYMOUS:
        principal = authutil.getPrincipalByLogin(email)
        assert principal is not None, "Invalid login"
        setupInteraction(principal, login=email, participation=participation)


def logout():
    """Tear down after login(...), ending the current interaction.

    Note that this is done automatically in
    canonical.launchpad.ftest.LaunchpadFunctionalTestCase's tearDown method so
    you generally won't need to call this.
    """
    global _logged_in
    _logged_in = False
    endInteraction()

