# Copyright 2010 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""Test NascentUpload functionality."""

__metaclass__ = type

from testtools import TestCase

from canonical.testing.layers import LaunchpadZopelessLayer
from lp.archiveuploader.changesfile import determine_file_class_and_name
from lp.archiveuploader.nascentupload import NascentUpload
from lp.archiveuploader.tests import mock_logger


class FakeChangesFile:

    def __init__(self):
        self.files = []


class TestMatchDDEBs(TestCase):
    """Tests that NascentUpload correctly links DEBs to their DDEBs.

    Also verifies detection of DDEB-related error cases.
    """

    layer = LaunchpadZopelessLayer

    def setUp(self):
        super(TestMatchDDEBs, self).setUp()
        self.changes = FakeChangesFile()
        self.upload = NascentUpload(self.changes, None, mock_logger)

    def addFile(self, filename):
        """Add a file of the right type to the upload."""
        package, cls = determine_file_class_and_name(filename)
        file = cls(
            filename, None, 100, 'devel', 'extra', package, '666',
            self.changes, None, self.upload.logger)
        self.changes.files.append(file)

    def assertMatchDDEBErrors(self, error_list):
        self.assertEquals(
            error_list, [str(e) for e in self.upload._matchDDEBs()])

    def testNoLinksWithNoBinaries(self):
        # No links will be made if there are no binaries whatsoever.
        self.addFile('something_1.0.diff.gz')
        self.assertMatchDDEBErrors([])

    def testNoLinksWithJustDEBs(self):
        # No links will be made if there are no DDEBs.
        self.addFile('blah_1.0_all.deb')
        self.addFile('libblah_1.0_i386.deb')
        self.assertMatchDDEBErrors([])
        for file in self.changes.files:
            self.assertIs(None, file.ddeb_file)

    def testLinksMatchingDDEBs(self):
        # DDEBs will be linked to their matching DEBs.
        self.addFile('blah_1.0_all.deb')
        self.addFile('libblah_1.0_i386.deb')
        self.addFile('libblah-dbgsym_1.0_i386.ddeb')
        self.assertMatchDDEBErrors([])
        self.assertIs(None, self.changes.files[0].ddeb_file)
        self.assertIs(self.changes.files[2], self.changes.files[1].ddeb_file)
        self.assertIs(self.changes.files[1], self.changes.files[2].deb_file)
        self.assertIs(None, self.changes.files[2].ddeb_file)

    def testDuplicateDDEBsCauseErrors(self):
        # An error will be raised if a DEB has more than one matching
        # DDEB.
        self.addFile('libblah_1.0_i386.deb')
        self.addFile('libblah-dbgsym_1.0_i386.ddeb')
        self.addFile('libblah-dbgsym_1.0_i386.ddeb')
        self.assertMatchDDEBErrors(
            ['Duplicated debug packages: libblah-dbgsym 666 (i386)'])

    def testMismatchedDDEBsCauseErrors(self):
        # An error will be raised if a DDEB has no matching DEB.
        self.addFile('libblah_1.0_i386.deb')
        self.addFile('libblah-dbgsym_1.0_amd64.ddeb')
        self.assertMatchDDEBErrors(
            ['Orphaned debug packages: libblah-dbgsym 666 (amd64)'])
