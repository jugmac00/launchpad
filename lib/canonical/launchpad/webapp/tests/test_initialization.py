# Copyright 2010 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""Tests post-zcml application initialization.

As found in canonical.launchpad.webapp.initialization.py."""

import unittest

from zope.component import getSiteManager
from zope.interface import Interface
from zope.publisher.interfaces.browser import IBrowserRequest
from zope.traversing.interfaces import ITraversable

from canonical.launchpad.webapp.errorlog import OopsNamespace
from canonical.launchpad.webapp.servers import LaunchpadTestRequest
from canonical.testing.layers import FunctionalLayer
from lp.testing import TestCase


class AnyObject:
    pass


class TestURLNamespace(TestCase):

    layer = FunctionalLayer

    def setUp(self):
        TestCase.setUp(self)
        self.sm = getSiteManager()
        self.context = AnyObject()
        self.request = LaunchpadTestRequest()

    def test_oops_namespace_not_view(self):
        # The ++oops++ namespace should not be available as a "oops" view.
        # First, we will verify that it is available as a namespace.
        namespace = self.sm.getMultiAdapter(
            (self.context, self.request), ITraversable, 'oops')
        self.failUnless(isinstance(namespace, OopsNamespace))
        # However, it is not available as a view.
        not_a_namespace = self.sm.queryMultiAdapter(
            (self.context, self.request), Interface, 'oops')
        self.failIf(isinstance(not_a_namespace, OopsNamespace))

    def test_no_namespaces_are_views(self):
        # This tests an abstract superset of test_oops_namespace_not_view.
        # At the time of writing, namespaces were 'resource', 'oops', 'form',
        # and 'view'.
        namespace_info = self.sm.adapters.lookupAll(
            (Interface, IBrowserRequest), ITraversable)
        import pdb; pdb.set_trace(); # DO NOT COMMIT
        for name, factory in namespace_info:
            try:
                not_the_namespace_factory = self.sm.adapters.lookup(
                    (Interface, IBrowserRequest), Interface, name)
            except LookupError,e:
                import pdb; pdb.set_trace(); # DO NOT COMMIT
                print e
                pass
            else:
                self.assertNotEqual(factory, not_the_namespace_factory)


def test_suite():
    suite = unittest.TestLoader().loadTestsFromName(__name__)
    return suite
