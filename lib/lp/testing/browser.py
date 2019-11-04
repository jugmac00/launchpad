# Copyright 2009-2019 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""A real, socket connecting browser.

This browser performs actual socket connections to a real HTTP server.  This
is used in tests which utilize the AppServerLayer to run the app server in a
child process.  The Zope testing browser fakes its connections in-process, so
that's not good enough.
"""

__metaclass__ = type
__all__ = [
    'setUp',
    ]

import ssl

from lazr.uri import URI
import transaction
from urllib3 import PoolManager
from wsgiproxy.proxies import TransparentProxy
from wsgiproxy.urllib3_client import HttpClient
from zope.testbrowser.wsgi import (
    AuthorizationMiddleware,
    Browser as _Browser,
    )

from lp.testing.pages import (
    extract_text,
    find_main_content,
    find_tag_by_id,
    print_feedback_messages,
    )


class TransactionMiddleware:
    """Middleware to commit the current transaction before the test.

    This is like `zope.app.wsgi.TransactionMiddleware`, but avoids ZODB.
    """

    def __init__(self, app):
        self.app = app

    def __call__(self, environ, start_response):
        transaction.commit()
        for entry in self.app(environ, start_response):
            yield entry


class Browser(_Browser):

    def __init__(self, url=None, wsgi_app=None):
        if wsgi_app is None:
            # urllib3 is carefully-chosen: both the httplib and requests
            # clients incorrectly comma-join multiple Set-Cookie headers, at
            # least on Python 2.7, which causes failures in some of the
            # +login tests.  However, we have to go to a bit of effort to
            # disable certificate verification to avoid problems with e.g.
            # +logout redirecting to https://bazaar.launchpad.test/+logout.
            client = HttpClient(pool=PoolManager(10, cert_reqs=ssl.CERT_NONE))
            wsgi_app = AuthorizationMiddleware(
                TransactionMiddleware(
                    TransparentProxy(client=client)))
        super(Browser, self).__init__(url=url, wsgi_app=wsgi_app)

    @property
    def vhost(self):
        uri = URI(self.url)
        return '%s://%s' % (uri.scheme, uri.host)

    @property
    def rooturl(self):
        uri = URI(self.url)
        return '%s://%s:%s' % (uri.scheme, uri.host, uri.port)

    @property
    def urlpath(self):
        uri = URI(self.url)
        return uri.path


def setUp(test):
    """Set up appserver tests."""
    test.globs['Browser'] = Browser
    test.globs['browser'] = Browser()
    test.globs['find_tag_by_id'] = find_tag_by_id
    test.globs['find_main_content'] = find_main_content
    test.globs['print_feedback_messages'] = print_feedback_messages
    test.globs['extract_text'] = extract_text
