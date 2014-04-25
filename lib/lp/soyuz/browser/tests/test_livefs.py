# Copyright 2014 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""Test live filesystem navigation."""

__metaclass__ = type

from lp.services.features.testing import FeatureFixture
from lp.soyuz.interfaces.livefs import LIVEFS_FEATURE_FLAG
from lp.testing import TestCaseWithFactory
from lp.testing.layers import DatabaseFunctionalLayer
from lp.testing.publication import test_traverse


class TestLiveFSNavigation(TestCaseWithFactory):

    layer = DatabaseFunctionalLayer

    def setUp(self):
        super(TestLiveFSNavigation, self).setUp()
        self.useFixture(FeatureFixture({LIVEFS_FEATURE_FLAG: u"on"}))

    def test_livefs(self):
        livefs = self.factory.makeLiveFS()
        obj, _, _ = test_traverse(
            "http://api.launchpad.dev/devel/~%s/+livefs/%s/%s/%s" % (
                livefs.owner.name, livefs.distroseries.distribution.name,
                livefs.distroseries.name, livefs.name))
        self.assertEqual(livefs, obj)
