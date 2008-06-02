# Copyright 2007 Canonical Ltd.  All rights reserved.

__metaclass__ = type

import os
import subprocess
import sys
import unittest

from zope.component import getUtility
from zope.security.proxy import removeSecurityProxy

from canonical.config import config
from canonical.launchpad.scripts import QuietFakeLogger
from canonical.launchpad.scripts.ftpmaster import (
    PackageLocationError, PackageCopier, SoyuzScriptError,
    UnembargoSecurityPackage)
from canonical.launchpad.database.publishing import (
    SecureSourcePackagePublishingHistory,
    SecureBinaryPackagePublishingHistory)
from canonical.launchpad.interfaces import (
    IComponentSet, IDistributionSet, IPersonSet,
    ISourcePackagePublishingHistory, PackagePublishingStatus)
from canonical.librarian.ftests.harness import (
    cleanupLibrarianFiles, fillLibrarianFile)
from canonical.testing import DatabaseLayer, LaunchpadZopelessLayer


class TestCopyPackageScript(unittest.TestCase):
    """Test the copy-package.py script."""
    layer = LaunchpadZopelessLayer

    def runCopyPackage(self, extra_args=None):
        """Run copy-package.py, returning the result and output.
        Returns a tuple of the process's return code, stdout output and
        stderr output."""
        if extra_args is None:
            extra_args = []
        script = os.path.join(
            config.root, "scripts", "ftpmaster-tools", "copy-package.py")
        args = [sys.executable, script, '-y']
        args.extend(extra_args)
        process = subprocess.Popen(
            args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        # The subprocess commits to the database so we need to tell the layer
        # to fully tear down and restore the testing database.
        DatabaseLayer.force_dirty_database()
        stdout, stderr = process.communicate()
        return (process.returncode, stdout, stderr)

    def testSimpleRun(self):
        """Try a simple copy-package.py run.

        Uses the default case, copy mozilla-firefox source with binaries
        from warty to hoary.
        """
        # Count the records in SSPPH and SBPPH to check later that they
        # increased by one each.
        num_source_pub = SecureSourcePackagePublishingHistory.select(
            "True").count()
        num_bin_pub = SecureBinaryPackagePublishingHistory.select(
            "True").count()

        returncode, out, err = self.runCopyPackage(
            extra_args=['-s', 'warty', 'mozilla-firefox',
                        '--to-suite', 'hoary', '-b'])
        # Need to print these or you can't see what happened if the
        # return code is bad:
        if returncode != 0:
            print "\nStdout:\n%s\nStderr\n%s\n" % (out, err)
        self.assertEqual(0, returncode)

        # Test that the database has been modified.  We're only checking
        # that the number of rows has increase; content checks are done
        # in other tests.
        self.layer.txn.abort()

        num_source_pub_after = SecureSourcePackagePublishingHistory.select(
            "True").count()
        num_bin_pub_after = SecureBinaryPackagePublishingHistory.select(
            "True").count()

        self.assertEqual(num_source_pub + 1, num_source_pub_after)
        # 'mozilla-firefox' source produced 4 binaries.
        self.assertEqual(num_bin_pub + 4, num_bin_pub_after)


class TestCopyPackage(unittest.TestCase):
    """Test the CopyPackageHelper class."""
    layer = LaunchpadZopelessLayer

    def setUp(self):
        """Anotate pending publishing records provided in the sampledata.

        The records annotated will be excluded during the operation checks,
        see checkCopies().
        """
        pending_sources = SecureSourcePackagePublishingHistory.selectBy(
            status=PackagePublishingStatus.PENDING)
        self.sources_pending_ids = [pub.id for pub in pending_sources]
        pending_binaries = SecureBinaryPackagePublishingHistory.selectBy(
            status=PackagePublishingStatus.PENDING)
        self.binaries_pending_ids = [pub.id for pub in pending_binaries]

    def getCopier(self, sourcename='mozilla-firefox', sourceversion=None,
                  from_distribution='ubuntu', from_suite='warty',
                  to_distribution='ubuntu', to_suite='hoary',
                  component=None, from_ppa=None, to_ppa=None,
                  from_partner=False, to_partner=False,
                  confirm_all=True, include_binaries=True):
        """Return a PackageCopier instance.

        Allow tests to use a set of default options and pass an
        inactive logger to PackageCopier.
        """
        test_args = ['-s', from_suite,
                     '-d', from_distribution,
                     '--to-suite', to_suite,
                     '--to-distribution', to_distribution]

        if confirm_all:
            test_args.append('-y')

        if include_binaries:
            test_args.append('-b')

        if sourceversion is not None:
            test_args.extend(['-e', sourceversion])

        if component is not None:
            test_args.extend(['-c', component])

        if from_partner:
            test_args.append('-j')

        if to_partner:
            test_args.append('--to-partner')

        if from_ppa is not None:
            test_args.extend(['-p', from_ppa])

        if to_ppa is not None:
            test_args.extend(['--to-ppa', to_ppa])

        test_args.append(sourcename)

        copier = PackageCopier(name='copy-package', test_args=test_args)
        copier.logger = QuietFakeLogger()
        copier.setupLocation()
        return copier

    def checkCopies(self, copied, target_archive, size):
        """Perform overall checks in the copied records list.

         * check if the size is expected,
         * check if all copied records are PENDING,
         * check if the list copied matches the list of PENDING records
           retrieved from the target_archive.
        """
        self.assertEqual(len(copied), size)

        for candidate in copied:
            self.assertEqual(
                candidate.status, PackagePublishingStatus.PENDING)

        def excludeOlds(found, old_pending_ids):
            return [pub.id for pub in found if pub.id not in old_pending_ids]

        sources_pending = target_archive.getPublishedSources(
            status=PackagePublishingStatus.PENDING)
        sources_pending_ids = excludeOlds(
            sources_pending, self.sources_pending_ids)

        binaries_pending = target_archive.getAllPublishedBinaries(
            status=PackagePublishingStatus.PENDING)
        binaries_pending_ids = excludeOlds(
            binaries_pending, self.binaries_pending_ids)

        copied_ids = [pub.id for pub in copied]
        pending_ids = sources_pending_ids + binaries_pending_ids

        self.assertEqual(
            sorted(copied_ids), sorted(pending_ids),
            "The copy did not succeed.\nExpected IDs: %s\nFound IDs: %s" % (
                sorted(copied_ids), sorted(pending_ids))
            )

    def testCopyBetweenDistroSeries(self):
        """Check the copy operation between distroseries."""
        copy_helper = self.getCopier()
        copied = copy_helper.mainTask()

        # Check locations.  They should be the same as the defaults defined
        # in the getCopier method.
        self.assertEqual(str(copy_helper.location),
                         'Primary Archive for Ubuntu Linux: warty-RELEASE')
        self.assertEqual(str(copy_helper.destination),
                         'Primary Archive for Ubuntu Linux: hoary-RELEASE')

        # Check stored results. The number of copies should be 5
        # (1 source and 2 binaries in 2 architectures).
        target_archive = copy_helper.destination.archive
        self.checkCopies(copied, target_archive, 5)

    def testCopyBetweenPockets(self):
        """Check the copy operation between pockets.

        That's normally how SECURITY publications get propagated to UPDATES
        in order to reduce the burden on ubuntu servers.
        """
        copy_helper = self.getCopier(
            from_suite='warty', to_suite='warty-updates')
        copied = copy_helper.mainTask()

        self.assertEqual(str(copy_helper.location),
                         'Primary Archive for Ubuntu Linux: warty-RELEASE')
        self.assertEqual(str(copy_helper.destination),
                         'Primary Archive for Ubuntu Linux: warty-UPDATES')

        target_archive = copy_helper.destination.archive
        self.checkCopies(copied, target_archive, 5)

    def testCopyAcrossPartner(self):
        """Check the copy operation across PARTNER archive.

        This operation is required to propagate partner uploads across several
        suites, avoiding to build (and modify) the package multiple times to
        have it available for all supported suites independent of the the
        time they were released.
        """
        copy_helper = self.getCopier(
            sourcename='commercialpackage', from_partner=True,
            to_partner=True, from_suite='breezy-autotest', to_suite='hoary')
        copied = copy_helper.mainTask()

        self.assertEqual(
            str(copy_helper.location),
            'Partner Archive for Ubuntu Linux: breezy-autotest-RELEASE')
        self.assertEqual(
            str(copy_helper.destination),
            'Partner Archive for Ubuntu Linux: hoary-RELEASE')

        # 'commercialpackage' has only one binary built for i386.
        # The source and the binary got copied.
        target_archive = copy_helper.destination.archive
        self.checkCopies(copied, target_archive, 2)

    def testCopyFromPPA(self):
        """Check the copy operation from PPA to PRIMARY Archive.

        That's the preliminary workflow for 'syncing' sources from PPA to
        the ubuntu PRIMARY archive.
        """
        copy_helper = self.getCopier(
            sourcename='iceweasel', from_ppa='cprov',
            from_suite='warty', to_suite='hoary', include_binaries=False)
        copied = copy_helper.mainTask()

        self.assertEqual(
            str(copy_helper.location),
            'cprov: warty-RELEASE')
        self.assertEqual(
            str(copy_helper.destination),
            'Primary Archive for Ubuntu Linux: hoary-RELEASE')

        target_archive = copy_helper.destination.archive
        self.checkCopies(copied, target_archive, 1)

    def testCopyAcrossPPAs(self):
        """Check the copy operation across PPAs.

        This operation is useful to propagate deependencies accross
        colaborative PPAs without requiring new uploads. Ideally, it
        should be possible to perform such operation via the Launchpad UI.
        """
        copy_helper = self.getCopier(
            sourcename='iceweasel', from_ppa='cprov',
            from_suite='warty', to_suite='hoary', to_ppa='sabdfl')
        copied = copy_helper.mainTask()

        self.assertEqual(
            str(copy_helper.location),
            'cprov: warty-RELEASE')
        self.assertEqual(
            str(copy_helper.destination),
            'sabdfl: hoary-RELEASE')

        target_archive = copy_helper.destination.archive
        self.checkCopies(copied, target_archive, 2)

    def assertRaisesWithContent(self, exception, exception_content,
                                func, *args):
        """Check if the given exception is raised with given content.

        If the expection isn't raised or the exception_content doesn't
        match what was raised an AssertionError is raised.
        """
        exception_name = str(exception).split('.')[-1]

        try:
            func(*args)
        except exception, err:
            self.assertEqual(str(err), exception_content)
        else:
            raise AssertionError(
                "'%s' was not raised" % exception_name)

    def testSourceLookupFailure(self):
        """Check if it raises when the target source can't be found.

        SoyuzScriptError is raised when a lookup fails.
        """
        copy_helper = self.getCopier(sourcename='zaphod')

        self.assertRaisesWithContent(
            SoyuzScriptError,
            "Could not find source 'zaphod/None' in "
            "Primary Archive for Ubuntu Linux: warty-RELEASE",
            copy_helper.mainTask)

    def testFailIfValidPackageButNotInSpecifiedSuite(self):
        """It fails if the package is not published in the source location.

        SoyuzScriptError is raised when a lookup fails
        """
        copy_helper = self.getCopier(from_suite="breezy-autotest")

        self.assertRaisesWithContent(
            SoyuzScriptError,
            "Could not find source 'mozilla-firefox/None' in "
            "Primary Archive for Ubuntu Linux: breezy-autotest-RELEASE",
            copy_helper.mainTask)

    def testFailIfSameLocations(self):
        """It fails if the source and destination locations are the same.

        SoyuzScriptError is raise when the copy cannot be performed.
        """
        copy_helper = self.getCopier(from_suite='warty', to_suite='warty')

        self.assertRaisesWithContent(
            SoyuzScriptError,
            "Can not sync between the same locations: "
            "'Primary Archive for Ubuntu Linux: warty-RELEASE' to "
            "'Primary Archive for Ubuntu Linux: warty-RELEASE'",
            copy_helper.mainTask)

    def testBadDistributionDestination(self):
        """Check if it raises if the distribution is invalid.

        PackageLocationError is raised for unknown destination distribution.
        """
        copy_helper = self.getCopier(to_distribution="beeblebrox")

        self.assertRaisesWithContent(
            PackageLocationError,
            "Could not find distribution 'beeblebrox'",
            copy_helper.mainTask)

    def testBadSuiteDestination(self):
        """Check that it fails when specifying a bad distroseries.

        PackageLocationError is raised for unknown destination distroseries.
        """
        copy_helper = self.getCopier(to_suite="slatibartfast")

        self.assertRaisesWithContent(
            PackageLocationError,
            "Could not find suite 'slatibartfast'",
            copy_helper.mainTask)

    def testBadPPADestination(self):
        """Check that it fails when specifying a bad PPA destination.

        PackageLocationError is raised for unknown destination PPA.
        """
        copy_helper = self.getCopier(to_ppa="slatibartfast")

        self.assertRaisesWithContent(
            PackageLocationError,
            "Could not find a PPA for slatibartfast",
            copy_helper.mainTask)

    def testCrossPartnerCopiesFails(self):
        """Check that it fails when cross-PARTNER copies are requested.

        SoyuzScriptError is raised for cross-PARTNER copies, packages
        published in PARTNER archive can only be copied within PARTNER
        archive.
        """
        copy_helper = self.getCopier(from_partner=True)

        self.assertRaisesWithContent(
            SoyuzScriptError,
            "Cross-PARTNER copies are not allowed.",
            copy_helper.mainTask)

        copy_helper = self.getCopier(to_partner=True)

        self.assertRaisesWithContent(
            SoyuzScriptError,
            "Cross-PARTNER copies are not allowed.",
            copy_helper.mainTask)

    def testPpaPartnerInconsistentLocations(self):
        """Check if PARTNER and PPA inconsistent arguments are caught.

        SoyuzScriptError is raised for when inconsistences in the PARTNER
        and PPA location or destination are spotted.
        """
        copy_helper = self.getCopier(
            from_partner=True, from_ppa='cprov', to_partner=True)

        self.assertRaisesWithContent(
            SoyuzScriptError,
            "Cannot operate with location PARTNER and PPA simultaneously.",
            copy_helper.mainTask)

        copy_helper = self.getCopier(
            from_partner=True, to_ppa='cprov', to_partner=True)

        self.assertRaisesWithContent(
            SoyuzScriptError,
            "Cannot operate with destination PARTNER and PPA simultaneously.",
            copy_helper.mainTask)

    def testBinaryCopyFromPpaToPrimaryWorks(self):
        """Check whether copying binaries from PPA to PRIMARY archive works.
        """
        copy_helper = self.getCopier(
            sourcename='iceweasel', from_ppa='cprov',
            from_suite='warty', to_suite='hoary')
        copied = copy_helper.mainTask()

        self.assertEqual(
            str(copy_helper.location),
            'cprov: warty-RELEASE')
        self.assertEqual(
            str(copy_helper.destination),
            'Primary Archive for Ubuntu Linux: hoary-RELEASE')

        # 'iceweasel' has only one binary built for it
        # The source and the binary got copied.
        target_archive = copy_helper.destination.archive
        self.checkCopies(copied, target_archive, 2)

    def testUnembargoing(self):
        """Test UnembargoSecurityPackage, which wraps PackagerCopier."""
        # Set up a private PPA.
        cprov_ppa = getUtility(IPersonSet).getByName("cprov").archive
        cprov_ppa.private = True
        cprov_ppa.buildd_secret = "secret"

        # Fudge one of the packages in the cprov's PPA so
        # that its files are in the restricted librarian.
        sourcepackagename = "iceweasel"
        binarypackagename = "mozilla-firefox"
        sources = cprov_ppa.getPublishedSources(name=sourcepackagename)
        binaries = cprov_ppa.getAllPublishedBinaries(name=binarypackagename)
        [source] = sources

        # Now we fudge the published component in the main archive so
        # we can check later to see if the ancestry override is working.
        universe = getUtility(IComponentSet)['universe']
        warty = getUtility(IDistributionSet)['ubuntu']['warty']
        warty_i386 = warty['i386']
        [iceweasel] = warty.main_archive.getPublishedSources(
            name=sourcepackagename,
            status=PackagePublishingStatus.PUBLISHED,
            distroseries=warty,
            exact_match=True)
        removeSecurityProxy(iceweasel).secure_record.component = universe

        # For the binary we'll unpublish it entirely and fudge the component
        # on the binarypackagerelease.  This will make the ancestry check
        # fall back to the binarypackagerelease to get the component.
        firefox_pubs = warty.main_archive.getAllPublishedBinaries(
            name=binarypackagename,
            status=PackagePublishingStatus.PUBLISHED,
            distroarchseries=warty_i386,
            exact_match=True)
        for firefox in firefox_pubs:
            firefox = removeSecurityProxy(firefox)
            firefox.supersede()
            firefox.binarypackagerelease.component = universe
        self.layer.txn.commit()

        # Make the files look like they're in the restricted librarian
        # and add some fake content. fillLibrarianFile() helpfully doesn't
        # reset the filesize so we have to do it here.
        #
        # We also need to pretend to be the librariangc user to update
        # libraryfilecontent.  Unfortunately the convoluted user switching
        # is required because librariangc has no permissions to select
        # on the other tables needed for the loop.

        FAKE_CONTENT = "I am fake!"
        for publishings in (sources, binaries):
            for published in publishings:
                for published_file in published.files:
                    self.layer.txn.commit()
                    self.layer.switchDbUser('librariangc')
                    lfa = published_file.libraryfilealias
                    lfa = removeSecurityProxy(lfa)
                    lfa.restricted = True
                    fillLibrarianFile(lfa.content.id, content=FAKE_CONTENT)
                    lfa.content.filesize = len(FAKE_CONTENT)
                    self.layer.txn.commit()
                    self.layer.switchDbUser('launchpad')

        # Also make the changes files restricted.
        for published in sources:
            queue = published.sourcepackagerelease.getQueueRecord(
                distroseries=published.distroseries)
            self.layer.txn.commit()
            self.layer.switchDbUser('librariangc')
            if queue is not None:
                lfa = removeSecurityProxy(queue).changesfile
                lfa.restricted = True
                fillLibrarianFile(lfa.content.id, content=FAKE_CONTENT)
                lfa.content.filesize = len(FAKE_CONTENT)
            self.layer.txn.commit()
            self.layer.switchDbUser('launchpad')

        # Now switch the to the user that the script runs as.
        self.layer.txn.commit()
        self.layer.switchDbUser(config.archivepublisher.dbuser)

        # Now we can invoke the unembargo script and check its results.
        test_args = [
            "--ppa", "cprov",
            "-s", "%s" % source.distroseries.name,
            "%s" % sourcepackagename
            ]

        script = UnembargoSecurityPackage(
            name='unembargo', test_args=test_args)
        script.logger = QuietFakeLogger()
        script.setupLocation()

        copied = script.mainTask()

        # Check the results.
        self.checkCopies(copied, script.destination.archive, 2)

        # Check that the librarian files are all unrestricted now.
        # We must commit the txn for SQL object to see the change.
        # Also check that the published records are in universe, which
        # shows that the ancestry override worked.
        self.layer.txn.commit()
        for published in copied:
            # This is cheating a bit but it's fine.  The script updates
            # the secure publishing record but this change does not
            # get reflected in SQLObject's cache on the object that comes
            # from the SQL View, the non-secure record.  No amount of
            # syncUpdate and flushing seems to want to make it update :(
            # So, I am checking the secure record in this test.
            self.assertEqual(
                published.secure_record.component.name, universe.name)
            for published_file in published.files:
                self.assertFalse(published_file.libraryfilealias.restricted)
            # Also check the sources' changesfiles.
            if ISourcePackagePublishingHistory.providedBy(published):
                queue = published.sourcepackagerelease.getQueueRecord(
                    distroseries=published.distroseries)
                self.assertFalse(queue.changesfile.restricted)

        cleanupLibrarianFiles()


def test_suite():
    return unittest.TestLoader().loadTestsFromName(__name__)
