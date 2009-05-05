# Copyright 2009 Canonical Ltd.  All rights reserved.

"""Tests for the scanner's merge detection."""

__metaclass__ = type

import logging
import unittest

from bzrlib.revision import NULL_REVISION
import transaction

from zope.component import getUtility

from canonical.codehosting.scanner.bzrsync import BzrSync
from canonical.codehosting.scanner import events
from canonical.codehosting.scanner.fixture import make_zope_event_fixture
from canonical.codehosting.scanner import mergedetection
from canonical.codehosting.scanner.tests.test_bzrsync import (
    BzrSyncTestCase, run_as_db_user)
from canonical.config import config
from lp.code.interfaces.branch import BranchLifecycleStatus
from lp.code.interfaces.branchlookup import IBranchLookup
from lp.code.interfaces.branchmergeproposal import (
    BranchMergeProposalStatus)
from canonical.launchpad.testing import TestCaseWithFactory
from canonical.testing import LaunchpadZopelessLayer


class TestAutoMergeDetectionForMergeProposals(BzrSyncTestCase):
    """Test the scanner's ability to mark merge proposals as merged."""

    def setUp(self):
        BzrSyncTestCase.setUp(self)
        fixture = make_zope_event_fixture(
            mergedetection.auto_merge_branches,
            mergedetection.auto_merge_proposals)
        fixture.setUp()
        self.addCleanup(fixture.tearDown)

    @run_as_db_user(config.launchpad.dbuser)
    def createProposal(self, source, target):
        # The scanner doesn't have insert rights, so do it here.
        proposal = source.addLandingTarget(source.owner, target)
        transaction.commit()

    def _createBranchesAndProposal(self):
        # Create two branches where the trunk has the branch as a merge.  Also
        # create a merge proposal from the branch to the trunk.
        (db_trunk, trunk_tree), (db_branch, branch_tree) = (
            self.makeBranchWithMerge('base', 'trunk', 'branch', 'merge'))
        trunk_id = db_trunk.id
        branch_id = db_branch.id
        self.createProposal(db_branch, db_trunk)
        # Reget the objects due to transaction boundary.
        branch_lookup = getUtility(IBranchLookup)
        db_trunk = branch_lookup.get(trunk_id)
        db_branch = branch_lookup.get(branch_id)
        proposal = list(db_branch.landing_targets)[0]
        return proposal, db_trunk, db_branch, branch_tree

    def _scanTheBranches(self, branch1, branch2):
        for branch in (branch1, branch2):
            scanner = self.makeBzrSync(branch)
            scanner.syncBranchAndClose()

    def test_auto_merge_proposals_real_merge(self):
        # If there is a merge proposal where the tip of the source is in the
        # ancestry of the target, mark it as merged.
        proposal, db_trunk, db_branch, branch_tree = (
            self._createBranchesAndProposal())

        self._scanTheBranches(db_branch, db_trunk)
        # The proposal should now be merged.
        self.assertEqual(
            BranchMergeProposalStatus.MERGED,
            proposal.queue_status)

    def test_auto_merge_proposals_real_merge_target_scanned_first(self):
        # If there is a merge proposal where the tip of the source is in the
        # ancestry of the target, mark it as merged.
        proposal, db_trunk, db_branch, branch_tree = (
            self._createBranchesAndProposal())

        self._scanTheBranches(db_trunk, db_branch)
        # The proposal should now be merged.
        self.assertEqual(
            BranchMergeProposalStatus.MERGED,
            proposal.queue_status)

    def test_auto_merge_proposals_rejected_proposal(self):
        # If there is a merge proposal where the tip of the source is in the
        # ancestry of the target but the proposal is in a final state the
        # proposal is not marked as merged.

        proposal, db_trunk, db_branch, branch_tree = (
            self._createBranchesAndProposal())

        proposal.rejectBranch(db_trunk.owner, 'branch')

        self._scanTheBranches(db_branch, db_trunk)

        # The proposal should stay rejected..
        self.assertEqual(
            BranchMergeProposalStatus.REJECTED,
            proposal.queue_status)

    def test_auto_merge_proposals_rejected_proposal_target_scanned_first(self):
        # If there is a merge proposal where the tip of the source is in the
        # ancestry of the target but the proposal is in a final state the
        # proposal is not marked as merged.

        proposal, db_trunk, db_branch, branch_tree = (
            self._createBranchesAndProposal())

        proposal.rejectBranch(db_trunk.owner, 'branch')

        self._scanTheBranches(db_trunk, db_branch)

        # The proposal should stay rejected..
        self.assertEqual(
            BranchMergeProposalStatus.REJECTED,
            proposal.queue_status)

    def test_auto_merge_proposals_not_merged_proposal(self):
        # If there is a merge proposal where the tip of the source is not in
        # the ancestry of the target it is not marked as merged.

        proposal, db_trunk, db_branch, branch_tree = (
            self._createBranchesAndProposal())

        branch_tree.commit(u'another revision', rev_id='another-rev')
        current_proposal_status = proposal.queue_status
        self.assertNotEqual(
            current_proposal_status,
            BranchMergeProposalStatus.MERGED)

        self._scanTheBranches(db_branch, db_trunk)

        # The proposal should stay in the same state.
        self.assertEqual(current_proposal_status, proposal.queue_status)

    def test_auto_merge_proposals_not_merged_with_updated_source(self):
        # If there is a merge proposal where the tip of the source is not in
        # the ancestry of the target it is not marked as merged.

        proposal, db_trunk, db_branch, branch_tree = (
            self._createBranchesAndProposal())

        branch_tree.commit(u'another revision', rev_id='another-rev')
        current_proposal_status = proposal.queue_status
        self.assertNotEqual(
            current_proposal_status,
            BranchMergeProposalStatus.MERGED)

        self._scanTheBranches(db_trunk, db_branch)

        # The proposal should stay in the same state.
        self.assertEqual(current_proposal_status, proposal.queue_status)


class TestMergeDetection(TestCaseWithFactory):
    """Test that the merges are detected, and the handler called."""

    layer = LaunchpadZopelessLayer

    def setUp(self):
        TestCaseWithFactory.setUp(self)
        self.product = self.factory.makeProduct()
        self.db_branch = self.factory.makeProductBranch(product=self.product)
        self.bzrsync = BzrSync(transaction, self.db_branch)
        # Replace the built-in merge_detected with our test stub.
        self._original_merge_detected = mergedetection.merge_detected
        mergedetection.merge_detected = self.mergeDetected
        # Reset the recorded branches.
        self.merges = []

    def tearDown(self):
        mergedetection.merge_detected = self._original_merge_detected
        TestCaseWithFactory.tearDown(self)

    def autoMergeBranches(self, db_branch, bzr_ancestry):
        mergedetection.auto_merge_branches(
            events.ScanCompleted(
                db_branch=db_branch, bzr_branch=None, bzr_ancestry=['revid'],
                logger=None))

    def mergeDetected(self, logger, source, target):
        # Record the merged branches
        self.merges.append((source, target))

    def test_own_branch_not_emitted(self):
        # A merge is never emitted with the source branch being the same as
        # the target branch.
        self.db_branch.last_scanned_id = 'revid'
        self.autoMergeBranches(self.db_branch, ['revid'])
        self.assertEqual([], self.merges)

    def test_branch_tip_in_ancestry(self):
        # If there is another branch with their tip revision id in the
        # ancestry passed in, the merge detection is emitted.
        source = self.factory.makeProductBranch(product=self.product)
        source.last_scanned_id = 'revid'
        self.autoMergeBranches(self.db_branch, ['revid'])
        self.assertEqual([(source, self.db_branch)], self.merges)

    def test_branch_tip_in_ancestry_status_merged(self):
        # Branches that are already merged do emit events.
        source = self.factory.makeProductBranch(
            product=self.product,
            lifecycle_status=BranchLifecycleStatus.MERGED)
        source.last_scanned_id = 'revid'
        self.autoMergeBranches(self.db_branch, ['revid'])
        self.assertEqual([], self.merges)

    def test_other_branch_with_no_last_scanned_id(self):
        # Other branches for the product are checked, but if the tip revision
        # of the branch is not yet been set no merge event is emitted for that
        # branch.
        source = self.factory.makeProductBranch(product=self.product)
        self.autoMergeBranches(self.db_branch, ['revid'])
        self.assertEqual([], self.merges)

    def test_other_branch_with_NULL_REVISION_last_scanned_id(self):
        # Other branches for the product are checked, but if the tip revision
        # of the branch is the NULL_REVISION no merge event is emitted for
        # that branch.
        source = self.factory.makeProductBranch(product=self.product)
        source.last_scanned_id = NULL_REVISION
        self.autoMergeBranches(self.db_branch, ['revid'])
        self.assertEqual([], self.merges)

    def test_other_branch_same_tip_revision_not_emitted(self):
        # If two different branches have the same tip revision, then they are
        # conceptually the same branch, not one merged into the other.
        source = self.factory.makeProductBranch(product=self.product)
        source.last_scanned_id = 'revid'
        self.db_branch.last_scanned_id = 'revid'
        self.autoMergeBranches(self.db_branch, ['revid'])
        self.assertEqual([], self.merges)


class TestBranchMergeDetectionHandler(TestCaseWithFactory):
    """Test the merge handing of the merge detection handler."""

    layer = LaunchpadZopelessLayer

    def test_mergeProposalMergeDetected(self):
        # A merge proposal that is merged has the proposal itself marked as
        # merged, and the source branch lifecycle status set as merged.
        product = self.factory.makeProduct()
        proposal = self.factory.makeBranchMergeProposal(product=product)
        product.development_focus.branch = proposal.target_branch
        self.assertNotEqual(
            BranchMergeProposalStatus.MERGED, proposal.queue_status)
        self.assertNotEqual(
            BranchLifecycleStatus.MERGED,
            proposal.source_branch.lifecycle_status)
        mergedetection.merge_detected(
            logging.getLogger(),
            proposal.source_branch, proposal.target_branch, proposal)
        self.assertEqual(
            BranchMergeProposalStatus.MERGED, proposal.queue_status)
        self.assertEqual(
            BranchLifecycleStatus.MERGED,
            proposal.source_branch.lifecycle_status)

    def test_mergeProposalMergeDetected_not_series(self):
        # If the target branch is not a series branch, then the merge proposal
        # is still marked as merged, but the lifecycle status of the source
        # branch is not updated.
        proposal = self.factory.makeBranchMergeProposal()
        self.assertNotEqual(
            BranchMergeProposalStatus.MERGED, proposal.queue_status)
        self.assertNotEqual(
            BranchLifecycleStatus.MERGED,
            proposal.source_branch.lifecycle_status)
        mergedetection.merge_detected(
            logging.getLogger(),
            proposal.source_branch, proposal.target_branch, proposal)
        self.assertEqual(
            BranchMergeProposalStatus.MERGED, proposal.queue_status)
        self.assertNotEqual(
            BranchLifecycleStatus.MERGED,
            proposal.source_branch.lifecycle_status)

    def test_mergeOfTwoBranches_target_not_dev_focus(self):
        # The target branch must be the development focus in order for the
        # lifecycle status of the source branch to be updated to merged.
        source = self.factory.makeProductBranch()
        target = self.factory.makeProductBranch()
        mergedetection.merge_detected(logging.getLogger(), source, target)
        self.assertNotEqual(
            BranchLifecycleStatus.MERGED, source.lifecycle_status)

    def test_mergeOfTwoBranches_target_dev_focus(self):
        # If the target branch is the development focus branch of the product,
        # then the source branch gets its lifecycle status set to merged.
        product = self.factory.makeProduct()
        source = self.factory.makeProductBranch(product=product)
        target = self.factory.makeProductBranch(product=product)
        product.development_focus.branch = target
        mergedetection.merge_detected(logging.getLogger(), source, target)
        self.assertEqual(
            BranchLifecycleStatus.MERGED, source.lifecycle_status)

    def test_mergeOfTwoBranches_source_series_branch(self):
        # If the source branch is associated with a series, its lifecycle
        # status is not updated.
        product = self.factory.makeProduct()
        source = self.factory.makeProductBranch(product=product)
        target = self.factory.makeProductBranch(product=product)
        product.development_focus.branch = target
        series = product.newSeries(product.owner, 'new', '')
        series.branch = source

        mergedetection.merge_detected(logging.getLogger(), source, target)
        self.assertNotEqual(
            BranchLifecycleStatus.MERGED, source.lifecycle_status)


def test_suite():
    return unittest.TestLoader().loadTestsFromName(__name__)
