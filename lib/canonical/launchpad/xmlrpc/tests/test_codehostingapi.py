# Copyright 2007 Canonical Ltd.  All rights reserved.

"""Unit tests for the public codehosting API."""

__metaclass__ = type
__all__ = []


import os
import unittest

from zope.component import getUtility
from zope.security.proxy import removeSecurityProxy

from canonical.codehosting.tests.helpers import BranchTestCase
from canonical.launchpad.ftests import login, logout, ANONYMOUS
from canonical.launchpad.interfaces import BranchType
from canonical.launchpad.webapp.uri import URI
from canonical.launchpad.xmlrpc.branch import PublicCodehostingAPI
from canonical.launchpad.xmlrpc import faults


class TestExpandURL(BranchTestCase):
    """Test the way that URLs are expanded."""

    def setUp(self):
        BranchTestCase.setUp(self)
        login(ANONYMOUS)
        self.addCleanup(logout)
        self.api = PublicCodehostingAPI(None, None)
        # BranchType is only signficiant insofar as it is non-IMPORTED.
        self.trunk = self.makeBranch(BranchType.HOSTED)
        self.project = self.trunk.product
        self.owner = self.trunk.owner
        # Make sure that self.project's development focus has an actual branch
        # associated with it. We removeSecurityProxy so that we can assign
        # directly to user_branch.
        series = removeSecurityProxy(self.project).development_focus
        series.user_branch = self.trunk

    def assertResolves(self, lp_url_path, unique_name):
        """Assert that the given lp URL path expands to the unique name of
        'branch'.
        """
        results = self.api.resolve_lp_path(lp_url_path)
        # This improves the error message if results happens to be a fault.
        if isinstance(results, faults.LaunchpadFault):
            raise results
        for url in results['urls']:
            self.assertEqual('/' + unique_name, URI(url).path)

    def assertFault(self, lp_url_path, expected_fault):
        """Assert that trying to resolve lp_url_path returns the expected
        fault.
        """
        fault = self.api.resolve_lp_path(lp_url_path)
        self.assertEqual(expected_fault.__class__, fault.__class__)
        self.assertEqual(expected_fault.faultString, fault.faultString)

    def test_resultDict(self):
        """A given lp url path maps to a single branch available from a number
        of URLs (mostly varying by scheme). resolve_lp_path returns a dict
        containing a list of these URLs, with the faster and more featureful
        URLs earlier in the list. We use a dict so we can easily add more
        information in the future.
        """
        results = self.api.resolve_lp_path(self.project.name)
        urls = [
            'bzr+ssh://bazaar.launchpad.dev/%s' % self.trunk.unique_name,
            'sftp://bazaar.launchpad.dev/%s' % self.trunk.unique_name,
            'http://bazaar.launchpad.dev/%s' % self.trunk.unique_name]
        self.assertEqual(dict(urls=urls), results)

    def test_projectOnly(self):
        """lp:project expands to the branch associated with development focus
        of the project.
        """
        self.assertResolves(self.project.name, self.trunk.unique_name)

    def test_projectDoesntExist(self):
        """Return a NoSuchProduct fault if the product doesn't exist."""
        self.assertFault(
            'doesntexist', faults.NoSuchProduct('doesntexist'))
        self.assertFault(
            'doesntexist/trunk', faults.NoSuchProduct('doesntexist'))

    def test_projectAndSeries(self):
        """lp:project/series expands to the branch associated with the product
        series 'series' on 'project'.
        """
        self.assertResolves(
            '%s/%s' % (self.project.name,
                       self.project.development_focus.name),
            self.project.development_focus.user_branch.unique_name)

    def test_seriesHasNoBranch(self):
        """Return a NoBranchForSeries fault if the series has no branch
        associated with it.
        """
        project = self.makeProduct()
        self.assertEqual(None, project.development_focus.user_branch)
        self.assertFault(
            project.name, faults.NoBranchForSeries(project.development_focus))
        self.assertFault(
            '%s/%s' % (project.name, project.development_focus.name),
            faults.NoBranchForSeries(project.development_focus))

    def test_noSuchSeries(self):
        """Return a NoSuchSeries fault there is no series of the given name
        associated with the project.
        """
        self.assertFault(
            '%s/%s' % (self.project.name, "doesntexist"),
            faults.NoSuchSeries("doesntexist", self.project))

    def test_branch(self):
        """The unique name of a branch resolves to the unique name of the
        branch.
        """
        self.assertResolves(self.trunk.unique_name, self.trunk.unique_name)

    def test_noSuchBranch(self):
        """Resolve paths to branches even if there is no branch of that name.

        We do this so that users can push new branches to lp: URLs.
        """
        nonexistent_branch = '~%s/%s/doesntexist' % (
            self.owner.name, self.project.name)
        self.assertResolves(nonexistent_branch, nonexistent_branch)

    def test_resolveBranchWithNoSuchProject(self):
        """If we try to resolve a branch that refers to a non-existent
        project, then we return a NoSuchProduct fault.
        """
        nonexistent_project_branch = "~%s/doesntexist/%s" % (
            self.owner.name, self.getUniqueString())
        self.assertFault(
            nonexistent_project_branch, faults.NoSuchProduct('doesntexist'))

    def test_resolveBranchWithNoSuchOwner(self):
        """If we try to resolve a branch that refers to a non-existent owner,
        then we return a NoSuchPerson fault.
        """
        nonexistent_owner_branch = "~doesntexist/%s/%s" % (
            self.getUniqueString(), self.getUniqueString())
        self.assertFault(
            nonexistent_owner_branch, faults.NoSuchPerson('doesntexist'))

    def test_tooManySegments(self):
        """If we have more segments than are necessary to refer to a branch,
        then attach these segments to the resolved url.

        We do this so that users can do operations like 'bzr cat
        lp:path/to/branch/README.txt'.
        """
        longer_path = os.path.join(self.trunk.unique_name, 'qux')
        self.assertResolves(longer_path, longer_path)

    def test_emptyPath(self):
        """An empty path is an invalid identifier."""
        self.assertFault('', faults.InvalidBranchIdentifier(''))

    def test_missingTilde(self):
        """If it looks like a branch's unique name, but is missing a tilde,
        then it is an invalid branch identifier.
        """
        self.assertFault(
            'foo/bar/baz', faults.InvalidBranchIdentifier('foo/bar/baz'))
        self.assertFault(
            'foo/bar/baz/qux',
            faults.InvalidBranchIdentifier('foo/bar/baz'))

        # Should be invalid even if the branch exists.
        unique_name = self.trunk.unique_name.lstrip('~')
        self.assertFault(
            unique_name, faults.InvalidBranchIdentifier(unique_name))

    def test_allSlashes(self):
        """A path of all slashes is an invalid identifier."""
        self.assertFault('///', faults.InvalidBranchIdentifier('///'))

    def test_trailingSlashes(self):
        """Trailing slashes are trimmed."""
        self.assertResolves(self.project.name + '/', self.trunk.unique_name)
        self.assertResolves(self.project.name + '//', self.trunk.unique_name)
        self.assertResolves(
            self.trunk.unique_name + '/', self.trunk.unique_name)
        self.assertResolves(
            self.trunk.unique_name + '//', self.trunk.unique_name)

    def test_privateBranch(self):
        """We resolve invisible branches just like visible branches.

        This is OK, because by resolving the lp url path, we don't give any
        information away about the branch.
        """
        naked_trunk = removeSecurityProxy(self.trunk)
        naked_trunk.private = True
        self.assertResolves(
            naked_trunk.unique_name, naked_trunk.unique_name)
        self.assertFault(
            self.project.name,
            faults.NoBranchForSeries(self.project.development_focus))

    def test_remoteBranch(self):
        """For remote branches, return results that link to the actual remote
        branch URL.
        """
        branch = self.makeBranch(BranchType.REMOTE)
        result = self.api.resolve_lp_path(branch.unique_name)
        self.assertEqual([branch.url], result['urls'])


def test_suite():
    return unittest.TestLoader().loadTestsFromName(__name__)
