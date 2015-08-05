# Copyright 2015 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""Test snap packages."""

__metaclass__ = type

from datetime import timedelta

from lazr.lifecycle.event import ObjectModifiedEvent
from storm.locals import Store
from testtools.matchers import Equals
import transaction
from zope.component import getUtility
from zope.event import notify
from zope.security.proxy import removeSecurityProxy

from lp.buildmaster.enums import (
    BuildQueueStatus,
    BuildStatus,
    )
from lp.buildmaster.interfaces.buildqueue import IBuildQueue
from lp.buildmaster.interfaces.processor import IProcessorSet
from lp.buildmaster.model.buildqueue import BuildQueue
from lp.registry.interfaces.distribution import IDistributionSet
from lp.registry.interfaces.pocket import PackagePublishingPocket
from lp.services.database.constants import (
    ONE_DAY_AGO,
    UTC_NOW,
    )
from lp.services.features.testing import FeatureFixture
from lp.services.webapp.interfaces import OAuthPermission
from lp.snappy.interfaces.snap import (
    CannotDeleteSnap,
    ISnap,
    ISnapSet,
    ISnapView,
    NoSourceForSnap,
    SNAP_FEATURE_FLAG,
    SnapBuildAlreadyPending,
    SnapBuildDisallowedArchitecture,
    SnapFeatureDisabled,
    )
from lp.snappy.interfaces.snapbuild import ISnapBuild
from lp.testing import (
    admin_logged_in,
    ANONYMOUS,
    api_url,
    login,
    logout,
    person_logged_in,
    StormStatementRecorder,
    TestCaseWithFactory,
    )
from lp.testing.layers import (
    DatabaseFunctionalLayer,
    LaunchpadZopelessLayer,
    )
from lp.testing.matchers import (
    DoesNotSnapshot,
    HasQueryCount,
    )
from lp.testing.pages import webservice_for_person


class TestSnapFeatureFlag(TestCaseWithFactory):

    layer = LaunchpadZopelessLayer

    def test_feature_flag_disabled(self):
        # Without a feature flag, we will not create new Snaps.
        person = self.factory.makePerson()
        self.assertRaises(
            SnapFeatureDisabled, getUtility(ISnapSet).new,
            person, person, None, None, branch=self.factory.makeAnyBranch())


class TestSnap(TestCaseWithFactory):

    layer = DatabaseFunctionalLayer

    def setUp(self):
        super(TestSnap, self).setUp()
        self.useFixture(FeatureFixture({SNAP_FEATURE_FLAG: u"on"}))

    def test_implements_interfaces(self):
        # Snap implements ISnap.
        snap = self.factory.makeSnap()
        with admin_logged_in():
            self.assertProvides(snap, ISnap)

    def test_avoids_problematic_snapshots(self):
        self.assertThat(
            self.factory.makeSnap(),
            DoesNotSnapshot(
                ["builds", "completed_builds", "pending_builds"], ISnapView))

    def test_initial_date_last_modified(self):
        # The initial value of date_last_modified is date_created.
        snap = self.factory.makeSnap(date_created=ONE_DAY_AGO)
        self.assertEqual(snap.date_created, snap.date_last_modified)

    def test_modifiedevent_sets_date_last_modified(self):
        # When a Snap receives an object modified event, the last modified
        # date is set to UTC_NOW.
        snap = self.factory.makeSnap(date_created=ONE_DAY_AGO)
        notify(ObjectModifiedEvent(
            removeSecurityProxy(snap), snap, [ISnap["name"]]))
        self.assertSqlAttributeEqualsDate(snap, "date_last_modified", UTC_NOW)

    def makeBuildableDistroArchSeries(self, **kwargs):
        das = self.factory.makeDistroArchSeries(**kwargs)
        fake_chroot = self.factory.makeLibraryFileAlias(
            filename="fake_chroot.tar.gz", db_only=True)
        das.addOrUpdateChroot(fake_chroot)
        return das

    def test_requestBuild(self):
        # requestBuild creates a new SnapBuild.
        processor = self.factory.makeProcessor(supports_virtualized=True)
        distroarchseries = self.makeBuildableDistroArchSeries(
            processor=processor)
        snap = self.factory.makeSnap(
            distroseries=distroarchseries.distroseries,
            processors=[distroarchseries.processor])
        build = snap.requestBuild(
            snap.owner, snap.distro_series.main_archive, distroarchseries,
            PackagePublishingPocket.RELEASE)
        self.assertTrue(ISnapBuild.providedBy(build))
        self.assertEqual(snap.owner, build.requester)
        self.assertEqual(snap.distro_series.main_archive, build.archive)
        self.assertEqual(distroarchseries, build.distro_arch_series)
        self.assertEqual(PackagePublishingPocket.RELEASE, build.pocket)
        self.assertEqual(BuildStatus.NEEDSBUILD, build.status)
        store = Store.of(build)
        store.flush()
        build_queue = store.find(
            BuildQueue,
            BuildQueue._build_farm_job_id ==
                removeSecurityProxy(build).build_farm_job_id).one()
        self.assertProvides(build_queue, IBuildQueue)
        self.assertEqual(
            snap.distro_series.main_archive.require_virtualized,
            build_queue.virtualized)
        self.assertEqual(BuildQueueStatus.WAITING, build_queue.status)

    def test_requestBuild_score(self):
        # Build requests have a relatively low queue score (2505).
        processor = self.factory.makeProcessor(supports_virtualized=True)
        distroarchseries = self.makeBuildableDistroArchSeries(
            processor=processor)
        snap = self.factory.makeSnap(
            distroseries=distroarchseries.distroseries,
            processors=[distroarchseries.processor])
        build = snap.requestBuild(
            snap.owner, snap.distro_series.main_archive, distroarchseries,
            PackagePublishingPocket.RELEASE)
        queue_record = build.buildqueue_record
        queue_record.score()
        self.assertEqual(2505, queue_record.lastscore)

    def test_requestBuild_relative_build_score(self):
        # Offsets for archives are respected.
        processor = self.factory.makeProcessor(supports_virtualized=True)
        distroarchseries = self.makeBuildableDistroArchSeries(
            processor=processor)
        snap = self.factory.makeSnap(
            distroseries=distroarchseries.distroseries, processors=[processor])
        archive = self.factory.makeArchive(owner=snap.owner)
        removeSecurityProxy(archive).relative_build_score = 100
        build = snap.requestBuild(
            snap.owner, archive, distroarchseries,
            PackagePublishingPocket.RELEASE)
        queue_record = build.buildqueue_record
        queue_record.score()
        self.assertEqual(2605, queue_record.lastscore)

    def test_requestBuild_rejects_repeats(self):
        # requestBuild refuses if there is already a pending build.
        distroseries = self.factory.makeDistroSeries()
        procs = []
        arches = []
        for i in range(2):
            procs.append(self.factory.makeProcessor(supports_virtualized=True))
            arches.append(self.makeBuildableDistroArchSeries(
                distroseries=distroseries, processor=procs[i]))
        snap = self.factory.makeSnap(
            distroseries=distroseries, processors=[procs[0], procs[1]])
        old_build = snap.requestBuild(
            snap.owner, snap.distro_series.main_archive, arches[0],
            PackagePublishingPocket.RELEASE)
        self.assertRaises(
            SnapBuildAlreadyPending, snap.requestBuild,
            snap.owner, snap.distro_series.main_archive, arches[0],
            PackagePublishingPocket.RELEASE)
        # We can build for a different archive.
        snap.requestBuild(
            snap.owner, self.factory.makeArchive(owner=snap.owner), arches[0],
            PackagePublishingPocket.RELEASE)
        # We can build for a different distroarchseries.
        snap.requestBuild(
            snap.owner, snap.distro_series.main_archive, arches[1],
            PackagePublishingPocket.RELEASE)
        # Changing the status of the old build allows a new build.
        old_build.updateStatus(BuildStatus.BUILDING)
        old_build.updateStatus(BuildStatus.FULLYBUILT)
        snap.requestBuild(
            snap.owner, snap.distro_series.main_archive, arches[0],
            PackagePublishingPocket.RELEASE)

    def test_requestBuild_rejects_unconfigured_arch(self):
        # Snap.requestBuild only allows dispatching a build for one of the
        # configured architectures.
        distroseries = self.factory.makeDistroSeries()
        procs = []
        arches = []
        for i in range(2):
            procs.append(self.factory.makeProcessor(supports_virtualized=True))
            arches.append(self.makeBuildableDistroArchSeries(
                distroseries=distroseries, processor=procs[i]))
        snap = self.factory.makeSnap(
            distroseries=distroseries, processors=[procs[0]])
        snap.requestBuild(
            snap.owner, snap.distro_series.main_archive, arches[0],
            PackagePublishingPocket.RELEASE)
        self.assertRaises(
            SnapBuildDisallowedArchitecture, snap.requestBuild,
            snap.owner, snap.distro_series.main_archive, arches[1],
            PackagePublishingPocket.RELEASE)

    def test_requestBuild_virtualization(self):
        # New builds are virtualized if any of the processor, snap or
        # archive require it.
        proc_arches = {}
        for proc_nonvirt in True, False:
            processor = self.factory.makeProcessor(
                supports_virtualized=True,
                supports_nonvirtualized=proc_nonvirt)
            distroarchseries = self.makeBuildableDistroArchSeries(
                processor=processor)
            proc_arches[proc_nonvirt] = (processor, distroarchseries)
        for proc_nonvirt, snap_virt, archive_virt, build_virt in (
                (True, False, False, False),
                (True, False, True, True),
                (True, True, False, True),
                (True, True, True, True),
                (False, False, False, True),
                (False, False, True, True),
                (False, True, False, True),
                (False, True, True, True),
                ):
            processor, distroarchseries = proc_arches[proc_nonvirt]
            snap = self.factory.makeSnap(
                distroseries=distroarchseries.distroseries,
                require_virtualized=snap_virt, processors=[processor])
            archive = self.factory.makeArchive(
                distribution=distroarchseries.distroseries.distribution,
                owner=snap.owner, virtualized=archive_virt)
            build = snap.requestBuild(
                snap.owner, archive, distroarchseries,
                PackagePublishingPocket.RELEASE)
            self.assertEqual(build_virt, build.virtualized)

    def test_requestBuild_nonvirtualized(self):
        # A non-virtualized processor can build a snap package iff the snap
        # has require_virtualized set to False.
        processor = self.factory.makeProcessor(
            supports_virtualized=False, supports_nonvirtualized=True)
        distroarchseries = self.makeBuildableDistroArchSeries(
            processor=processor)
        snap = self.factory.makeSnap(
            distroseries=distroarchseries.distroseries, processors=[processor])
        self.assertRaises(
            SnapBuildDisallowedArchitecture, snap.requestBuild,
            snap.owner, snap.distro_series.main_archive, distroarchseries,
            PackagePublishingPocket.RELEASE)
        with admin_logged_in():
            snap.require_virtualized = False
        snap.requestBuild(
            snap.owner, snap.distro_series.main_archive, distroarchseries,
            PackagePublishingPocket.RELEASE)

    def test_getBuilds(self):
        # Test the various getBuilds methods.
        snap = self.factory.makeSnap()
        builds = [self.factory.makeSnapBuild(snap=snap) for x in range(3)]
        # We want the latest builds first.
        builds.reverse()

        self.assertEqual(builds, list(snap.builds))
        self.assertEqual([], list(snap.completed_builds))
        self.assertEqual(builds, list(snap.pending_builds))

        # Change the status of one of the builds and retest.
        builds[0].updateStatus(BuildStatus.BUILDING)
        builds[0].updateStatus(BuildStatus.FULLYBUILT)
        self.assertEqual(builds, list(snap.builds))
        self.assertEqual(builds[:1], list(snap.completed_builds))
        self.assertEqual(builds[1:], list(snap.pending_builds))

    def test_getBuilds_cancelled_never_started_last(self):
        # A cancelled build that was never even started sorts to the end.
        snap = self.factory.makeSnap()
        fullybuilt = self.factory.makeSnapBuild(snap=snap)
        instacancelled = self.factory.makeSnapBuild(snap=snap)
        fullybuilt.updateStatus(BuildStatus.BUILDING)
        fullybuilt.updateStatus(BuildStatus.FULLYBUILT)
        instacancelled.updateStatus(BuildStatus.CANCELLED)
        self.assertEqual([fullybuilt, instacancelled], list(snap.builds))
        self.assertEqual(
            [fullybuilt, instacancelled], list(snap.completed_builds))
        self.assertEqual([], list(snap.pending_builds))

    def test_getBuilds_privacy(self):
        # The various getBuilds methods exclude builds against invisible
        # archives.
        snap = self.factory.makeSnap()
        archive = self.factory.makeArchive(
            distribution=snap.distro_series.distribution, owner=snap.owner,
            private=True)
        with person_logged_in(snap.owner):
            build = self.factory.makeSnapBuild(snap=snap, archive=archive)
            self.assertEqual([build], list(snap.builds))
            self.assertEqual([build], list(snap.pending_builds))
        self.assertEqual([], list(snap.builds))
        self.assertEqual([], list(snap.pending_builds))

    def test_delete_without_builds(self):
        # A snap package with no builds can be deleted.
        owner = self.factory.makePerson()
        distroseries = self.factory.makeDistroSeries()
        snap = self.factory.makeSnap(
            registrant=owner, owner=owner, distroseries=distroseries,
            name=u"condemned")
        self.assertTrue(getUtility(ISnapSet).exists(owner, u"condemned"))
        with person_logged_in(snap.owner):
            snap.destroySelf()
        self.assertFalse(getUtility(ISnapSet).exists(owner, u"condemned"))

    def test_delete_with_builds(self):
        # A snap package with builds cannot be deleted.
        owner = self.factory.makePerson()
        distroseries = self.factory.makeDistroSeries()
        snap = self.factory.makeSnap(
            registrant=owner, owner=owner, distroseries=distroseries,
            name=u"condemned")
        self.factory.makeSnapBuild(snap=snap)
        self.assertTrue(getUtility(ISnapSet).exists(owner, u"condemned"))
        with person_logged_in(snap.owner):
            self.assertRaises(CannotDeleteSnap, snap.destroySelf)
        self.assertTrue(getUtility(ISnapSet).exists(owner, u"condemned"))


class TestSnapSet(TestCaseWithFactory):

    layer = DatabaseFunctionalLayer

    def setUp(self):
        super(TestSnapSet, self).setUp()
        self.useFixture(FeatureFixture({SNAP_FEATURE_FLAG: u"on"}))

    def test_class_implements_interfaces(self):
        # The SnapSet class implements ISnapSet.
        self.assertProvides(getUtility(ISnapSet), ISnapSet)

    def makeSnapComponents(self, branch=None, git_ref=None):
        """Return a dict of values that can be used to make a Snap.

        Suggested use: provide as kwargs to ISnapSet.new.

        :param branch: An `IBranch`, or None.
        :param git_ref: An `IGitRef`, or None.
        """
        registrant = self.factory.makePerson()
        components = dict(
            registrant=registrant,
            owner=self.factory.makeTeam(owner=registrant),
            distro_series=self.factory.makeDistroSeries(),
            name=self.factory.getUniqueString(u"snap-name"))
        if branch is None and git_ref is None:
            branch = self.factory.makeAnyBranch()
        if branch is not None:
            components["branch"] = branch
        else:
            components["git_repository"] = git_ref.repository
            components["git_path"] = git_ref.path
        return components

    def test_creation_bzr(self):
        # The metadata entries supplied when a Snap is created for a Bazaar
        # branch are present on the new object.
        branch = self.factory.makeAnyBranch()
        components = self.makeSnapComponents(branch=branch)
        snap = getUtility(ISnapSet).new(**components)
        transaction.commit()
        self.assertEqual(components["registrant"], snap.registrant)
        self.assertEqual(components["owner"], snap.owner)
        self.assertEqual(components["distro_series"], snap.distro_series)
        self.assertEqual(components["name"], snap.name)
        self.assertEqual(branch, snap.branch)
        self.assertIsNone(snap.git_repository)
        self.assertIsNone(snap.git_path)
        self.assertTrue(snap.require_virtualized)

    def test_creation_git(self):
        # The metadata entries supplied when a Snap is created for a Git
        # branch are present on the new object.
        [ref] = self.factory.makeGitRefs()
        components = self.makeSnapComponents(git_ref=ref)
        snap = getUtility(ISnapSet).new(**components)
        transaction.commit()
        self.assertEqual(components["registrant"], snap.registrant)
        self.assertEqual(components["owner"], snap.owner)
        self.assertEqual(components["distro_series"], snap.distro_series)
        self.assertEqual(components["name"], snap.name)
        self.assertIsNone(snap.branch)
        self.assertEqual(ref.repository, snap.git_repository)
        self.assertEqual(ref.path, snap.git_path)
        self.assertTrue(snap.require_virtualized)

    def test_creation_no_source(self):
        # Attempting to create a Snap with neither a Bazaar branch nor a Git
        # repository fails.
        registrant = self.factory.makePerson()
        self.assertRaises(
            NoSourceForSnap, getUtility(ISnapSet).new,
            registrant, registrant, self.factory.makeDistroSeries(),
            self.factory.getUniqueString(u"snap-name"))

    def test_exists(self):
        # ISnapSet.exists checks for matching Snaps.
        snap = self.factory.makeSnap()
        self.assertTrue(getUtility(ISnapSet).exists(snap.owner, snap.name))
        self.assertFalse(
            getUtility(ISnapSet).exists(self.factory.makePerson(), snap.name))
        self.assertFalse(getUtility(ISnapSet).exists(snap.owner, u"different"))

    def test_findByPerson(self):
        # ISnapSet.findByPerson returns all Snaps with the given owner.
        owners = [self.factory.makePerson() for i in range(2)]
        snaps = []
        for owner in owners:
            for i in range(2):
                snaps.append(self.factory.makeSnap(
                    registrant=owner, owner=owner))
        self.assertContentEqual(
            snaps[:2], getUtility(ISnapSet).findByPerson(owners[0]))
        self.assertContentEqual(
            snaps[2:], getUtility(ISnapSet).findByPerson(owners[1]))

    def test_findByBranch(self):
        # ISnapSet.findByBranch returns all Snaps with the given Bazaar branch.
        branches = [self.factory.makeAnyBranch() for i in range(2)]
        snaps = []
        for branch in branches:
            for i in range(2):
                snaps.append(self.factory.makeSnap(branch=branch))
        self.assertContentEqual(
            snaps[:2], getUtility(ISnapSet).findByBranch(branches[0]))
        self.assertContentEqual(
            snaps[2:], getUtility(ISnapSet).findByBranch(branches[1]))

    def test_findByGitRepository(self):
        # ISnapSet.findByGitRepository returns all Snaps with the given Git
        # repository.
        repositories = [self.factory.makeGitRepository() for i in range(2)]
        snaps = []
        for repository in repositories:
            for i in range(2):
                [ref] = self.factory.makeGitRefs(repository=repository)
                snaps.append(self.factory.makeSnap(git_ref=ref))
        self.assertContentEqual(
            snaps[:2],
            getUtility(ISnapSet).findByGitRepository(repositories[0]))
        self.assertContentEqual(
            snaps[2:],
            getUtility(ISnapSet).findByGitRepository(repositories[1]))

    def test_detachFromBranch(self):
        # ISnapSet.detachFromBranch clears the given Bazaar branch from all
        # Snaps.
        branches = [self.factory.makeAnyBranch() for i in range(2)]
        snaps = []
        for branch in branches:
            for i in range(2):
                snaps.append(self.factory.makeSnap(
                    branch=branch, date_created=ONE_DAY_AGO))
        getUtility(ISnapSet).detachFromBranch(branches[0])
        self.assertEqual(
            [None, None, branches[1], branches[1]],
            [snap.branch for snap in snaps])
        for snap in snaps[:2]:
            self.assertSqlAttributeEqualsDate(
                snap, "date_last_modified", UTC_NOW)

    def test_detachFromGitRepository(self):
        # ISnapSet.detachFromGitRepository clears the given Git repository
        # from all Snaps.
        repositories = [self.factory.makeGitRepository() for i in range(2)]
        snaps = []
        paths = []
        for repository in repositories:
            for i in range(2):
                [ref] = self.factory.makeGitRefs(repository=repository)
                paths.append(ref.path)
                snaps.append(self.factory.makeSnap(
                    git_ref=ref, date_created=ONE_DAY_AGO))
        getUtility(ISnapSet).detachFromGitRepository(repositories[0])
        self.assertEqual(
            [None, None, repositories[1], repositories[1]],
            [snap.git_repository for snap in snaps])
        self.assertEqual(
            [None, None, paths[2], paths[3]],
            [snap.git_path for snap in snaps])
        for snap in snaps[:2]:
            self.assertSqlAttributeEqualsDate(
                snap, "date_last_modified", UTC_NOW)


class TestSnapProcessors(TestCaseWithFactory):

    layer = LaunchpadZopelessLayer

    def setUp(self):
        super(TestSnapProcessors, self).setUp()
        self.useFixture(FeatureFixture({SNAP_FEATURE_FLAG: u"on"}))
        self.default_procs = [
            getUtility(IProcessorSet).getByName("386"),
            getUtility(IProcessorSet).getByName("amd64")]
        self.unrestricted_procs = (
            self.default_procs + [getUtility(IProcessorSet).getByName("hppa")])
        self.arm = self.factory.makeProcessor(
            name="arm", restricted=True, build_by_default=False)

    def test_new_default_processors(self):
        # SnapSet.new creates a SnapArch for each Processor with
        # build_by_default set.
        self.factory.makeProcessor(name="default", build_by_default=True)
        self.factory.makeProcessor(name="nondefault", build_by_default=False)
        owner = self.factory.makePerson()
        snap = getUtility(ISnapSet).new(
            registrant=owner, owner=owner,
            distro_series=self.factory.makeDistroSeries(), name=u"snap",
            branch=self.factory.makeAnyBranch())
        self.assertContentEqual(
            ["386", "amd64", "hppa", "default"],
            [processor.name for processor in snap.processors])

    def test_new_override_processors(self):
        # SnapSet.new can be given a custom set of processors.
        owner = self.factory.makePerson()
        snap = getUtility(ISnapSet).new(
            registrant=owner, owner=owner,
            distro_series=self.factory.makeDistroSeries(), name=u"snap",
            branch=self.factory.makeAnyBranch(), processors=[self.arm])
        self.assertContentEqual(
            ["arm"], [processor.name for processor in snap.processors])

    def test_set(self):
        # The property remembers its value correctly.
        snap = self.factory.makeSnap()
        snap.setProcessors([self.arm])
        self.assertContentEqual([self.arm], snap.processors)
        snap.setProcessors(self.unrestricted_procs + [self.arm])
        self.assertContentEqual(
            self.unrestricted_procs + [self.arm], snap.processors)
        snap.processors = []
        self.assertContentEqual([], snap.processors)


class TestSnapWebservice(TestCaseWithFactory):

    layer = DatabaseFunctionalLayer

    def setUp(self):
        super(TestSnapWebservice, self).setUp()
        self.useFixture(FeatureFixture({SNAP_FEATURE_FLAG: u"on"}))
        self.person = self.factory.makePerson(displayname="Test Person")
        self.webservice = webservice_for_person(
            self.person, permission=OAuthPermission.WRITE_PUBLIC)
        self.webservice.default_api_version = "devel"
        login(ANONYMOUS)

    def getURL(self, obj):
        return self.webservice.getAbsoluteUrl(api_url(obj))

    def makeSnap(self, owner=None, distroseries=None, branch=None,
                 git_ref=None, processors=None, webservice=None):
        if owner is None:
            owner = self.person
        if distroseries is None:
            distroseries = self.factory.makeDistroSeries(registrant=owner)
        if branch is None and git_ref is None:
            branch = self.factory.makeAnyBranch()
        kwargs = {}
        if webservice is None:
            webservice = self.webservice
        transaction.commit()
        distroseries_url = api_url(distroseries)
        owner_url = api_url(owner)
        if branch is not None:
            kwargs["branch"] = api_url(branch)
        if git_ref is not None:
            kwargs["git_repository"] = api_url(git_ref.repository)
            kwargs["git_path"] = git_ref.path
        if processors is not None:
            kwargs["processors"] = [
                api_url(processor) for processor in processors]
        logout()
        response = webservice.named_post(
            "/+snaps", "new", owner=owner_url, distro_series=distroseries_url,
            name="mir", **kwargs)
        self.assertEqual(201, response.status)
        return webservice.get(response.getHeader("Location")).jsonBody()

    def getCollectionLinks(self, entry, member):
        """Return a list of self_link attributes of entries in a collection."""
        collection = self.webservice.get(
            entry["%s_collection_link" % member]).jsonBody()
        return [entry["self_link"] for entry in collection["entries"]]

    def test_new_bzr(self):
        # Ensure Snap creation based on a Bazaar branch works.
        team = self.factory.makeTeam(owner=self.person)
        distroseries = self.factory.makeDistroSeries(registrant=team)
        branch = self.factory.makeAnyBranch()
        snap = self.makeSnap(
            owner=team, distroseries=distroseries, branch=branch)
        with person_logged_in(self.person):
            self.assertEqual(self.getURL(self.person), snap["registrant_link"])
            self.assertEqual(self.getURL(team), snap["owner_link"])
            self.assertEqual(
                self.getURL(distroseries), snap["distro_series_link"])
            self.assertEqual("mir", snap["name"])
            self.assertEqual(self.getURL(branch), snap["branch_link"])
            self.assertIsNone(snap["git_repository_link"])
            self.assertIsNone(snap["git_path"])
            self.assertTrue(snap["require_virtualized"])

    def test_new_git(self):
        # Ensure Snap creation based on a Git branch works.
        team = self.factory.makeTeam(owner=self.person)
        distroseries = self.factory.makeDistroSeries(registrant=team)
        [ref] = self.factory.makeGitRefs()
        snap = self.makeSnap(
            owner=team, distroseries=distroseries, git_ref=ref)
        with person_logged_in(self.person):
            self.assertEqual(self.getURL(self.person), snap["registrant_link"])
            self.assertEqual(self.getURL(team), snap["owner_link"])
            self.assertEqual(
                self.getURL(distroseries), snap["distro_series_link"])
            self.assertEqual("mir", snap["name"])
            self.assertIsNone(snap["branch_link"])
            self.assertEqual(
                self.getURL(ref.repository), snap["git_repository_link"])
            self.assertEqual(ref.path, snap["git_path"])
            self.assertTrue(snap["require_virtualized"])

    def test_duplicate(self):
        # An attempt to create a duplicate Snap fails.
        team = self.factory.makeTeam(owner=self.person)
        branch = self.factory.makeAnyBranch()
        branch_url = api_url(branch)
        self.makeSnap(owner=team)
        with person_logged_in(self.person):
            owner_url = api_url(team)
            distroseries_url = api_url(self.factory.makeDistroSeries())
        response = self.webservice.named_post(
            "/+snaps", "new", owner=owner_url, distro_series=distroseries_url,
            name="mir", branch=branch_url)
        self.assertEqual(400, response.status)
        self.assertEqual(
            "There is already a snap package with the same name and owner.",
            response.body)

    def test_not_owner(self):
        # If the registrant is not the owner or a member of the owner team,
        # Snap creation fails.
        other_person = self.factory.makePerson(displayname="Other Person")
        other_team = self.factory.makeTeam(
            owner=other_person, displayname="Other Team")
        distroseries = self.factory.makeDistroSeries(registrant=self.person)
        branch = self.factory.makeAnyBranch()
        transaction.commit()
        other_person_url = api_url(other_person)
        other_team_url = api_url(other_team)
        distroseries_url = api_url(distroseries)
        branch_url = api_url(branch)
        logout()
        response = self.webservice.named_post(
            "/+snaps", "new", owner=other_person_url,
            distro_series=distroseries_url, name="dummy", branch=branch_url)
        self.assertEqual(401, response.status)
        self.assertEqual(
            "Test Person cannot create snap packages owned by Other Person.",
            response.body)
        response = self.webservice.named_post(
            "/+snaps", "new", owner=other_team_url,
            distro_series=distroseries_url, name="dummy", branch=branch_url)
        self.assertEqual(401, response.status)
        self.assertEqual(
            "Test Person is not a member of Other Team.", response.body)

    def test_getByName(self):
        # lp.snaps.getByName returns a matching Snap.
        snap = self.makeSnap()
        with person_logged_in(self.person):
            owner_url = api_url(self.person)
        response = self.webservice.named_get(
            "/+snaps", "getByName", owner=owner_url, name="mir")
        self.assertEqual(200, response.status)
        self.assertEqual(snap, response.jsonBody())

    def test_getByName_missing(self):
        # lp.snaps.getByName returns 404 for a non-existent Snap.
        logout()
        with person_logged_in(self.person):
            owner_url = api_url(self.person)
        response = self.webservice.named_get(
            "/+snaps", "getByName", owner=owner_url, name="nonexistent")
        self.assertEqual(404, response.status)
        self.assertEqual(
            "No such snap package with this owner: 'nonexistent'.",
            response.body)

    def makeBuildableDistroArchSeries(self, **kwargs):
        das = self.factory.makeDistroArchSeries(**kwargs)
        fake_chroot = self.factory.makeLibraryFileAlias(
            filename="fake_chroot.tar.gz", db_only=True)
        das.addOrUpdateChroot(fake_chroot)
        return das

    def test_requestBuild(self):
        # Build requests can be performed and end up in snap.builds and
        # snap.pending_builds.
        distroseries = self.factory.makeDistroSeries(registrant=self.person)
        processor = self.factory.makeProcessor(supports_virtualized=True)
        distroarchseries = self.makeBuildableDistroArchSeries(
            distroseries=distroseries, processor=processor, owner=self.person)
        distroarchseries_url = api_url(distroarchseries)
        archive_url = api_url(distroseries.main_archive)
        snap = self.makeSnap(distroseries=distroseries, processors=[processor])
        response = self.webservice.named_post(
            snap["self_link"], "requestBuild", archive=archive_url,
            distro_arch_series=distroarchseries_url, pocket="Release")
        self.assertEqual(201, response.status)
        build = self.webservice.get(response.getHeader("Location")).jsonBody()
        self.assertEqual(
            [build["self_link"]], self.getCollectionLinks(snap, "builds"))
        self.assertEqual([], self.getCollectionLinks(snap, "completed_builds"))
        self.assertEqual(
            [build["self_link"]],
            self.getCollectionLinks(snap, "pending_builds"))

    def test_requestBuild_rejects_repeats(self):
        # Build requests are rejected if already pending.
        distroseries = self.factory.makeDistroSeries(registrant=self.person)
        processor = self.factory.makeProcessor(supports_virtualized=True)
        distroarchseries = self.makeBuildableDistroArchSeries(
            distroseries=distroseries, processor=processor, owner=self.person)
        distroarchseries_url = api_url(distroarchseries)
        archive_url = api_url(distroseries.main_archive)
        snap = self.makeSnap(distroseries=distroseries, processors=[processor])
        response = self.webservice.named_post(
            snap["self_link"], "requestBuild", archive=archive_url,
            distro_arch_series=distroarchseries_url, pocket="Release")
        self.assertEqual(201, response.status)
        response = self.webservice.named_post(
            snap["self_link"], "requestBuild", archive=archive_url,
            distro_arch_series=distroarchseries_url, pocket="Release")
        self.assertEqual(400, response.status)
        self.assertEqual(
            "An identical build of this snap package is already pending.",
            response.body)

    def test_requestBuild_not_owner(self):
        # If the requester is not the owner or a member of the owner team,
        # build requests are rejected.
        other_team = self.factory.makeTeam(displayname="Other Team")
        distroseries = self.factory.makeDistroSeries(registrant=self.person)
        processor = self.factory.makeProcessor(supports_virtualized=True)
        distroarchseries = self.makeBuildableDistroArchSeries(
            distroseries=distroseries, processor=processor, owner=self.person)
        distroarchseries_url = api_url(distroarchseries)
        archive_url = api_url(distroseries.main_archive)
        other_webservice = webservice_for_person(
            other_team.teamowner, permission=OAuthPermission.WRITE_PUBLIC)
        other_webservice.default_api_version = "devel"
        login(ANONYMOUS)
        snap = self.makeSnap(
            owner=other_team, distroseries=distroseries,
            processors=[processor], webservice=other_webservice)
        response = self.webservice.named_post(
            snap["self_link"], "requestBuild", archive=archive_url,
            distro_arch_series=distroarchseries_url, pocket="Release")
        self.assertEqual(401, response.status)
        self.assertEqual(
            "Test Person cannot create snap package builds owned by Other "
            "Team.", response.body)

    def test_requestBuild_archive_disabled(self):
        # Build requests against a disabled archive are rejected.
        distroseries = self.factory.makeDistroSeries(
            distribution=getUtility(IDistributionSet)['ubuntu'],
            registrant=self.person)
        processor = self.factory.makeProcessor(supports_virtualized=True)
        distroarchseries = self.makeBuildableDistroArchSeries(
            distroseries=distroseries, processor=processor, owner=self.person)
        distroarchseries_url = api_url(distroarchseries)
        archive = self.factory.makeArchive(
            distribution=distroseries.distribution, owner=self.person,
            enabled=False, displayname="Disabled Archive")
        archive_url = api_url(archive)
        snap = self.makeSnap(distroseries=distroseries, processors=[processor])
        response = self.webservice.named_post(
            snap["self_link"], "requestBuild", archive=archive_url,
            distro_arch_series=distroarchseries_url, pocket="Release")
        self.assertEqual(403, response.status)
        self.assertEqual("Disabled Archive is disabled.", response.body)

    def test_requestBuild_archive_private_owners_match(self):
        # Build requests against a private archive are allowed if the Snap
        # and Archive owners match exactly.
        distroseries = self.factory.makeDistroSeries(
            distribution=getUtility(IDistributionSet)['ubuntu'],
            registrant=self.person)
        processor = self.factory.makeProcessor(supports_virtualized=True)
        distroarchseries = self.makeBuildableDistroArchSeries(
            distroseries=distroseries, processor=processor, owner=self.person)
        distroarchseries_url = api_url(distroarchseries)
        archive = self.factory.makeArchive(
            distribution=distroseries.distribution, owner=self.person,
            private=True)
        archive_url = api_url(archive)
        snap = self.makeSnap(distroseries=distroseries, processors=[processor])
        response = self.webservice.named_post(
            snap["self_link"], "requestBuild", archive=archive_url,
            distro_arch_series=distroarchseries_url, pocket="Release")
        self.assertEqual(201, response.status)

    def test_requestBuild_archive_private_owners_mismatch(self):
        # Build requests against a private archive are rejected if the Snap
        # and Archive owners do not match exactly.
        distroseries = self.factory.makeDistroSeries(
            distribution=getUtility(IDistributionSet)['ubuntu'],
            registrant=self.person)
        processor = self.factory.makeProcessor(supports_virtualized=True)
        distroarchseries = self.makeBuildableDistroArchSeries(
            distroseries=distroseries, processor=processor, owner=self.person)
        distroarchseries_url = api_url(distroarchseries)
        archive = self.factory.makeArchive(
            distribution=distroseries.distribution, private=True)
        archive_url = api_url(archive)
        snap = self.makeSnap(distroseries=distroseries, processors=[processor])
        response = self.webservice.named_post(
            snap["self_link"], "requestBuild", archive=archive_url,
            distro_arch_series=distroarchseries_url, pocket="Release")
        self.assertEqual(403, response.status)
        self.assertEqual(
            "Snap package builds against private archives are only allowed "
            "if the snap package owner and the archive owner are equal.",
            response.body)

    def test_getBuilds(self):
        # The builds, completed_builds, and pending_builds properties are as
        # expected.
        distroseries = self.factory.makeDistroSeries(
            distribution=getUtility(IDistributionSet)['ubuntu'],
            registrant=self.person)
        processor = self.factory.makeProcessor(supports_virtualized=True)
        distroarchseries = self.makeBuildableDistroArchSeries(
            distroseries=distroseries, processor=processor, owner=self.person)
        distroarchseries_url = api_url(distroarchseries)
        archives = [
            self.factory.makeArchive(
                distribution=distroseries.distribution, owner=self.person)
            for x in range(4)]
        archive_urls = [api_url(archive) for archive in archives]
        snap = self.makeSnap(distroseries=distroseries, processors=[processor])
        builds = []
        for archive_url in archive_urls:
            response = self.webservice.named_post(
                snap["self_link"], "requestBuild", archive=archive_url,
                distro_arch_series=distroarchseries_url, pocket="Proposed")
            self.assertEqual(201, response.status)
            build = self.webservice.get(
                response.getHeader("Location")).jsonBody()
            builds.insert(0, build["self_link"])
        self.assertEqual(builds, self.getCollectionLinks(snap, "builds"))
        self.assertEqual([], self.getCollectionLinks(snap, "completed_builds"))
        self.assertEqual(
            builds, self.getCollectionLinks(snap, "pending_builds"))
        snap = self.webservice.get(snap["self_link"]).jsonBody()

        with person_logged_in(self.person):
            db_snap = getUtility(ISnapSet).getByName(self.person, snap["name"])
            db_builds = list(db_snap.builds)
            db_builds[0].updateStatus(
                BuildStatus.BUILDING, date_started=db_snap.date_created)
            db_builds[0].updateStatus(
                BuildStatus.FULLYBUILT,
                date_finished=db_snap.date_created + timedelta(minutes=10))
        snap = self.webservice.get(snap["self_link"]).jsonBody()
        # Builds that have not yet been started are listed last.  This does
        # mean that pending builds that have never been started are sorted
        # to the end, but means that builds that were cancelled before
        # starting don't pollute the start of the collection forever.
        self.assertEqual(builds, self.getCollectionLinks(snap, "builds"))
        self.assertEqual(
            builds[:1], self.getCollectionLinks(snap, "completed_builds"))
        self.assertEqual(
            builds[1:], self.getCollectionLinks(snap, "pending_builds"))

        with person_logged_in(self.person):
            db_builds[1].updateStatus(
                BuildStatus.BUILDING, date_started=db_snap.date_created)
            db_builds[1].updateStatus(
                BuildStatus.FULLYBUILT,
                date_finished=db_snap.date_created + timedelta(minutes=20))
        snap = self.webservice.get(snap["self_link"]).jsonBody()
        self.assertEqual(
            [builds[1], builds[0], builds[2], builds[3]],
            self.getCollectionLinks(snap, "builds"))
        self.assertEqual(
            [builds[1], builds[0]],
            self.getCollectionLinks(snap, "completed_builds"))
        self.assertEqual(
            builds[2:], self.getCollectionLinks(snap, "pending_builds"))

    def test_query_count(self):
        # Snap has a reasonable query count.
        snap = self.factory.makeSnap(registrant=self.person, owner=self.person)
        url = api_url(snap)
        logout()
        store = Store.of(snap)
        store.flush()
        store.invalidate()
        with StormStatementRecorder() as recorder:
            self.webservice.get(url)
        self.assertThat(recorder, HasQueryCount(Equals(15)))
