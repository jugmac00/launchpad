# Copyright 2009-2010 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""Tests for Config.py"""

__metaclass__ = type

from zope.component import getUtility

from canonical.config import config
from canonical.launchpad.interfaces import IDistributionSet
from canonical.testing.layers import LaunchpadZopelessLayer
from lp.archivepublisher.config import (
    Config,
    LucilleConfigError,
    )
from lp.testing import TestCaseWithFactory


class TestConfig(TestCaseWithFactory):
    layer = LaunchpadZopelessLayer

    def setUp(self):
        super(TestConfig, self).setUp()
        self.layer.switchDbUser(config.archivepublisher.dbuser)
        self.ubuntutest = getUtility(IDistributionSet)['ubuntutest']

    def testMissingDistroSeries(self):
        distroseries = self.factory.makeDistroSeries(
            distribution=self.ubuntutest, name="somename")
        d = Config(self.ubuntutest)
        dsns = d.publishable_series
        self.assertEquals(len(dsns), 2)
        self.assertIn("breezy-autotest", dsns)
        self.assertIn("hoary-test", dsns)
        self.assertNotIn("somename", dsns)

    def testInstantiate(self):
        """Config should instantiate"""
        d = Config(self.ubuntutest)

    def testDistroName(self):
        """Config should be able to return the distroName"""
        d = Config(self.ubuntutest)
        self.assertEqual(d.distroName, "ubuntutest")

    def testDistroSeriesNames(self):
        """Config should return two distroseries names"""
        d = Config(self.ubuntutest)
        dsns = d.publishable_series
        self.assertEquals(len(dsns), 2)
        self.assertIn("breezy-autotest", dsns)
        self.assertIn("hoary-test", dsns)

    def testDistroConfig(self):
        """Config should have parsed a distro config"""
        d = Config(self.ubuntutest)
        # NOTE: Add checks here when you add stuff in util.py
        self.assertEquals(d.stayofexecution, 5)
