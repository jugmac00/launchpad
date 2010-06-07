# Copyright 2010 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

from __future__ import with_statement

"""Tests for `IBuildBase`.

   XXX 2010-04-26 michael.nelson bug=567922.
   These tests should be moved into test_packagebuild when buildbase is
   deleted. For the moment, test_packagebuild inherits these tests to
   ensure the new classes pass too.
"""
__metaclass__ = type

from datetime import datetime
import os
import unittest
from zope.component import getUtility
from zope.security.proxy import removeSecurityProxy

from canonical.config import config
from canonical.database.constants import UTC_NOW
from canonical.testing.layers import (
    DatabaseFunctionalLayer, LaunchpadZopelessLayer)
from lp.buildmaster.interfaces.buildbase import BuildStatus
from lp.buildmaster.model.buildbase import BuildBase
from lp.registry.interfaces.pocket import pocketsuffix
from lp.soyuz.interfaces.processor import IProcessorFamilySet
from lp.soyuz.tests.soyuzbuilddhelpers import WaitingSlave
from lp.soyuz.tests.test_publishing import SoyuzTestPublisher
from lp.testing import TestCase, TestCaseWithFactory
from lp.testing.fakemethod import FakeMethod


class TestBuildBaseMixin:
    """Tests for `IBuildBase`."""

    def test_getUploadDirLeaf(self):
        # getUploadDirLeaf returns the current time, followed by the build
        # cookie.
        now = datetime.now()
        build_cookie = self.factory.getUniqueString()
        upload_leaf = self.package_build.getUploadDirLeaf(
            build_cookie, now=now)
        self.assertEqual(
            '%s-%s' % (now.strftime("%Y%m%d-%H%M%S"), build_cookie),
            upload_leaf)

    def test_getUploadDir(self):
        # getUploadDir is the absolute path to the directory in which things
        # are uploaded to.
        build_cookie = self.factory.getUniqueInteger()
        upload_leaf = self.package_build.getUploadDirLeaf(build_cookie)
        upload_dir = self.package_build.getUploadDir(upload_leaf)
        self.assertEqual(
            os.path.join(config.builddmaster.root, 'incoming', upload_leaf),
            upload_dir)


class TestBuildBase(TestCase, TestBuildBaseMixin):

    def setUp(self):
        """Create the package build for testing."""
        super(TestBuildBase, self).setUp()
        self.package_build = BuildBase()


class TestBuildBaseWithDatabase(TestCaseWithFactory):
    """Tests for `IBuildBase` that need objects from the rest of Launchpad."""

    layer = DatabaseFunctionalLayer

    def test_getUploadLogContent_nolog(self):
        """If there is no log file there, a string explanation is returned.
        """
        self.useTempDir()
        build_base = BuildBase()
        self.assertEquals('Could not find upload log file',
            build_base.getUploadLogContent(os.getcwd(), "myleaf"))

    def test_getUploadLogContent_only_dir(self):
        """If there is a directory but no log file, expect the error string,
        not an exception."""
        self.useTempDir()
        os.makedirs("accepted/myleaf")
        build_base = BuildBase()
        self.assertEquals('Could not find upload log file',
            build_base.getUploadLogContent(os.getcwd(), "myleaf"))

    def test_getUploadLogContent_readsfile(self):
        """If there is a log file, return its contents."""
        self.useTempDir()
        os.makedirs("accepted/myleaf")
        with open('accepted/myleaf/uploader.log', 'w') as f:
            f.write('foo')
        build_base = BuildBase()
        self.assertEquals('foo',
            build_base.getUploadLogContent(os.getcwd(), "myleaf"))

    def test_getUploaderCommand(self):
        build_base = BuildBase()
        upload_leaf = self.factory.getUniqueString('upload-leaf')
        build_base.distro_series = self.factory.makeDistroSeries()
        build_base.distribution = build_base.distro_series.distribution
        build_base.pocket = self.factory.getAnyPocket()
        build_base.id = self.factory.getUniqueInteger()
        build_base.policy_name = self.factory.getUniqueString('policy-name')
        config_args = list(config.builddmaster.uploader.split())
        log_file = self.factory.getUniqueString('logfile')
        config_args.extend(
            ['--log-file', log_file,
             '-d', build_base.distribution.name,
             '-s', (build_base.distro_series.name
                    + pocketsuffix[build_base.pocket]),
             '-b', str(build_base.id),
             '-J', upload_leaf,
             '--context=%s' % build_base.policy_name,
             os.path.abspath(config.builddmaster.root),
             ])
        uploader_command = build_base.getUploaderCommand(
            build_base, upload_leaf, log_file)
        self.assertEqual(config_args, uploader_command)


class TestHandleStatus(TestCaseWithFactory):
    """Tests for `IBuildBase`s handleStatus method.

    Note: these tests do *not* test the updating of the build
    status to FULLYBUILT as this happens during the upload which
    is stubbed out by a mock function.
    """

    layer = LaunchpadZopelessLayer

    def makeBuild(self):
        """Allow subclasses to override the build with which the test runs.

        XXX michaeln 2010-06-03 bug=567922
        Until buildbase is removed, we need to ensure these tests
        run against new IPackageBuild builds (BinaryPackageBuild)
        and the IBuildBase builds (SPRecipeBuild). They assume the build
        is successfully built and check that incorrect upload paths will
        set the status to FAILEDTOUPLOAD.
        """
        test_publisher = SoyuzTestPublisher()
        test_publisher.prepareBreezyAutotest()
        binaries = test_publisher.getPubBinaries()
        return binaries[0].binarypackagerelease.build

    def assertBuildStatusEqual(self, status):
        self.assertEqual(status, self.build.status)

    def setUp(self):
        super(TestHandleStatus, self).setUp()
        self.build = self.makeBuild()
        # For the moment, we require a builder for the build so that
        # handleStatus_OK can get a reference to the slave.
        builder = self.factory.makeBuilder()
        self.build.buildqueue_record.builder = builder
        self.build.buildqueue_record.setDateStarted(UTC_NOW)
        self.slave = WaitingSlave('BuildStatus.OK')
        self.slave.valid_file_hashes.append('test_file_hash')
        builder.setSlaveForTesting(self.slave)

        # We overwrite the buildmaster root to use a temp directory.
        tmp_dir = self.makeTemporaryDirectory()
        tmp_builddmaster_root = """
        [builddmaster]
        root: %s
        """ % tmp_dir
        config.push('tmp_builddmaster_root', tmp_builddmaster_root)

        # We stub out our builds getUploaderCommand() method so
        # we can check whether it was called as well as
        # verifySuccessfulUpload().
        self.fake_getUploaderCommand = FakeMethod(
            result=['echo', 'noop'])
        removeSecurityProxy(self.build).getUploaderCommand = (
            self.fake_getUploaderCommand)
        removeSecurityProxy(self.build).verifySuccessfulUpload = FakeMethod(
            result=True)

    def test_handleStatus_OK_normal_file(self):
        # A filemap with plain filenames should not cause a problem.
        # The call to handleStatus will attempt to get the file from
        # the slave resulting in a URL error in this test case.
        self.build.handleStatus('OK', None, {
                'filemap': { 'myfile.py': 'test_file_hash'},
                })

        self.assertBuildStatusEqual(BuildStatus.FULLYBUILT)
        self.assertEqual(1, self.fake_getUploaderCommand.call_count)

    def test_handleStatus_OK_absolute_filepath(self):
        # A filemap that tries to write to files outside of
        # the upload directory will result in a failed upload.
        self.build.handleStatus('OK', None, {
            'filemap': { '/tmp/myfile.py': 'test_file_hash'},
            })
        self.assertBuildStatusEqual(BuildStatus.FAILEDTOUPLOAD)
        self.assertEqual(0, self.fake_getUploaderCommand.call_count)

    def test_handleStatus_OK_relative_filepath(self):
        # A filemap that tries to write to files outside of
        # the upload directory will result in a failed upload.
        self.build.handleStatus('OK', None, {
            'filemap': { '../myfile.py': 'test_file_hash'},
            })
        self.assertBuildStatusEqual(BuildStatus.FAILEDTOUPLOAD)
        self.assertEqual(0, self.fake_getUploaderCommand.call_count)


class TestHandleStatusForSPRBuild(TestHandleStatus):

    def makeBuild(self):
        """Overridden to create an SPRBuild."""
        person = self.factory.makePerson()
        distroseries = self.factory.makeDistroSeries()
        processor_fam = getUtility(IProcessorFamilySet).getByName('x86')
        distroseries_i386 = distroseries.newArch(
            'i386', processor_fam, False, person,
            supports_virtualized=True)
        distroseries.nominatedarchindep = distroseries_i386
        build = self.factory.makeSourcePackageRecipeBuild(
            distroseries=distroseries,
            status=BuildStatus.FULLYBUILT)
        build.queueBuild(build)
        return build

    def assertBuildStatusEqual(self, status):
        """Builds based on the old structure use buildstate."""
        self.assertEqual(status, self.build.buildstate)


def test_suite():
    return unittest.TestLoader().loadTestsFromName(__name__)
