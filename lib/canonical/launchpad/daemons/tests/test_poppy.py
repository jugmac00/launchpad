# Copyright 2006 Canonical Ltd.  All rights reserved.

"""Functional tests for poppy FTP daemon."""

__metaclass__ = type

import ftplib
import os
import shutil
import socket
import tempfile
import unittest
import StringIO

from canonical.archivepublisher.ftests import PoppyTestSetup
from canonical.testing import LaunchpadZopelessLayer

class TestPoppy(unittest.TestCase):
    """Test if poppy.py daemon works properly."""

    layer = LaunchpadZopelessLayer

    def setUp(self):
        """Set up poppy in a temp dir."""
        self.root_dir = tempfile.mkdtemp()
        self.port = 3421
        self.poppy = PoppyTestSetup(self.root_dir, port=self.port)
        self.poppy.startPoppy()

    def tearDown(self):
        """Purge poppy root directory."""
        self.poppy.killPoppy()
        shutil.rmtree(self.root_dir)

    def getFTPConnection(self, login=1, user="annonymous", password=""):
        """Build and return a FTP connection to the current poppy.

        Optionally log in with as 'annonymous' & empty password, or passed
        user/password.
        """
        conn = ftplib.FTP()
        # poppy usually takes sometime to come up, we need to wait, or insist.
        while True:
            try:
                reply = conn.connect("localhost", self.port)
            except socket.error:
                if not self.poppy.alive:
                    raise
            else:
                break

        if login:
            conn.login(user, password)
        return conn

    def _uploadPath(self, path):
        """Return system path of specified path inside an upload.

        Only works for a single upload (poppy transaction).
        """
        upload_dir = os.listdir(self.root_dir)[1]
        return os.path.join(self.root_dir, upload_dir, path)

    def testLOGIN(self):
        """Check login procedure."""
        conn = self.getFTPConnection(login=0)
        self.assertEqual(
            conn.login("annonymous", ""), "230 Login Successful.")
        conn.quit()

    def testCWD(self):
        """Check automatic creation of directories 'cwd'ed in."""
        conn = self.getFTPConnection()
        self.assertEqual(
            conn.cwd("foo/bar"), "250 CWD command successful.")
        self.assertEqual(
            conn.pwd(), "/foo/bar")
        conn.quit()
        wanted_path = self._uploadPath('foo/bar')
        self.assertTrue(os.path.exists(wanted_path))

    def testMKD(self):
        """Check recursive MKD (aka mkdir -p)"""
        conn = self.getFTPConnection()
        self.assertEqual(
            conn.mkd("foo/bar"), "")
        self.assertEqual(
            conn.pwd(), "/")
        self.assertEqual(
            conn.cwd("foo/bar"), "250 CWD command successful.")
        self.assertEqual(
            conn.pwd(), "/foo/bar")
        conn.quit()
        wanted_path = self._uploadPath('foo/bar')
        self.assertTrue(os.path.exists(wanted_path))

    def testRMD(self):
        """Check recursive RMD (aka rm -rf)"""
        conn = self.getFTPConnection()
        self.assertEqual(
            conn.mkd("foo/bar"), "")
        self.assertEqual(
            conn.rmd("foo"), "250 RMD command successful.")
        conn.quit()
        wanted_path = self._uploadPath('foo/')
        self.assertFalse(os.path.exists(wanted_path))

    def testSTOR(self):
        """Check if the parent directories are created during file upload."""
        conn = self.getFTPConnection()
        fake_file = StringIO.StringIO("fake contents")
        self.assertEqual(
            conn.storbinary("STOR foo/bar/baz", fake_file),
            "226 Transfer successful.")
        conn.quit()
        wanted_path = self._uploadPath('foo/bar/baz')
        fs_content = open(os.path.join(wanted_path)).read()
        self.assertEqual(fs_content, "fake contents")

    def testUploadIsolation(self):
        """Check if poppy isolates the uploads properly.

        Upload should be done atomically, i.e., poppy should isolate the
        context according each connection.
        """
        conn = self.getFTPConnection()
        fake_file = StringIO.StringIO("ONE")
        self.assertEqual(
            conn.storbinary("STOR test", fake_file),
            "226 Transfer successful.")
        conn.quit()

        conn = self.getFTPConnection()
        fake_file = StringIO.StringIO("TWO")
        self.assertEqual(
            conn.storbinary("STOR test", fake_file),
            "226 Transfer successful.")
        conn.quit()

        uploads = [leaf for leaf in os.listdir(self.root_dir)
                   if not leaf.startswith(".") and
                   not leaf.endswith(".distro")]
        uploads.sort()

        content_one = open(os.path.join(
            self.root_dir, uploads[0], "test")).read()
        self.assertEqual(content_one, "ONE")

        content_two = open(os.path.join(
            self.root_dir, uploads[1], "test")).read()
        self.assertEqual(content_two, "TWO")



def test_suite():
    return unittest.TestLoader().loadTestsFromName(__name__)
