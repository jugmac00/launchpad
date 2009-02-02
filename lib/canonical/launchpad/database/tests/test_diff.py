# Copyright 2008 Canonical Ltd.  All rights reserved.

"""Tests for Diff, etc."""

__metaclass__ = type


from unittest import TestLoader

from canonical.testing import (
    DatabaseFunctionalLayer, LaunchpadFunctionalLayer, LaunchpadZopelessLayer)
import transaction

from canonical.launchpad.database.diff import Diff, StaticDiff
from canonical.launchpad.interfaces.diff import (
    IDiff, IPreviewDiff, IStaticDiff, IStaticDiffSource)
from canonical.launchpad.testing import login_person, TestCaseWithFactory
from canonical.launchpad.webapp import canonical_url
from canonical.launchpad.webapp.testing import verifyObject


class TestDiff(TestCaseWithFactory):

    layer = DatabaseFunctionalLayer

    def test_providesInterface(self):
        verifyObject(IDiff, Diff())


class TestStaticDiff(TestCaseWithFactory):
    """Test that StaticDiff objects work."""

    layer = LaunchpadZopelessLayer

    def test_providesInterface(self):
        verifyObject(IStaticDiff, StaticDiff())

    def test_providesSourceInterface(self):
        verifyObject(IStaticDiffSource, StaticDiff)

    def test_acquire_existing(self):
        """Ensure that acquire returns the existing StaticDiff."""
        self.useBzrBranches()
        branch, tree = self.create_branch_and_tree()
        tree.commit('First commit', rev_id='rev1')
        diff1 = StaticDiff.acquire('null:', 'rev1', tree.branch.repository)
        diff2 = StaticDiff.acquire('null:', 'rev1', tree.branch.repository)
        self.assertIs(diff1, diff2)

    def test_acquire_existing_different_repo(self):
        """The existing object is used even if the repository is different."""
        self.useBzrBranches()
        branch1, tree1 = self.create_branch_and_tree('tree1')
        tree1.commit('First commit', rev_id='rev1')
        branch2, tree2 = self.create_branch_and_tree('tree2')
        tree2.pull(tree1.branch)
        diff1 = StaticDiff.acquire('null:', 'rev1', tree1.branch.repository)
        diff2 = StaticDiff.acquire('null:', 'rev1', tree2.branch.repository)
        self.assertTrue(diff1 is diff2)

    def test_acquire_nonexisting(self):
        """A new object is created if there is no existant matching object."""
        self.useBzrBranches()
        branch, tree = self.create_branch_and_tree()
        tree.commit('First commit', rev_id='rev1')
        tree.commit('Next commit', rev_id='rev2')
        diff1 = StaticDiff.acquire('null:', 'rev1', tree.branch.repository)
        diff2 = StaticDiff.acquire('rev1', 'rev2', tree.branch.repository)
        self.assertIsNot(diff1, diff2)

    def test_acquireFromText(self):
        """acquireFromText works as expected.

        It creates a new object if there is none, but uses the existing one
        if possible.
        """
        diff_a = 'a'
        diff_b = 'b'
        static_diff = StaticDiff.acquireFromText('rev1', 'rev2', diff_a)
        self.assertEqual('rev1', static_diff.from_revision_id)
        self.assertEqual('rev2', static_diff.to_revision_id)
        static_diff2 = StaticDiff.acquireFromText('rev1', 'rev2', diff_b)
        self.assertIs(static_diff, static_diff2)

    def test_acquireFromTextEmpty(self):
        static_diff = StaticDiff.acquireFromText('rev1', 'rev2', '')
        self.assertEqual('', static_diff.diff.text)

    def test_acquireFromTextNonEmpty(self):
        static_diff = StaticDiff.acquireFromText('rev1', 'rev2', 'abc')
        transaction.commit()
        self.assertEqual('abc', static_diff.diff.text)


class TestPreviewDiff(TestCaseWithFactory):
    """Test that StaticDiff objects work."""

    layer = LaunchpadFunctionalLayer

    def _createProposalWithPreviewDiff(self):
        # Create and return a preview diff.
        mp = self.factory.makeBranchMergeProposal()
        login_person(mp.registrant)
        mp.updateMergeDiff('content', u'stat', u'rev-a', u'rev-b')
        # Make sure the librarian file is written.
        transaction.commit()
        return mp

    def test_providesInterface(self):
        # In order to test the interface provision, we need to make sure that
        # the associated diff object that is delegated to is also created.
        mp = self._createProposalWithPreviewDiff()
        verifyObject(IPreviewDiff, mp.merge_diff)

    def test_canonicalUrl(self):
        # The canonical_url of the merge diff is '+preview' after the
        # canonical_url of the merge proposal itself.
        mp = self._createProposalWithPreviewDiff()
        self.assertEqual(
            canonical_url(mp) + '/+preview',
            canonical_url(mp.merge_diff))


def test_suite():
    return TestLoader().loadTestsFromName(__name__)
