# Copyright 2009 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""Tests for the tales formatters."""

__metaclass__ = type

from difflib import unified_diff
import unittest

from storm.store import Store
from zope.security.proxy import removeSecurityProxy

from lp.testing import login, TestCaseWithFactory, test_tales
from canonical.testing import LaunchpadFunctionalLayer

#  Want to:
#   - remove the download icon
#   - 45 lines (+16/-4) 6 files changed
#

class TestPreviewDiffFormatter(TestCaseWithFactory):
    """Test the PreviewDiffFormatterAPI class."""

    layer = LaunchpadFunctionalLayer

    def _createPreviewDiff(self, line_count=0, added=None, removed=None,
                           conflicts=None, diffstat=None):
        # Login an admin to avoid the launchpad.Edit requirements.
        login('admin@canonical.com')
        # Create a dummy preview diff, and make sure the branches have the
        # correct last scanned ids to ensure that the new diff is not stale.
        bmp = self.factory.makeBranchMergeProposal()
        if line_count:
            content = ''.join(unified_diff('', 'random content'))
        else:
            content = ''
        preview = bmp.updatePreviewDiff(
            content, u'rev-a', u'rev-b', conflicts=conflicts)
        bmp.source_branch.last_scanned_id = preview.source_revision_id
        bmp.target_branch.last_scanned_id = preview.target_revision_id
        # Update the values directly sidestepping the security.
        naked_diff = removeSecurityProxy(preview)
        naked_diff.diff_lines_count = line_count
        naked_diff.added_lines_count = added
        naked_diff.removed_lines_count = removed
        naked_diff.diffstat = diffstat
        # In order to get the canonical url of the librarian file, we need to
        # commit.
        # transaction.commit()
        # Make sure that the preview diff is in the db for the test.
        # Storm bug: 324724
        Store.of(bmp).flush()
        return preview

    def _createStalePreviewDiff(self, line_count=0, added=None, removed=None,
                                conflicts=None, diffstat=None):
        preview = self._createPreviewDiff(
            line_count, added, removed, conflicts, diffstat)
        preview.branch_merge_proposal.source_branch.last_scanned_id = 'other'
        return preview

    def test_creation_method(self):
        # Just confirm that our helpers do what they say.
        preview = self._createPreviewDiff(
            12, 45, 23, u'conflicts', {'filename': (3,2)})
        self.assertEqual(12, preview.diff_lines_count)
        self.assertEqual(45, preview.added_lines_count)
        self.assertEqual(23, preview.removed_lines_count)
        self.assertEqual(False, preview.stale)
        self.assertEqual(True, self._createStalePreviewDiff().stale)
        self.assertEqual(u'conflicts', preview.conflicts)
        self.assertEqual({'filename': (3,2)}, preview.diffstat)

    def test_fmt_no_diff(self):
        # If there is no diff, there is no link.
        preview = self._createPreviewDiff(0)
        self.assertEqual(
            '<span class="clean-diff">0 lines</span>',
            test_tales('preview/fmt:link', preview=preview))

    def test_fmt_lines_no_add_or_remove(self):
        # If the lines added and removed are None, they are now shown.
        preview = self._createPreviewDiff(10, added=None, removed=None)
        self.assertEqual(
            '<a href="%s" class="clean-diff diff-link">'
            '10 lines</a>'
            % preview.diff_text.getURL(),
            test_tales('preview/fmt:link', preview=preview))

    def test_fmt_lines_some_added_no_removed(self):
        # If the added and removed values are not None, they are shown.
        preview = self._createPreviewDiff(10, added=4, removed=0)
        self.assertEqual(
            '<a href="%s" class="clean-diff diff-link">'
            '10 lines (+4/-0)</a>'
            % preview.diff_text.getURL(),
            test_tales('preview/fmt:link', preview=preview))

    def test_fmt_lines_files_modified(self):
        # If the diffstat has been set, the number of entries in the dict
        # defines the number of files modified.
        preview = self._createPreviewDiff(
            10, added=4, removed=0, diffstat={
                'file1': (1, 0),
                'file2': (3, 0)})
        self.assertEqual(
            '<a href="%s" class="clean-diff diff-link">'
            '10 lines (+4/-0) 2 files modified</a>'
            % preview.diff_text.getURL(),
            test_tales('preview/fmt:link', preview=preview))

    def test_fmt_lines_one_file_modified(self):
        # If only one file has been modified, a singular value is used.
        preview = self._createPreviewDiff(
            10, added=4, removed=0, diffstat={
                'file': (3, 0)})
        self.assertEqual(
            '<a href="%s" class="clean-diff diff-link">'
            '10 lines (+4/-0) 1 file modified</a>'
            % preview.diff_text.getURL(),
            test_tales('preview/fmt:link', preview=preview))

    def test_fmt_simple_conflicts(self):
        # Conflicts are indicated using text in the link.
        preview = self._createPreviewDiff(10, 2, 3, u'conflicts')
        self.assertEqual(
            '<a href="%s" class="conflicts-diff diff-link">'
            '10 lines (+2/-3) (has conflicts)</a>'
            % preview.diff_text.getURL(),
            test_tales('preview/fmt:link', preview=preview))

    def test_fmt_stale_empty_diff(self):
        # If there is no diff, there is no link.
        preview = self._createStalePreviewDiff(0)
        self.assertEqual(
            '<span class="stale-diff">0 lines</span>',
            test_tales('preview/fmt:link', preview=preview))

    def test_fmt_stale_non_empty_diff(self):
        # If there is no diff, there is no link.
        diffstat = dict(
            (self.factory.getUniqueString(), (2,3)) for x in range(23))
        preview = self._createStalePreviewDiff(
            500, 89, 340, diffstat=diffstat)
        self.assertEqual(
            '<a href="%s" class="stale-diff diff-link">'
            '500 lines (+89/-340) 23 files modified</a>'
            % preview.diff_text.getURL(),
            test_tales('preview/fmt:link', preview=preview))

    def test_fmt_stale_non_empty_diff_with_conflicts(self):
        # If there is no diff, there is no link.
        diffstat = dict(
            (self.factory.getUniqueString(), (2,3)) for x in range(23))
        preview = self._createStalePreviewDiff(
            500, 89, 340, u'conflicts', diffstat=diffstat)
        self.assertEqual(
            '<a href="%s" class="stale-diff diff-link">'
            '500 lines (+89/-340) 23 files modified (has conflicts)</a>'
            % preview.diff_text.getURL(),
            test_tales('preview/fmt:link', preview=preview))


def test_suite():
    return unittest.TestLoader().loadTestsFromName(__name__)

