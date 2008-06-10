# Copyright 2007 Canonical Ltd.  All rights reserved.

__metaclass__ = type

import operator
import os
import subprocess
import sys
import unittest

from zope.component import getUtility

from canonical.config import config
from canonical.database.sqlbase import flush_database_updates
from canonical.testing import LaunchpadLayer
from canonical.launchpad.interfaces import (
    IDistributionSet, DistroSeriesStatus)
from canonical.launchpad.scripts.base import LaunchpadScriptFailure
from canonical.launchpad.scripts.ftpmaster import LpQueryDistro
from canonical.testing import LaunchpadZopelessLayer


class TestLpQueryDistroScript(unittest.TestCase):
    """Test the lp-query-distro.py script."""
    layer = LaunchpadLayer

    def runLpQueryDistro(self, extra_args=None):
        """Run lp-query.distro.py, returning the result and output.

        Returns a tuple of the process's return code, stdout output and
        stderr output.
        """
        if extra_args is None:
            extra_args = []
        script = os.path.join(
            config.root, "scripts", "ftpmaster-tools", "lp-query-distro.py")
        args = [sys.executable, script]
        args.extend(extra_args)
        process = subprocess.Popen(
            args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        stdout, stderr = process.communicate()
        return (process.returncode, stdout, stderr)

    def testSimpleRun(self):
        """Try a simple lp-query-distro.py run.

        Check that:
         * return code is ZERO,
         * standard error is empty
         * standard output contains only the 'current distroseries' name
        """
        returncode, out, err = self.runLpQueryDistro(
            extra_args=['current'])

        self.assertEqual(
            0, returncode, "\nScript Failed:%s\nStdout:\n%s\nStderr\n%s\n"
            % (returncode, out, err))
        self.assertEqual(out.strip(), 'warty')
        self.assertEqual(err.strip(), '')

    def testMissingAction(self):
        """Making lp-query-distro.py to fail by not passing an action.

        Check that:
         * return code is ONE,
         * standard output is empty
         * standard error contains the additional information about the failure.
        """
        returncode, out, err = self.runLpQueryDistro(
            extra_args=[])

        self.assertEqual(
            1, returncode, "\nScript didn't fail:%s\nStdout:\n%s\nStderr\n%s\n"
            % (returncode, out, err))
        self.assertEqual(out.strip(), '')
        self.assertEqual(err.strip(), 'ERROR   <action> is required')

    def testUnknownAction(self):
        """Making lp-query-distro.py to fail by passing an unknown action.

        Check if:
         * return code is ONE,
         * standard output is empty
         * standard error contains the additional information about the failure.
        """
        returncode, out, err = self.runLpQueryDistro(
            extra_args=['nahhh'])

        self.assertEqual(
            1, returncode, "\nScript didn't fail:%s\nStdout:\n%s\nStderr\n%s\n"
            % (returncode, out, err))
        self.assertEqual(out.strip(), '')
        self.assertEqual(err.strip(), 'ERROR   Action "nahhh" is not supported')

    def testUnexpectedArgument(self):
        """Making lp-query-distro.py to fail by passing unexpected action.

        Check if:
         * return code is ONE,
         * standard output is empty
         * standard error contains the additional information about the failure.
        """
        returncode, out, err = self.runLpQueryDistro(
            extra_args=['-s', 'hoary', 'current'])

        self.assertEqual(
            1, returncode, "\nScript didn't fail:%s\nStdout:\n%s\nStderr\n%s\n"
            % (returncode, out, err))
        self.assertEqual(out.strip(), '')
        self.assertEqual(
            err.strip(), 'ERROR   Action does not accept defined suite.')


class TestLpQueryDistro(unittest.TestCase):
    """Test the LpQueryDistro class."""
    layer = LaunchpadZopelessLayer

    def setUp(self):
        self.test_output = None
        self.ubuntu = getUtility(IDistributionSet)['ubuntu']

    def getLpQueryDistro(self, test_args=None):
        """Return a built and LpQueryDistro object."""
        lp_query_distro = LpQueryDistro(
            name='testing-lpquerydistro', test_args=test_args)
        return lp_query_distro

    def presenter(self, *args):
        """Test result presenter.

        It stores results in self.test_output for later test-inspection.
        """
        self.test_output = '%s' % args

    def testSuccessfullyAction(self):
        """Check if the 'current' action is executed sucessfully."""
        helper = self.getLpQueryDistro(test_args=['current'])
        helper.runAction(presenter=self.presenter)
        warty = self.ubuntu['warty']
        self.assertEqual(warty.status.name, 'CURRENT')
        self.assertEqual(helper.location.distribution.name, u'ubuntu')
        self.assertEqual(self.test_output, u'warty')

    def testDevelopmentAndFrozenDistroSeries(self):
        """Check if the 'developement' action copes with FROZEN distroseries."""
        helper = self.getLpQueryDistro(test_args=['development'])
        helper.runAction(presenter=self.presenter)
        hoary = self.ubuntu['hoary']
        self.assertEqual(hoary.status.name, 'DEVELOPMENT')
        self.assertEqual(helper.location.distribution.name, u'ubuntu')
        self.assertEqual(self.test_output, u'hoary')

        hoary.status = DistroSeriesStatus.FROZEN
        flush_database_updates()

        helper = self.getLpQueryDistro(test_args=['development'])
        helper.runAction(presenter=self.presenter)
        self.assertEqual(hoary.status.name, 'FROZEN')
        self.assertEqual(helper.location.distribution.name, u'ubuntu')
        self.assertEqual(self.test_output, u'hoary')

    def testUnknownAction(self):
        """'runAction' should fail for an unknown action."""
        helper = self.getLpQueryDistro(test_args=['boom'])
        self.assertRaises(LaunchpadScriptFailure,
                          helper.runAction, self.presenter)

    def testMissingAction(self):
        """'runAction' should fail for an missing action request."""
        helper = self.getLpQueryDistro(test_args=[])
        self.assertRaises(LaunchpadScriptFailure,
                          helper.runAction, self.presenter)

    def testUnexpectedArgument(self):
        """'runAction' should fail for an unexpected argument request.

        Some actions do not allow passing 'suite'.
        See testActionswithDefinedSuite for further information.
        """
        helper = self.getLpQueryDistro(test_args=['-s', 'hoary', 'current'])
        self.assertRaises(LaunchpadScriptFailure,
                          helper.runAction, self.presenter)

    def testDefaultContextLocation(self):
        """Check the default location context."""
        helper = self.getLpQueryDistro(test_args=[])
        helper._buildLocation()

        self.assertEqual(helper.location.distribution.name, u'ubuntu')
        self.assertEqual(helper.location.distroseries.name, u'hoary')
        self.assertEqual(helper.location.pocket.name, 'RELEASE')

    def testLocationFailures(self):
        """Location failures are wraped into LaunchpadScriptfailure."""
        # Unknown distribution.
        helper = self.getLpQueryDistro(test_args=['-d', 'foobar'])
        self.assertRaises(LaunchpadScriptFailure, helper._buildLocation)
        # Unknown distroseries.
        helper = self.getLpQueryDistro(test_args=['-s', 'biscuit'])
        self.assertRaises(LaunchpadScriptFailure, helper._buildLocation)
        # Unknown pocket.
        helper = self.getLpQueryDistro(test_args=['-s', 'hoary-biscuit'])
        self.assertRaises(LaunchpadScriptFailure, helper._buildLocation)

    def testActionsWithUndefinedSuite(self):
        """Check the actions supposed to work with undefined suite.

        Only 'current', 'development' and 'supported' work with undefined
        suite.
        The other actions ('archs', 'official_arch', 'nominated_arch_indep')
        will assume the CURRENT distroseries in context.
        """
        helper = self.getLpQueryDistro(test_args=[])
        helper._buildLocation()

        self.assertEqual(helper.get_current, 'warty')
        self.assertEqual(helper.get_development, 'hoary')
        self.assertEqual(helper.get_supported, 'hoary warty')
        self.assertEqual(helper.get_pending_suites, 'warty')
        self.assertEqual(helper.get_archs, 'hppa i386')
        self.assertEqual(helper.get_official_archs, 'i386')
        self.assertEqual(helper.get_nominated_arch_indep, 'i386')

    def testActionsWithDefinedSuite(self):
        """Opposite of  testActionsWithUndefinedSuite.

        Only some actions ('archs', 'official_arch', 'nominated_arch_indep')
        work with defined suite, the other actions ('current', 'development'
        and 'supported') will raise LaunchpadScriptError if the suite is
        defined.
        """
        helper = self.getLpQueryDistro(test_args=['-s', 'warty'])
        helper._buildLocation()

        self.assertRaises(
            LaunchpadScriptFailure, operator.attrgetter('get_current'),
            helper)
        self.assertRaises(
            LaunchpadScriptFailure, operator.attrgetter('get_development'),
            helper)
        self.assertRaises(
            LaunchpadScriptFailure, operator.attrgetter('get_supported'),
            helper)
        self.assertRaises(
            LaunchpadScriptFailure, operator.attrgetter('get_pending_suites'),
            helper)
        self.assertEqual(helper.get_archs, 'hppa i386')
        self.assertEqual(helper.get_official_archs, 'i386')
        self.assertEqual(helper.get_nominated_arch_indep, 'i386')


def test_suite():
    return unittest.TestLoader().loadTestsFromName(__name__)
