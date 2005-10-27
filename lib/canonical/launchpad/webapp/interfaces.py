# Copyright 2004 Canonical Ltd.  All rights reserved.

__metaclass__ = type

import logging

from zope.interface import Interface, Attribute, implements
from zope.app.security.interfaces import IAuthenticationService, IPrincipal
from zope.app.pluggableauth.interfaces import IPrincipalSource
from zope.schema import Int, Text, Object, Datetime, TextLine

from canonical.launchpad import _


class IPrincipalIdentifiedEvent(Interface):
    """An event that is sent after a principal has been recovered from the
    request's credentials.
    """
    principal = Attribute('The principal')
    request = Attribute('The request')


class ILoggedInEvent(Interface):
    """An event that is sent after someone has logged in.

    Exactly what this means will vary according to the type of login,
    primarily as to whether it is per-request or session-based.
    """
    request = Attribute('The request')
    login = Attribute(
        'The login id that was used.  For example, an email address.')


class CookieAuthLoggedInEvent:
    implements(ILoggedInEvent)
    def __init__(self, request, login):
        self.request = request
        self.login = login


class CookieAuthPrincipalIdentifiedEvent:
    implements(IPrincipalIdentifiedEvent)
    def __init__(self, principal, request):
        self.principal = principal
        self.request = request


class BasicAuthLoggedInEvent:
    implements(ILoggedInEvent, IPrincipalIdentifiedEvent)
    def __init__(self, request, login, principal):
        # these one from ILoggedInEvent
        self.login = login
        # this one from IPrincipalIdentifiedEvent
        self.principal = principal
        # this one from ILoggedInEvent and IPrincipalIdentifiedEvent
        self.request = request


class ILoggedOutEvent(Interface):
    """An event which gets sent after someone has logged out via a form."""


class LoggedOutEvent:
    implements(ILoggedOutEvent)
    def __init__(self, request):
        self.request = request


class IPlacelessAuthUtility(IAuthenticationService):
    """This is a marker interface for a utility that supplies the interface
    of the authentication service placelessly, with the addition of
    a method to allow the acquisition of a principal using his
    login name.
    """

    def getPrincipalByLogin(login):
        """Return a principal based on his login name."""


class IPlacelessLoginSource(IPrincipalSource):
    """This is a principal source that has no place.  It extends
    the pluggable auth IPrincipalSource interface, allowing for disparity
    between the user id and login name.
    """

    def getPrincipalByLogin(login):
        """Return a principal based on his login name."""

    def getPrincipals(name):
        """Not implemented.

        Get principals with matching names.
        See zope.app.pluggableauth.interfaces.IPrincipalSource
        """


class ILaunchpadPrincipal(IPrincipal):
    """Marker interface for launchpad principals.

    This is used for the launchpad.AnyPerson permission.
    """

#
# Browser notifications
#

class BrowserNotificationLevel:
    """Matches the standard logging levels, with the addition of notice
    (which we should probably add to our log levels as well)
    """
    DEBUG = logging.DEBUG     # A debugging message
    INFO = logging.INFO       # simple confirmation of a change
    NOTICE = logging.INFO + 5 # action had effects you might not have intended
    WARNING = logging.WARNING # action will not be successful unless you ...
    ERROR = logging.ERROR     # the previous action did not succeed, and why

    ALL_LEVELS = (DEBUG, INFO, NOTICE, WARNING, ERROR)


class INotification(Interface):
    level = Int(title=_('Level of notification'), required=True)
    message = Text(title=_('Message as an XHTML snippet'), required=True)


class INotificationList(Interface):

    created = Datetime(title=_('Time this notification was created'))

    def append(notification):
        """Add an INotification to the list of notifications"""

    def __getitem__(index_or_levelname):
        """Retrieve an INotification by index, or a list of INotification
        instances by level name (DEBUG, NOTICE, INFO, WARNING, ERROR).
        """

    def __iter__():
        """Iterate over list of INotification"""


class INotificationRequest(Interface):

    uuid = TextLine(
            description=u"Token used to lookup the notifications in the session"
            )

    notifications = Object(
        description=u"""
            Notifications received from previous request as well as any
            notifications added in the current request
            """,
        schema=INotificationList
        )

    def getNotifications(levels=BrowserNotificationLevel.ALL_LEVELS):
        """Retrieve a list of notifications, which are XHTML fragments.
         
        levels is a sequence of levels. Only the notifications with matching
        levels are returned. By default, all notifications are returned.
        Notifications are always returned in the order they were added.

        An empty list is returned if there are no matching notifications.

        An empty list is returned if there is no notification information
        in the query string, or if the notification parameter is invalid
        for the current user.
        """


class INotificationResponse(Interface):
    """This class is responsible for removing notifications that it assumes
    have been displayed to the user (ie. there was a lpnotifications in
    the request, but redirect has not been called). It is also responsible
    for checking all the notifications in the session and removing ones
    that are more than 30 minutes old.
    """

    uuid = TextLine(
            description=u"Token used to lookup the notifications in the session"
            )

    def addNotification(msg, level=BrowserNotificationLevel.NOTICE, **kw):
        """Append the given message to the list of notifications

        msg may be an XHTML fragment suitable for inclusion in a block
        tag such as <div>. It may also contain standard Python string
        replacement markers to be filled out by the keyword arguments
        (ie. %(foo)s). The keyword arguments inserted this way are
        automatically HTML quoted.

        level is one of the BrowserNotificationLevels: DEBUG, INFO, NOTICE,
        WARNING, ERROR.
        """

    notifications = Object(
            description=u"Notifications generated by current request",
            schema=INotificationList
            )

    def addDebugNotification(msg, **kw):
        """Shortcut to addNotification(msg, DEBUG, **kw)"""

    def addInfoNotification(msg, **kw):
        """Shortcut to addNotification(msg, INFO, **kw)"""

    def addNoticeNotification(msg, **kw):
        """Shortcut to addNotification(msg, NOTICE, **kw)"""

    def addWarningNotification(msg, **kw):
        """Shortcut to addNotification(msg, WARNING, **kw)"""

    def addErrorNotification(msg, **kw):
        """Shortcut to addNotification(msg, ERROR, **kw)"""

    def redirect(location, status=None):
        """As per IHTTPApplicationResponse.redirect, except notifications
        are preserved.
        """
 
