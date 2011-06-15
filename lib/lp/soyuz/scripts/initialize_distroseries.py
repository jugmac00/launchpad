# Copyright 2009-2011 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""Initialize a distroseries from its parent distroseries."""


__metaclass__ = type
__all__ = [
    'InitializationError',
    'InitializeDistroSeries',
    ]

from operator import methodcaller

import transaction
from zope.component import getUtility

from canonical.database.sqlbase import sqlvalues
from canonical.launchpad.helpers import ensure_unicode
from canonical.launchpad.interfaces.lpstorm import (
    IMasterStore,
    IStore,
    )
from lp.buildmaster.enums import BuildStatus
from lp.registry.interfaces.distroseriesparent import IDistroSeriesParentSet
from lp.registry.interfaces.pocket import PackagePublishingPocket
from lp.soyuz.adapters.packagelocation import PackageLocation
from lp.soyuz.enums import (
    ArchivePurpose,
    PackageUploadStatus,
    )
from lp.soyuz.interfaces.archive import IArchiveSet
from lp.soyuz.interfaces.component import IComponentSet
from lp.soyuz.interfaces.packagecloner import IPackageCloner
from lp.soyuz.interfaces.packageset import IPackagesetSet
from lp.soyuz.model.packageset import Packageset


class InitializationError(Exception):
    """Raised when there is an exception during the initialization process."""


class InitializeDistroSeries:
    """Copy in all of the parent distroseries's configuration. This
    includes all configuration for distroseries as well as distroarchseries,
    publishing and all publishing records for sources and binaries.

    Preconditions:
      The distroseries must exist, and be completly unused, with no source
      or binary packages existing, as well as no distroarchseries set up.
      Section and component selections must be empty. It must not have a
      parent series.

    Outcome:
      The distroarchseries set up in the parent series will be copied.
      The publishing structure will be copied from the parent. All
      PUBLISHED and PENDING packages in the parent will be created in
      this distroseries and its distroarchseriess. All component and section
      selections will be duplicated, as will any permission-related
      structures.

    Note:
      This method will raise a InitializationError when the pre-conditions
      are not met. After this is run, you still need to construct chroots
      for building, you need to add anything missing wrt. ports etc. This
      method is only meant to give you a basic copy of a parent series in
      order to assist you in preparing a new series of a distribution or
      in the initialization of a derivative.
    """

    def __init__(
        self, distroseries, parents, arches=(), packagesets=(),
        rebuild=False, overlays=(), overlay_pockets=(),
        overlay_components=()):
        # Avoid circular imports
        from lp.registry.model.distroseries import DistroSeries

        # XXX: rvb 2011-05-27 bug=789091: This code should be fixed to support
        # initializing from multiple parents.
        self.parent_id = parents[0]
        self.parent = IStore(
            DistroSeries).get(DistroSeries, int(self.parent_id))

        self.distroseries = distroseries
        self.arches = arches
        self.packagesets = [
            ensure_unicode(packageset) for packageset in packagesets]
        self.rebuild = rebuild
        self.overlays = overlays
        self.overlay_pockets = overlay_pockets
        self.overlay_components = overlay_components
        self._store = IMasterStore(DistroSeries)

    def check(self):
        if self.distroseries.isDerivedSeries():
            raise InitializationError(
                ("DistroSeries {child.name} has already been initialized"
                 ".").format(
                    child=self.distroseries))
        if self.distroseries.distribution.id == self.parent.distribution.id:
            self._checkBuilds()
        self._checkQueue()
        self._checkSeries()

    def _checkBuilds(self):
        """Assert there are no pending builds for parent series.

        Only cares about the RELEASE pocket, which is the only one inherited
        via initializeFromParent method.
        """
        # only the RELEASE pocket is inherited, so we only check
        # pending build records for it.
        pending_builds = self.parent.getBuildRecords(
            BuildStatus.NEEDSBUILD, pocket=PackagePublishingPocket.RELEASE)

        if pending_builds.any():
            raise InitializationError("Parent series has pending builds.")

    def _checkQueue(self):
        """Assert upload queue is empty on parent series.

        Only cares about the RELEASE pocket, which is the only one inherited
        via initializeFromParent method.
        """
        # only the RELEASE pocket is inherited, so we only check
        # queue items for it.
        for queue in (
            PackageUploadStatus.NEW, PackageUploadStatus.ACCEPTED,
            PackageUploadStatus.UNAPPROVED):
            items = self.parent.getQueueItems(
                queue, pocket=PackagePublishingPocket.RELEASE)
            if items:
                raise InitializationError(
                    "Parent series queues are not empty.")

    def _checkSeries(self):
        error = (
            "Can not copy distroarchseries from parent, there are "
            "already distroarchseries(s) initialized for this series.")
        sources = self.distroseries.getAllPublishedSources()
        binaries = self.distroseries.getAllPublishedBinaries()
        if not all(
            map(methodcaller('is_empty'), (
                sources, binaries, self.distroseries.architectures,
                self.distroseries.sections))):
            raise InitializationError(error)
        if self.distroseries.components:
            raise InitializationError(error)

    def initialize(self):
        self._set_parent()
        self._copy_configuration()
        self._copy_architectures()
        self._copy_packages()
        self._copy_packagesets()
        self._set_initialized()
        transaction.commit()

    def _set_parent(self):
        # XXX: rvb 2011-05-27 bug=789091: This code should be fixed to support
        # initializing from multiple parents.
        dsp_set = getUtility(IDistroSeriesParentSet)
        if self.overlays and self.overlays[0]:
            pocket = PackagePublishingPocket.__metaclass__.getTermByToken(
                PackagePublishingPocket, self.overlay_pockets[0]).value
            component_set = getUtility(IComponentSet)
            component = component_set[self.overlay_components[0]]
            dsp_set.new(
                self.distroseries, self.parent, initialized=False,
                is_overlay=True, pocket=pocket, component=component)
        else:
            dsp_set.new(self.distroseries, self.parent, initialized=False)

    def _set_initialized(self):
        dsp_set = getUtility(IDistroSeriesParentSet)
        distroseriesparent = dsp_set.getByDerivedAndParentSeries(
            self.distroseries, self.parent)
        distroseriesparent.initialized = True

    def _copy_configuration(self):
        self.distroseries.backports_not_automatic = \
            self.parent.backports_not_automatic

    def _copy_architectures(self):
        include = ''
        if self.arches:
            include = "AND architecturetag IN %s" % sqlvalues(self.arches)
        self._store.execute("""
            INSERT INTO DistroArchSeries
            (distroseries, processorfamily, architecturetag, owner, official)
            SELECT %s, processorfamily, architecturetag, %s, official
            FROM DistroArchSeries WHERE distroseries = %s
            AND enabled = TRUE %s
            """ % (sqlvalues(self.distroseries, self.distroseries.owner,
            self.parent) + (include,)))
        self._store.flush()
        self.distroseries.nominatedarchindep = self.distroseries[
            self.parent.nominatedarchindep.architecturetag]

    def _copy_packages(self):
        # Perform the copies
        self._copy_component_section_and_format_selections()

        # Prepare the list of distroarchseries for which binary packages
        # shall be copied.
        distroarchseries_list = []
        for arch in self.distroseries.architectures:
            if self.arches and (arch.architecturetag not in self.arches):
                continue
            parent_arch = self.parent[arch.architecturetag]
            distroarchseries_list.append((parent_arch, arch))
        # Now copy source and binary packages.
        self._copy_publishing_records(distroarchseries_list)
        self._copy_packaging_links()

    def _copy_publishing_records(self, distroarchseries_list):
        """Copy the publishing records from the parent arch series
        to the given arch series in ourselves.

        We copy all PENDING and PUBLISHED records as PENDING into our own
        publishing records.

        We copy only the RELEASE pocket in the PRIMARY and DEBUG archives.
        """
        archive_set = getUtility(IArchiveSet)

        spns = []
        # The overhead from looking up each packageset is mitigated by
        # this usually running from a job.
        if self.packagesets:
            for pkgsetid in self.packagesets:
                pkgset = self._store.get(Packageset, int(pkgsetid))
                spns += list(pkgset.getSourcesIncluded())

        for archive in self.parent.distribution.all_distro_archives:
            if archive.purpose not in (
                ArchivePurpose.PRIMARY, ArchivePurpose.DEBUG):
                continue

            target_archive = archive_set.getByDistroPurpose(
                self.distroseries.distribution, archive.purpose)
            if archive.purpose is ArchivePurpose.PRIMARY:
                assert target_archive is not None, (
                    "Target archive doesn't exist?")
            origin = PackageLocation(
                archive, self.parent.distribution, self.parent,
                PackagePublishingPocket.RELEASE)
            destination = PackageLocation(
                target_archive, self.distroseries.distribution,
                self.distroseries, PackagePublishingPocket.RELEASE)
            proc_families = None
            if self.rebuild:
                proc_families = [
                    das[1].processorfamily
                    for das in distroarchseries_list]
                distroarchseries_list = ()
            getUtility(IPackageCloner).clonePackages(
                origin, destination, distroarchseries_list,
                proc_families, spns, self.rebuild)

    def _copy_component_section_and_format_selections(self):
        """Copy the section, component and format selections from the parent
        distro series into this one.
        """
        # Copy the component selections
        self._store.execute('''
            INSERT INTO ComponentSelection (distroseries, component)
            SELECT %s AS distroseries, cs.component AS component
            FROM ComponentSelection AS cs WHERE cs.distroseries = %s
            ''' % sqlvalues(self.distroseries.id,
            self.parent.id))
        # Copy the section selections
        self._store.execute('''
            INSERT INTO SectionSelection (distroseries, section)
            SELECT %s as distroseries, ss.section AS section
            FROM SectionSelection AS ss WHERE ss.distroseries = %s
            ''' % sqlvalues(self.distroseries.id,
            self.parent.id))
        # Copy the source format selections
        self._store.execute('''
            INSERT INTO SourcePackageFormatSelection (distroseries, format)
            SELECT %s as distroseries, spfs.format AS format
            FROM SourcePackageFormatSelection AS spfs
            WHERE spfs.distroseries = %s
            ''' % sqlvalues(self.distroseries.id,
            self.parent.id))

    def _copy_packaging_links(self):
        """Copy the packaging links from the parent series to this one."""
        self._store.execute("""
            INSERT INTO
                Packaging(
                    distroseries, sourcepackagename, productseries,
                    packaging, owner)
            SELECT
                ChildSeries.id,
                Packaging.sourcepackagename,
                Packaging.productseries,
                Packaging.packaging,
                Packaging.owner
            FROM
                Packaging
                -- Joining the parent distroseries permits the query to build
                -- the data set for the series being updated, yet results are
                -- in fact the data from the original series.
                JOIN Distroseries ChildSeries
                    ON Packaging.distroseries = %s
            WHERE
                -- Select only the packaging links that are in the parent
                -- that are not in the child.
                ChildSeries.id = %s
                AND Packaging.sourcepackagename in (
                    SELECT sourcepackagename
                    FROM Packaging
                    WHERE distroseries in (
                        SELECT id
                        FROM Distroseries
                        WHERE id = %s
                        )
                    EXCEPT
                    SELECT sourcepackagename
                    FROM Packaging
                    WHERE distroseries in (
                        SELECT id
                        FROM Distroseries
                        WHERE id = ChildSeries.id
                        )
                    )
            """ % (self.parent.id, self.distroseries.id, self.parent.id))

    def _copy_packagesets(self):
        """Copy packagesets from the parent distroseries."""
        packagesets = self._store.find(Packageset, distroseries=self.parent)
        parent_to_child = {}
        # Create the packagesets, and any archivepermissions
        for parent_ps in packagesets:
            # Cross-distro initializations get packagesets owned by the
            # distro owner, otherwise the old owner is preserved.
            if self.packagesets and str(parent_ps.id) not in self.packagesets:
                continue
            if self.distroseries.distribution == self.parent.distribution:
                new_owner = parent_ps.owner
            else:
                new_owner = self.distroseries.owner
            child_ps = getUtility(IPackagesetSet).new(
                parent_ps.name, parent_ps.description,
                new_owner, distroseries=self.distroseries,
                related_set=parent_ps)
            self._store.execute("""
                INSERT INTO Archivepermission
                (person, permission, archive, packageset, explicit)
                SELECT person, permission, %s, %s, explicit
                FROM Archivepermission WHERE packageset = %s
                """ % sqlvalues(
                    self.distroseries.main_archive, child_ps.id,
                    parent_ps.id))
            parent_to_child[parent_ps] = child_ps
        # Copy the relations between sets, and the contents
        for old_series_ps, new_series_ps in parent_to_child.items():
            old_series_sets = old_series_ps.setsIncluded(
                direct_inclusion=True)
            for old_series_child in old_series_sets:
                new_series_ps.add(parent_to_child[old_series_child])
            new_series_ps.add(old_series_ps.sourcesIncluded(
                direct_inclusion=True))
