# Copyright 2022 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""CI builds."""

__all__ = [
    "CIBuild",
    ]

from datetime import timedelta

from lazr.lifecycle.event import ObjectCreatedEvent
import pytz
from storm.locals import (
    Bool,
    DateTime,
    Desc,
    Int,
    Reference,
    Store,
    Unicode,
    )
from storm.store import EmptyResultSet
from zope.component import getUtility
from zope.event import notify
from zope.interface import implementer

from lp.app.errors import NotFoundError
from lp.app.interfaces.launchpad import ILaunchpadCelebrities
from lp.buildmaster.enums import (
    BuildFarmJobType,
    BuildQueueStatus,
    BuildStatus,
    )
from lp.buildmaster.interfaces.buildfarmjob import IBuildFarmJobSource
from lp.buildmaster.model.buildfarmjob import SpecificBuildFarmJobSourceMixin
from lp.buildmaster.model.packagebuild import PackageBuildMixin
from lp.code.errors import (
    GitRepositoryBlobNotFound,
    GitRepositoryScanFault,
    )
from lp.code.interfaces.cibuild import (
    CannotFetchConfiguration,
    CannotParseConfiguration,
    CIBuildAlreadyRequested,
    CIBuildDisallowedArchitecture,
    ICIBuild,
    ICIBuildSet,
    MissingConfiguration,
    )
from lp.code.interfaces.githosting import IGitHostingClient
from lp.code.model.gitref import GitRef
from lp.code.model.lpcraft import load_configuration
from lp.registry.interfaces.pocket import PackagePublishingPocket
from lp.registry.interfaces.series import SeriesStatus
from lp.registry.model.distribution import Distribution
from lp.registry.model.distroseries import DistroSeries
from lp.services.database.bulk import load_related
from lp.services.database.constants import DEFAULT
from lp.services.database.decoratedresultset import DecoratedResultSet
from lp.services.database.enumcol import DBEnum
from lp.services.database.interfaces import (
    IMasterStore,
    IStore,
    )
from lp.services.database.stormbase import StormBase
from lp.services.librarian.browser import ProxiedLibraryFileAlias
from lp.services.librarian.model import (
    LibraryFileAlias,
    LibraryFileContent,
    )
from lp.services.propertycache import cachedproperty
from lp.soyuz.model.distroarchseries import DistroArchSeries


def determine_DASes_to_build(configuration, logger=None):
    """Generate distroarchseries to build for this configuration."""
    architectures_by_series = {}
    for stage in configuration.pipeline:
        for job_name in stage:
            if job_name not in configuration.jobs:
                if logger is not None:
                    logger.error("No job definition for %r", job_name)
                continue
            for job in configuration.jobs[job_name]:
                for architecture in job["architectures"]:
                    architectures_by_series.setdefault(
                        job["series"], set()).add(architecture)
    # XXX cjwatson 2022-01-21: We have to hardcode Ubuntu for now, since
    # the .launchpad.yaml format doesn't currently support other
    # distributions (although nor does the Launchpad build farm).
    distribution = getUtility(ILaunchpadCelebrities).ubuntu
    for series_name, architecture_names in architectures_by_series.items():
        try:
            series = distribution[series_name]
        except NotFoundError:
            if logger is not None:
                logger.error("Unknown Ubuntu series name %s" % series_name)
            continue
        architectures = {
            das.architecturetag: das
            for das in series.buildable_architectures}
        for architecture_name in architecture_names:
            try:
                das = architectures[architecture_name]
            except KeyError:
                if logger is not None:
                    logger.error(
                        "%s is not a buildable architecture name in "
                        "Ubuntu %s" % (architecture_name, series_name))
                continue
            yield das


def get_all_commits_for_paths(git_repository, paths):
    return [
        ref.commit_sha1
        for ref in GitRef.findByReposAndPaths(
            [(git_repository, ref_path)
                for ref_path in paths]).values()]


def parse_configuration(git_repository, blob):
    try:
        return load_configuration(blob)
    except Exception as e:
        # Don't bother logging parsing errors from user-supplied YAML.
        raise CannotParseConfiguration(
            "Cannot parse .launchpad.yaml from %s: %s" %
            (git_repository.unique_name, e))


@implementer(ICIBuild)
class CIBuild(PackageBuildMixin, StormBase):
    """See `ICIBuild`."""

    __storm_table__ = "CIBuild"

    job_type = BuildFarmJobType.CIBUILD

    id = Int(name="id", primary=True)

    git_repository_id = Int(name="git_repository", allow_none=False)
    git_repository = Reference(git_repository_id, "GitRepository.id")

    commit_sha1 = Unicode(name="commit_sha1", allow_none=False)

    distro_arch_series_id = Int(name="distro_arch_series", allow_none=False)
    distro_arch_series = Reference(
        distro_arch_series_id, "DistroArchSeries.id")

    processor_id = Int(name="processor", allow_none=False)
    processor = Reference(processor_id, "Processor.id")

    virtualized = Bool(name="virtualized", allow_none=False)

    date_created = DateTime(
        name="date_created", tzinfo=pytz.UTC, allow_none=False)
    date_started = DateTime(
        name="date_started", tzinfo=pytz.UTC, allow_none=True)
    date_finished = DateTime(
        name="date_finished", tzinfo=pytz.UTC, allow_none=True)
    date_first_dispatched = DateTime(
        name="date_first_dispatched", tzinfo=pytz.UTC, allow_none=True)

    builder_id = Int(name="builder", allow_none=True)
    builder = Reference(builder_id, "Builder.id")

    status = DBEnum(name="status", enum=BuildStatus, allow_none=False)

    log_id = Int(name="log", allow_none=True)
    log = Reference(log_id, "LibraryFileAlias.id")

    upload_log_id = Int(name="upload_log", allow_none=True)
    upload_log = Reference(upload_log_id, "LibraryFileAlias.id")

    dependencies = Unicode(name="dependencies", allow_none=True)

    failure_count = Int(name="failure_count", allow_none=False)

    build_farm_job_id = Int(name="build_farm_job", allow_none=False)
    build_farm_job = Reference(build_farm_job_id, "BuildFarmJob.id")

    def __init__(self, build_farm_job, git_repository, commit_sha1,
                 distro_arch_series, processor, virtualized,
                 date_created=DEFAULT):
        """Construct a `CIBuild`."""
        super().__init__()
        self.build_farm_job = build_farm_job
        self.git_repository = git_repository
        self.commit_sha1 = commit_sha1
        self.distro_arch_series = distro_arch_series
        self.processor = processor
        self.virtualized = virtualized
        self.date_created = date_created
        self.status = BuildStatus.NEEDSBUILD

    @property
    def is_private(self):
        """See `IBuildFarmJob`."""
        return self.git_repository.private

    def __repr__(self):
        return "<CIBuild %s/+build/%s>" % (
            self.git_repository.unique_name, self.id)

    @property
    def title(self):
        """See `IBuildFarmJob`."""
        return "%s CI build of %s:%s" % (
            self.distro_arch_series.architecturetag,
            self.git_repository.unique_name, self.commit_sha1)

    @property
    def distribution(self):
        """See `IPackageBuild`."""
        return self.distro_arch_series.distroseries.distribution

    @property
    def distro_series(self):
        """See `IPackageBuild`."""
        return self.distro_arch_series.distroseries

    @property
    def pocket(self):
        """See `IPackageBuild`."""
        return PackagePublishingPocket.UPDATES

    @property
    def arch_tag(self):
        """See `ICIBuild`."""
        return self.distro_arch_series.architecturetag

    @property
    def archive(self):
        """See `IPackageBuild`."""
        return self.distribution.main_archive

    @property
    def score(self):
        """See `ICIBuild`."""
        if self.buildqueue_record is None:
            return None
        else:
            return self.buildqueue_record.lastscore

    @property
    def can_be_retried(self):
        """See `IBuildFarmJob`."""
        # First check that the behaviour would accept the build if it
        # succeeded.
        if self.distro_series.status == SeriesStatus.OBSOLETE:
            return False
        return super().can_be_retried

    def calculateScore(self):
        # Low latency is especially useful for CI builds, so score these
        # above bulky things like live filesystem builds, but below
        # important things like builds of proposed Ubuntu stable updates.
        # See https://help.launchpad.net/Packaging/BuildScores.
        return 2600

    def getMedianBuildDuration(self):
        """Return the median duration of our recent successful builds."""
        store = IStore(self)
        result = store.find(
            (CIBuild.date_started, CIBuild.date_finished),
            CIBuild.git_repository == self.git_repository_id,
            CIBuild.distro_arch_series == self.distro_arch_series_id,
            CIBuild.status == BuildStatus.FULLYBUILT)
        result.order_by(Desc(CIBuild.date_finished))
        durations = [row[1] - row[0] for row in result[:9]]
        if len(durations) == 0:
            return None
        durations.sort()
        return durations[len(durations) // 2]

    def estimateDuration(self):
        """See `IBuildFarmJob`."""
        median = self.getMedianBuildDuration()
        if median is not None:
            return median
        return timedelta(minutes=10)

    def lfaUrl(self, lfa):
        """Return the URL for a LibraryFileAlias in this context."""
        if lfa is None:
            return None
        return ProxiedLibraryFileAlias(lfa, self).http_url

    @property
    def log_url(self):
        """See `IBuildFarmJob`."""
        return self.lfaUrl(self.log)

    @property
    def upload_log_url(self):
        """See `IPackageBuild`."""
        return self.lfaUrl(self.upload_log)

    @cachedproperty
    def eta(self):
        """The datetime when the build job is estimated to complete.

        This is the BuildQueue.estimated_duration plus the
        Job.date_started or BuildQueue.getEstimatedJobStartTime.
        """
        if self.buildqueue_record is None:
            return None
        queue_record = self.buildqueue_record
        if queue_record.status == BuildQueueStatus.WAITING:
            start_time = queue_record.getEstimatedJobStartTime()
        else:
            start_time = queue_record.date_started
        if start_time is None:
            return None
        duration = queue_record.estimated_duration
        return start_time + duration

    @property
    def estimate(self):
        """If true, the date value is an estimate."""
        if self.date_finished is not None:
            return False
        return self.eta is not None

    @property
    def date(self):
        """The date when the build completed or is estimated to complete."""
        if self.estimate:
            return self.eta
        return self.date_finished

    def getConfiguration(self, logger=None):
        """See `ICIBuild`."""
        try:
            paths = (
                ".launchpad.yaml",
                )
            for path in paths:
                try:
                    blob = self.git_repository.getBlob(
                        path, rev=self.commit_sha1)
                    break
                except GitRepositoryBlobNotFound:
                    pass
            else:
                if logger is not None:
                    logger.exception(
                        "Cannot find .launchpad.yaml in %s" %
                        self.git_repository.unique_name)
                raise MissingConfiguration(self.git_repository.unique_name)
        except GitRepositoryScanFault as e:
            msg = "Failed to get .launchpad.yaml from %s"
            if logger is not None:
                logger.exception(msg, self.git_repository.unique_name)
            raise CannotFetchConfiguration(
                "%s: %s" % (msg % self.git_repository.unique_name, e))
        return parse_configuration(self.git_repository, blob)

    def verifySuccessfulUpload(self):
        """See `IPackageBuild`."""
        # We have no interesting checks to perform here.

    def notify(self, extra_info=None):
        """See `IPackageBuild`."""
        # We don't currently send any notifications.


@implementer(ICIBuildSet)
class CIBuildSet(SpecificBuildFarmJobSourceMixin):

    def new(self, git_repository, commit_sha1, distro_arch_series,
            date_created=DEFAULT):
        """See `ICIBuildSet`."""
        store = IMasterStore(CIBuild)
        build_farm_job = getUtility(IBuildFarmJobSource).new(
            CIBuild.job_type, BuildStatus.NEEDSBUILD, date_created)
        cibuild = CIBuild(
            build_farm_job, git_repository, commit_sha1, distro_arch_series,
            distro_arch_series.processor, virtualized=True,
            date_created=date_created)
        store.add(cibuild)
        store.flush()
        return cibuild

    def findByGitRepository(self, git_repository, commit_sha1s=None):
        """See `ICIBuildSet`."""
        clauses = [CIBuild.git_repository == git_repository]
        if commit_sha1s is not None:
            clauses.append(CIBuild.commit_sha1.is_in(commit_sha1s))
        return IStore(CIBuild).find(CIBuild, *clauses)

    def _isBuildableArchitectureAllowed(self, das):
        """Check whether we may build for a buildable `DistroArchSeries`.

        The caller is assumed to have already checked that a suitable chroot
        is available (either directly or via
        `DistroSeries.buildable_architectures`).
        """
        return (
            das.enabled
            # We only support builds on virtualized builders at the moment.
            and das.processor.supports_virtualized)

    def _isArchitectureAllowed(self, das, pocket, snap_base=None):
        return (
            das.getChroot(pocket=pocket) is not None
            and self._isBuildableArchitectureAllowed(das))

    def requestBuild(self, git_repository, commit_sha1, distro_arch_series):
        """See `ICIBuildSet`."""
        pocket = PackagePublishingPocket.UPDATES
        if not self._isArchitectureAllowed(distro_arch_series, pocket):
            raise CIBuildDisallowedArchitecture(distro_arch_series, pocket)

        result = IStore(CIBuild).find(
            CIBuild,
            CIBuild.git_repository == git_repository,
            CIBuild.commit_sha1 == commit_sha1,
            CIBuild.distro_arch_series == distro_arch_series)
        if not result.is_empty():
            raise CIBuildAlreadyRequested

        build = self.new(git_repository, commit_sha1, distro_arch_series)
        build.queueBuild()
        notify(ObjectCreatedEvent(build))
        return build

    def _tryToRequestBuild(self, git_repository, commit_sha1, das, logger):
        try:
            if logger is not None:
                logger.info(
                    "Requesting CI build for %s on %s/%s",
                    commit_sha1, das.distroseries.name, das.architecturetag,
                )
            self.requestBuild(git_repository, commit_sha1, das)
        except CIBuildAlreadyRequested:
            pass
        except Exception as e:
            if logger is not None:
                logger.error(
                    "Failed to request CI build for %s on %s/%s: %s",
                    commit_sha1, das.distroseries.name, das.architecturetag, e
                )

    def requestBuildsForRefs(self, git_repository, ref_paths, logger=None):
        """See `ICIBuildSet`."""
        commit_sha1s = get_all_commits_for_paths(git_repository, ref_paths)
        # getCommits performs a web request!
        commits = getUtility(IGitHostingClient).getCommits(
            git_repository.getInternalPath(), commit_sha1s,
            # XXX cjwatson 2022-01-19: We should also fetch
            # debian/.launchpad.yaml (or perhaps make the path a property of
            # the repository) once lpcraft and launchpad-buildd support
            # using alternative paths for builds.
            filter_paths=[".launchpad.yaml"])
        for commit in commits:
            try:
                configuration = parse_configuration(
                    git_repository, commit["blobs"][".launchpad.yaml"])
            except CannotParseConfiguration as e:
                if logger is not None:
                    logger.error(e)
                continue
            for das in determine_DASes_to_build(configuration):
                self._tryToRequestBuild(
                    git_repository, commit["sha1"], das,  logger)

    def getByID(self, build_id):
        """See `ISpecificBuildFarmJobSource`."""
        store = IMasterStore(CIBuild)
        return store.get(CIBuild, build_id)

    def getByBuildFarmJob(self, build_farm_job):
        """See `ISpecificBuildFarmJobSource`."""
        return Store.of(build_farm_job).find(
            CIBuild, build_farm_job_id=build_farm_job.id).one()

    def preloadBuildsData(self, builds):
        lfas = load_related(LibraryFileAlias, builds, ["log_id"])
        load_related(LibraryFileContent, lfas, ["contentID"])
        distroarchseries = load_related(
            DistroArchSeries, builds, ["distro_arch_series_id"])
        distroseries = load_related(
            DistroSeries, distroarchseries, ["distroseriesID"])
        load_related(Distribution, distroseries, ["distributionID"])

    def getByBuildFarmJobs(self, build_farm_jobs):
        """See `ISpecificBuildFarmJobSource`."""
        if len(build_farm_jobs) == 0:
            return EmptyResultSet()
        rows = Store.of(build_farm_jobs[0]).find(
            CIBuild, CIBuild.build_farm_job_id.is_in(
                bfj.id for bfj in build_farm_jobs))
        return DecoratedResultSet(rows, pre_iter_hook=self.preloadBuildsData)

    def deleteByGitRepository(self, git_repository):
        """See `ICIBuildSet`."""
        self.findByGitRepository(git_repository).remove()
