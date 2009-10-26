#! /usr/bin/python2.4
#
# Copyright 2009 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""Test the upgrade_branches script."""


import transaction

from bzrlib.transport import get_transport
from bzrlib.branch import Branch as BzrBranch

from canonical.testing import ZopelessAppServerLayer
from lp.testing import TestCaseWithFactory
from canonical.launchpad.scripts.tests import run_script
from lp.code.model.branch import Branch, BranchFormat, RepositoryFormat
from lp.code.model.branchjob import BranchUpgradeJob


class TestUpgradeBranches(TestCaseWithFactory):

    layer = ZopelessAppServerLayer

    def test_upgrade_branches(self):
        """Ensure update_preview_diffs runs and generates diffs."""
        #self.useTempBzrHome()
        self.useBzrBranches(real_server=True)
        target, target_tree = self.create_branch_and_tree(
            hosted=True, format='knit')
        target.branch_format = BranchFormat.BZR_BRANCH_5
        target.repository_format = RepositoryFormat.BZR_KNIT_1

        self.assertEqual(
            target_tree.branch.repository._format.get_format_string(),
            'Bazaar-NG Knit Repository Format 1')

        job = BranchUpgradeJob.create(target)
        transaction.commit()

        retcode, stdout, stderr = run_script(
            'cronscripts/upgrade_branches.py', [],
            expect_returncode=0)
        self.assertEqual('', stdout)
        self.assertIn(
            'INFO    Ran 1 IBranchUpgradeJobSource jobs.\n', stderr)

        target_branch = BzrBranch.open(target_tree.branch.base)
        self.assertEqual(
            target_branch.repository._format.get_format_string(),
            'Bazaar RepositoryFormatKnitPack6 (bzr 1.9)\n')
