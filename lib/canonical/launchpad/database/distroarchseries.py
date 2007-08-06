# Copyright 2004-2005 Canonical Ltd.  All rights reserved.

__metaclass__ = type
__all__ = ['DistroArchSeries',
           'DistroArchSeriesSet',
           'PocketChroot'
           ]

from zope.interface import implements
from zope.component import getUtility

from sqlobject import (
    BoolCol, IntCol, StringCol, ForeignKey, SQLRelatedJoin, SQLObjectNotFound)

from canonical.database.sqlbase import SQLBase, sqlvalues, quote_like, quote
from canonical.database.constants import DEFAULT
from canonical.database.enumcol import EnumCol

from canonical.launchpad.interfaces import (
    IDistroArchSeries, IBinaryPackageReleaseSet, IPocketChroot,
    IHasBuildRecords, IBinaryPackageName, IDistroArchSeriesSet,
    IBuildSet, IPublishing)

from canonical.launchpad.database.binarypackagename import BinaryPackageName
from canonical.launchpad.database.distroarchseriesbinarypackage import (
    DistroArchSeriesBinaryPackage)
from canonical.launchpad.database.publishing import (
    BinaryPackagePublishingHistory)
from canonical.launchpad.database.publishedpackage import PublishedPackage
from canonical.launchpad.database.processor import Processor
from canonical.launchpad.database.binarypackagerelease import (
    BinaryPackageRelease)
from canonical.launchpad.helpers import shortlist
from canonical.lp.dbschema import (
    PackagePublishingPocket, PackagePublishingStatus)

class DistroArchSeries(SQLBase):
    implements(IDistroArchSeries, IHasBuildRecords, IPublishing)
    _table = 'DistroArchRelease'
    _defaultOrder = 'id'

    distroseries = ForeignKey(dbName='distrorelease',
        foreignKey='DistroSeries', notNull=True)
    processorfamily = ForeignKey(dbName='processorfamily',
        foreignKey='ProcessorFamily', notNull=True)
    architecturetag = StringCol(notNull=True)
    official = BoolCol(notNull=True)
    owner = ForeignKey(dbName='owner', foreignKey='Person', notNull=True)
    package_count = IntCol(notNull=True, default=DEFAULT)

    packages = SQLRelatedJoin('BinaryPackageRelease',
        joinColumn='distroarchseries',
        intermediateTable='BinaryPackagePublishing',
        otherColumn='binarypackagerelease')

    def __getitem__(self, name):
        return self.getBinaryPackage(name)

    @property
    def default_processor(self):
        """See IDistroArchSeries"""
        # XXX cprov 2005-08-31:
        # I could possibly be better designed, let's think about it in
        # the future. Pick the first processor we found for this
        # distroarchseries.processorfamily. The data model should
        # change to have a default processor for a processorfamily
        return self.processors[0]

    @property
    def processors(self):
        """See IDistroArchSeries"""
        return Processor.selectBy(family=self.processorfamily, orderBy='id')

    @property
    def title(self):
        """See IDistroArchSeries """
        return '%s for %s (%s)' % (
            self.distroseries.title, self.architecturetag,
            self.processorfamily.name
            )

    @property
    def displayname(self):
        """See IDistroArchSeries."""
        return '%s %s' % (self.distroseries.name, self.architecturetag)

    def updatePackageCount(self):
        """See IDistroArchSeries """
        query = """
            BinaryPackagePublishingHistory.distroarchrelease = %s AND
            BinaryPackagePublishingHistory.archive IN %s AND
            BinaryPackagePublishingHistory.status = %s AND
            BinaryPackagePublishingHistory.pocket = %s
            """ % sqlvalues(
                    self,
                    [archive.id for archive in self.all_distro_archives],
                    PackagePublishingStatus.PUBLISHED,
                    PackagePublishingPocket.RELEASE
                 )
        self.package_count = BinaryPackagePublishingHistory.select(
            query).count()

    @property
    def isNominatedArchIndep(self):
        """See IDistroArchSeries"""
        return (self.distroseries.nominatedarchindep and
                self.id == self.distroseries.nominatedarchindep.id)

    def getPocketChroot(self, pocket=None):
        """See IDistroArchSeries"""
        if not pocket:
            pocket = PackagePublishingPocket.RELEASE

        pchroot = PocketChroot.selectOneBy(distroarchseries=self,
                                           pocket=pocket)

        return pchroot

    def getChroot(self, pocket=None, default=None):
        """See IDistroArchSeries"""
        pocket_chroot = self.getPocketChroot(pocket)

        if pocket_chroot is None:
            return default

        return pocket_chroot.chroot

    def addOrUpdateChroot(self, pocket, chroot):
        """See IDistroArchSeries"""
        pocket_chroot = self.getPocketChroot(pocket)

        if pocket_chroot is None:
            return PocketChroot(
                distroarchseries=self, pocket=pocket, chroot=chroot)
        else:
            pocket_chroot.chroot = chroot

        return pocket_chroot

    def findPackagesByName(self, pattern, fti=False):
        """Search BinaryPackages matching pattern and archtag"""
        binset = getUtility(IBinaryPackageReleaseSet)
        return binset.findByNameInDistroSeries(
            self.distroseries, pattern, self.architecturetag, fti)

    def searchBinaryPackages(self, text):
        """See IDistroArchSeries."""
        archives = [archive.id for archive in self.all_distro_archives]
        bprs = BinaryPackageRelease.select("""
            BinaryPackagePublishingHistory.distroarchrelease = %s AND
            BinaryPackagePublishingHistory.archive IN %s AND
            BinaryPackagePublishingHistory.binarypackagerelease =
                BinaryPackageRelease.id AND
            BinaryPackagePublishingHistory.status != %s AND
            BinaryPackageRelease.binarypackagename =
                BinaryPackageName.id AND
            (BinaryPackageRelease.fti @@ ftq(%s) OR
             BinaryPackageName.name ILIKE '%%' || %s || '%%')
            """ % (quote(self),
                   quote(archives),
                   quote(PackagePublishingStatus.REMOVED),
                   quote(text),
                   quote_like(text)),
            selectAlso="""
                rank(BinaryPackageRelease.fti, ftq(%s))
                AS rank""" % sqlvalues(text),
            clauseTables=['BinaryPackagePublishingHistory',
                          'BinaryPackageName'],
            prejoinClauseTables=["BinaryPackageName"],
            orderBy=['-rank'],
            distinct=True)
        # import here to avoid circular import problems
        from canonical.launchpad.database import (
            DistroArchSeriesBinaryPackageRelease)
        return [DistroArchSeriesBinaryPackageRelease(
                    distroarchseries=self,
                    binarypackagerelease=bpr) for bpr in bprs]

    def getBinaryPackage(self, name):
        """See IDistroArchSeries."""
        if not IBinaryPackageName.providedBy(name):
            try:
                name = BinaryPackageName.byName(name)
            except SQLObjectNotFound:
                return None
        return DistroArchSeriesBinaryPackage(
            self, name)

    def getBuildRecords(self, status=None, name=None, pocket=None):
        """See IHasBuildRecords"""
        # use facility provided by IBuildSet to retrieve the records
        return getUtility(IBuildSet).getBuildsByArchIds(
            [self.id], status, name, pocket)

    def getReleasedPackages(self, binary_name, pocket=None,
                            include_pending=False, exclude_pocket=None,
                            archive=None):
        """See IDistroArchSeries."""
        queries = []

        if not IBinaryPackageName.providedBy(binary_name):
            binary_name = BinaryPackageName.byName(binary_name)

        queries.append("""
        binarypackagerelease=binarypackagerelease.id AND
        binarypackagerelease.binarypackagename=%s AND
        distroarchrelease = %s
        """ % sqlvalues(binary_name, self))

        if pocket is not None:
            queries.append("pocket=%s" % sqlvalues(pocket.value))

        if exclude_pocket is not None:
            queries.append("pocket!=%s" % sqlvalues(exclude_pocket.value))

        if include_pending:
            queries.append("status in (%s, %s)" % sqlvalues(
                PackagePublishingStatus.PUBLISHED,
                PackagePublishingStatus.PENDING))
        else:
            queries.append("status=%s" % sqlvalues(
                PackagePublishingStatus.PUBLISHED))

        archives = []
        if archive is None:
            archives = [archive.id for archive in self.all_distro_archives]
        else:
            archives = [archive.id]
        queries.append("archive IN %s" % sqlvalues(archives))

        published = BinaryPackagePublishingHistory.select(
            " AND ".join(queries),
            clauseTables = ['BinaryPackageRelease'],
            orderBy=['id'])

        return shortlist(published)

    def findDepCandidateByName(self, name):
        """See IPublishedSet."""
        return PublishedPackage.selectFirstBy(
            binarypackagename=name, distroarchseries=self,
            packagepublishingstatus=PackagePublishingStatus.PUBLISHED,
            orderBy=['-id'])

    def getPendingPublications(self, archive, pocket, is_careful):
        """See IPublishing."""
        queries = [
            "distroarchrelease = %s AND archive = %s"
            % sqlvalues(self, archive)
            ]

        target_status = [PackagePublishingStatus.PENDING]
        if is_careful:
            target_status.append(PackagePublishingStatus.PUBLISHED)
        queries.append("status IN %s" % sqlvalues(target_status))

        # restrict to a specific pocket.
        queries.append('pocket = %s' % sqlvalues(pocket))

        # exclude RELEASE pocket if the distroseries was already released,
        # since it should not change.
        if (not self.distroseries.isUnstable() and
            archive in self.all_distro_archives):
            queries.append(
            'pocket != %s' % sqlvalues(PackagePublishingPocket.RELEASE))

        publications = BinaryPackagePublishingHistory.select(
                    " AND ".join(queries), orderBy=["-id"])

        return publications

    def publish(self, diskpool, log, archive, pocket, is_careful=False):
        """See IPublishing."""
        log.debug("Attempting to publish pending binaries for %s"
              % self.architecturetag)

        dirty_pockets = set()

        for bpph in self.getPendingPublications(archive, pocket, is_careful):
            if not self.distroseries.checkLegalPocket(
                bpph, is_careful, log):
                continue
            bpph.publish(diskpool, log)
            dirty_pockets.add((self.distroseries.name, bpph.pocket))

        return dirty_pockets

    @property
    def main_archive(self):
        return self.distroseries.distribution.main_archive

    @property
    def all_distro_archives(self):
        return self.distroseries.distribution.all_distro_archives


class DistroArchSeriesSet:
    """This class is to deal with DistroArchSeries related stuff"""

    implements(IDistroArchSeriesSet)

    def __iter__(self):
        return iter(DistroArchSeries.select())

    def get(self, dar_id):
        """See canonical.launchpad.interfaces.IDistributionSet."""
        return DistroArchSeries.get(dar_id)

    def count(self):
        return DistroArchSeries.select().count()


class PocketChroot(SQLBase):
    implements(IPocketChroot)
    _table = "PocketChroot"

    distroarchseries = ForeignKey(dbName='distroarchrelease',
                                   foreignKey='DistroArchSeries',
                                   notNull=True)

    pocket = EnumCol(schema=PackagePublishingPocket,
                     default=PackagePublishingPocket.RELEASE,
                     notNull=True)

    chroot = ForeignKey(dbName='chroot', foreignKey='LibraryFileAlias')

