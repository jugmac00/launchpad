# Copyright 2010 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""Test the haproxy integration view."""

__metaclass__ = type
__all__ = []

from canonical.testing.layers import FunctionalLayer
from canonical.launchpad.webapp import haproxy
from canonical.launchpad.webapp.dbpolicy import (
    DatabaseBlockedPolicy,
    LaunchpadDatabasePolicyFactory,
    )
from canonical.launchpad.webapp.servers import LaunchpadTestRequest

from zope.app.testing.functional import HTTPCaller
from lp.testing import TestCase


class HAProxyIntegrationTest(TestCase):
    layer = FunctionalLayer

    def setUp(self):
        TestCase.setUp(self)
        self.http = HTTPCaller()
        self.original_flag = haproxy.going_down_flag
        self.addCleanup(haproxy.set_going_down_flag, self.original_flag)

    def test_HAProxyStatusView_all_good_returns_200(self):
        result = self.http(u'GET /+haproxy HTTP/1.0', handle_errors=False)
        self.assertEquals(200, result.getStatus())

    def test_HAProxyStatusView_going_down_returns_500(self):
        haproxy.set_going_down_flag(True)
        result = self.http(u'GET /+haproxy HTTP/1.0', handle_errors=False)
        self.assertEquals(500, result.getStatus())

    def test_haproxy_url_uses_DatabaseBlocked_policy(self):
        request = LaunchpadTestRequest(environ={'PATH_INFO': '/+haproxy'})
        policy = LaunchpadDatabasePolicyFactory(request)
        self.assertIsInstance(policy, DatabaseBlockedPolicy)

    def test_switch_going_down_flag(self):
        haproxy.set_going_down_flag(True)
        haproxy.switch_going_down_flag()
        self.assertEquals(False, haproxy.going_down_flag)
        haproxy.switch_going_down_flag()
        self.assertEquals(True, haproxy.going_down_flag)
