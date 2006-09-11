# Copyright 2004-2005 Canonical Ltd.  All rights reserved.

__metaclass__ = type
__all__ = [
    'Upload',
    'UploadBuild',
    'UploadSource',
    'UploadCustom',
    'UploadSet',
    'filechunks',
    ]

import os
import shutil
import tempfile

from zope.interface import implements

from sqlobject import (
    ForeignKey, SQLMultipleJoin, SQLObjectNotFound)

from canonical.database.sqlbase import SQLBase, sqlvalues
from canonical.database.constants import UTC_NOW

from canonical.lp.dbschema import (
    EnumCol, DistroReleaseQueueStatus, DistroReleaseQueueCustomFormat,
    PackagePublishingPocket, PackagePublishingStatus)

from canonical.launchpad.interfaces import (
    IUpload, IUploadBuild, IUploadSource,
    IUploadCustom, NotFoundError, QueueStateWriteProtectedError,
    QueueInconsistentStateError, QueueSourceAcceptError,
    QueueBuildAcceptError, IUploadSet)

from canonical.librarian.interfaces import DownloadFailed


from canonical.launchpad.database.publishing import (
    SecureSourcePackagePublishingHistory,
    SecureBinaryPackagePublishingHistory)


from canonical.cachedproperty import cachedproperty

from canonical.archivepublisher.publishing import pocketsuffix

# There are imports below in UploadCustom for various bits
# of the archivepublisher which cause circular import errors if they
# are placed here.


def filechunks(file, chunk_size=256*1024):
    """Return an iterator which reads chunks of the given file."""
    # We use the two-arg form of the iterator here to form an iterator
    # which reads chunks from the given file.
    return iter(lambda: file.read(chunk_size), '')


def debug(logger, msg):
    """Shorthand debug notation for publish() methods."""
    if logger is not None:
        logger.debug(msg)


class Upload(SQLBase):
    """A Queue item for Lucille."""
    implements(IUpload)

    _defaultOrder = ['id']

    status = EnumCol(dbName='status', unique=False, notNull=True,
                     default=DistroReleaseQueueStatus.NEW,
                     schema=DistroReleaseQueueStatus)

    distrorelease = ForeignKey(dbName="distrorelease",
                               foreignKey='DistroRelease')

    pocket = EnumCol(dbName='pocket', unique=False, default=None, notNull=True,
                     schema=PackagePublishingPocket)

    changesfile = ForeignKey(dbName='changesfile',
                             foreignKey="LibraryFileAlias",
                             notNull=True)

    archive = ForeignKey(dbName="archive",
                         foreignKey="archive")
    

    # Join this table to the UploadBuild and the
    # UploadSource objects which are related.
    sources = SQLMultipleJoin('UploadSource',
                              joinColumn='distroreleasequeue')
    builds = SQLMultipleJoin('UploadBuild',
                             joinColumn='distroreleasequeue')

    # Also the custom files associated with the build.
    customfiles = SQLMultipleJoin('UploadCustom',
                                  joinColumn='distroreleasequeue')


    def _set_status(self, value):
        """Directly write on 'status' is forbidden.

        Force user to use the provided machine-state methods.
        Raises QueueStateWriteProtectedError.
        """
        # XXX: bug #29663: this is a bit evil, but does the job. Andrew
        # has suggested using immutable=True in the column definition.
        #   -- kiko, 2006-01-25
        # allow 'status' write only in creation process.
        if self._SO_creating:
            self._SO_set_status(value)
            return
        # been fascist
        raise QueueStateWriteProtectedError(
            'Directly write on queue status is forbidden use the '
            'provided methods to set it.')

    def setNew(self):
        """See IUpload."""
        if self.status == DistroReleaseQueueStatus.NEW:
            raise QueueInconsistentStateError(
                'Queue item already new')
        self._SO_set_status(DistroReleaseQueueStatus.NEW)

    def setUnapproved(self):
        """See IUpload."""
        if self.status == DistroReleaseQueueStatus.UNAPPROVED:
            raise QueueInconsistentStateError(
                'Queue item already unapproved')
        self._SO_set_status(DistroReleaseQueueStatus.UNAPPROVED)

    def setAccepted(self):
        """See IUpload."""
        # Explode if something wrong like warty/RELEASE pass through
        # NascentUpload/UploadPolicies checks
        assert self.distrorelease.canUploadToPocket(self.pocket)

        if self.status == DistroReleaseQueueStatus.ACCEPTED:
            raise QueueInconsistentStateError(
                'Queue item already accepted')

        for source in self.sources:
            # If two queue items have the same (name, version) pair,
            # then there is an inconsistency.  Check the accepted
            # queue items for each distro release for such duplicates
            # and raise an exception if any are found.
            # See bug #31038 for details.
            for distrorelease in self.distrorelease.distribution:
                if distrorelease.getQueueItems(
                    status=DistroReleaseQueueStatus.ACCEPTED,
                    name=source.sourcepackagerelease.name,
                    version=source.sourcepackagerelease.version,
                    exact_match=True).count() > 0:
                    raise QueueInconsistentStateError(
                        'This sourcepackagerelease is already accepted in %s.'
                        % distrorelease.name)

            # if something goes wrong we will raise an exception
            # (QueueSourceAcceptError) before setting any value.
            # Mask the error with state-machine default exception
            try:
                source.checkComponentAndSection()
            except QueueSourceAcceptError, info:
                raise QueueInconsistentStateError(info)

        for build in self.builds:
            # as before, but for QueueBuildAcceptError
            try:
                build.checkComponentAndSection()
            except QueueBuildAcceptError, info:
                raise QueueInconsistentStateError(info)

        # if the previous checks applied and pass we do set the value
        self._SO_set_status(DistroReleaseQueueStatus.ACCEPTED)

    def setDone(self):
        """See IUpload."""
        if self.status == DistroReleaseQueueStatus.DONE:
            raise QueueInconsistentStateError(
                'Queue item already done')
        self._SO_set_status(DistroReleaseQueueStatus.DONE)

    def setRejected(self):
        """See IUpload."""
        if self.status == DistroReleaseQueueStatus.REJECTED:
            raise QueueInconsistentStateError(
                'Queue item already rejected')
        self._SO_set_status(DistroReleaseQueueStatus.REJECTED)

    # XXX cprov 20060314: following properties should be redesigned to
    # reduce the duplicated code.
    @cachedproperty
    def containsSource(self):
        """See IUpload."""
        return self.sources

    @cachedproperty
    def containsBuild(self):
        """See IUpload."""
        return self.builds

    @cachedproperty
    def _customFormats(self):
        """Return the custom upload formats contained in this upload."""
        return [custom.customformat for custom in self.customfiles]

    @cachedproperty
    def containsInstaller(self):
        """See IUpload."""
        return (DistroReleaseQueueCustomFormat.DEBIAN_INSTALLER
                in self._customFormats)

    @cachedproperty
    def containsTranslation(self):
        """See IUpload."""
        return (DistroReleaseQueueCustomFormat.ROSETTA_TRANSLATIONS
                in self._customFormats)

    @cachedproperty
    def containsUpgrader(self):
        """See IUpload."""
        return (DistroReleaseQueueCustomFormat.DIST_UPGRADER
                in self._customFormats)

    @cachedproperty
    def datecreated(self):
        """See IUpload."""
        return self.changesfile.content.datecreated

    @cachedproperty
    def displayname(self):
        """See IUpload"""
        names = []
        for queue_source in self.sources:
            names.append(queue_source.sourcepackagerelease.name)
        for queue_build in  self.builds:
            names.append(queue_build.build.sourcepackagerelease.name)
        for queue_custom in self.customfiles:
            names.append(queue_custom.libraryfilealias.filename)
        return ",".join(names)

    @cachedproperty
    def displayarchs(self):
        """See IUpload"""
        archs = []
        for queue_source in self.sources:
            archs.append('source')
        for queue_build in self.builds:
            archs.append(queue_build.build.distroarchrelease.architecturetag)
        for queue_custom in self.customfiles:
            archs.append(queue_custom.customformat.title)
        return ",".join(archs)

    @cachedproperty
    def displayversion(self):
        """See IUpload"""
        if self.sources:
            return self.sources[0].sourcepackagerelease.version
        if self.builds:
            return self.builds[0].build.sourcepackagerelease.version
        if self.customfiles:
            return '-'

    @cachedproperty
    def sourcepackagerelease(self):
        """The source package release related to this queue item.

        This is currently heuristic but may be more easily calculated later.
        """
        assert self.sources or self.builds
        if self.sources:
            return self.sources[0].sourcepackagerelease
        if self.builds:
            return self.builds[0].build.sourcepackagerelease

    def realiseUpload(self, logger=None):
        """See IUpload."""
        assert self.status == DistroReleaseQueueStatus.ACCEPTED
        # Explode if something wrong like warty/RELEASE pass through
        # NascentUpload/UploadPolicies checks
        assert self.distrorelease.canUploadToPocket(self.pocket)

        # In realising an upload we first load all the sources into
        # the publishing tables, then the binaries, then we attempt
        # to publish the custom objects.
        for queue_source in self.sources:
            queue_source.publish(logger)
        for queue_build in self.builds:
            queue_build.publish(logger)
        for customfile in self.customfiles:
            customfile.publish(logger)

        self.setDone()

    def addSource(self, spr):
        """See IUpload."""
        return UploadSource(distroreleasequeue=self.id,
                                        sourcepackagerelease=spr.id)

    def addBuild(self, build):
        """See IUpload."""
        return UploadBuild(distroreleasequeue=self.id,
                                       build=build.id)

    def addCustom(self, library_file, custom_type):
        """See IUpload."""
        return UploadCustom(distroreleasequeue=self.id,
                                        libraryfilealias=library_file.id,
                                        customformat=custom_type)


class UploadBuild(SQLBase):
    """A Queue item's related builds (for Lucille)."""
    implements(IUploadBuild)

    _defaultOrder = ['id']

    upload = ForeignKey(
        dbName='distroreleasequeue',
        foreignKey='Upload'
        )

    build = ForeignKey(dbName='build', foreignKey='Build')

    def checkComponentAndSection(self):
        """See IUploadBuild."""
        distrorelease = self.distroreleasequeue.distrorelease
        for binary in self.build.binarypackages:
            if binary.component not in distrorelease.components:
                raise QueueBuildAcceptError(
                    'Component "%s" is not allowed in %s'
                    % (binary.component.name, distrorelease.name))
            if binary.section not in distrorelease.sections:
                raise QueueBuildAcceptError(
                    'Section "%s" is not allowed in %s' % (binary.section.name,
                                                           distrorelease.name))

    def publish(self, logger=None):
        """See IUploadBuild."""
        # Determine the build's architecturetag.
        build_archtag = self.build.distroarchrelease.architecturetag
        # Determine the target arch release.
        # This will raise NotFoundError if anything odd happens.
        target_dar = self.distroreleasequeue.distrorelease[build_archtag]
        debug(logger, "Publishing build to %s/%s/%s" % (
            target_dar.distrorelease.distribution.name,
            target_dar.distrorelease.name,
            build_archtag))
        # And get the other distroarchreleases
        other_dars = set(self.distroreleasequeue.distrorelease.architectures)
        other_dars = other_dars - set([target_dar])
        # First up, publish everything in this build into that dar.
        published_binaries = []
        for binary in self.build.binarypackages:
            target_dars = set([target_dar])
            if not binary.architecturespecific:
                target_dars = target_dars.union(other_dars)
                debug(logger, "... %s/%s (Arch Independent)" % (
                    binary.binarypackagename.name,
                    binary.version))
            else:
                debug(logger, "... %s/%s (Arch Specific)" % (
                    binary.binarypackagename.name,
                    binary.version))
            for each_target_dar in target_dars:
                # XXX: dsilvers: 20051020: What do we do about embargoed
                # binaries here? bug 3408
                sbpph = SecureBinaryPackagePublishingHistory(
                    binarypackagerelease=binary.id,
                    distroarchrelease=each_target_dar.id,
                    component=binary.component.id,
                    section=binary.section.id,
                    priority=binary.priority,
                    status=PackagePublishingStatus.PENDING,
                    datecreated=UTC_NOW,
                    pocket=self.distroreleasequeue.pocket,
                    embargo=False
                    )
                published_binaries.append(sbpph)


class UploadSource(SQLBase):
    """A Queue item's related sourcepackagereleases (for Lucille)."""
    implements(IUploadSource)

    _defaultOrder = ['id']

    upload = ForeignKey(
        dbName='distroreleasequeue',
        foreignKey='Upload'
        )

    sourcepackagerelease = ForeignKey(
        dbName='sourcepackagerelease',
        foreignKey='SourcePackageRelease'
        )

    def checkComponentAndSection(self):
        """See IUploadSource."""
        distrorelease = self.distroreleasequeue.distrorelease
        component = self.sourcepackagerelease.component
        section = self.sourcepackagerelease.section

        if component not in distrorelease.components:
            raise QueueSourceAcceptError(
                'Component "%s" is not allowed in %s' % (component.name,
                                                         distrorelease.name))

        if section not in distrorelease.sections:
            raise QueueSourceAcceptError(
                'Section "%s" is not allowed in %s' % (section.name,
                                                       distrorelease.name))

    def publish(self, logger=None):
        """See IUploadSource."""
        # Publish myself in the distrorelease pointed at by my queue item.
        # XXX: dsilvers: 20051020: What do we do here to support embargoed
        # sources? bug 3408
        debug(logger, "Publishing source %s/%s to %s/%s" % (
            self.sourcepackagerelease.name,
            self.sourcepackagerelease.version,
            self.distroreleasequeue.distrorelease.distribution.name,
            self.distroreleasequeue.distrorelease.name))

        return SecureSourcePackagePublishingHistory(
            distrorelease=self.distroreleasequeue.distrorelease.id,
            sourcepackagerelease=self.sourcepackagerelease.id,
            component=self.sourcepackagerelease.component.id,
            section=self.sourcepackagerelease.section.id,
            status=PackagePublishingStatus.PENDING,
            datecreated=UTC_NOW,
            pocket=self.distroreleasequeue.pocket,
            embargo=False)


class UploadCustom(SQLBase):
    """A Queue item's related custom format uploads."""
    implements(IUploadCustom)

    _defaultOrder = ['id']

    distroreleasequeue = ForeignKey(
        dbName='distroreleasequeue',
        foreignKey='Upload'
        )

    customformat = EnumCol(dbName='customformat', unique=False,
                           default=None, notNull=True,
                           schema=DistroReleaseQueueCustomFormat)

    libraryfilealias = ForeignKey(dbName='libraryfilealias',
                                  foreignKey="LibraryFileAlias",
                                  notNull=True)

    def publish(self, logger=None):
        """See IUploadCustom."""
        # This is a marker as per the comment in dbschema.py.
        ##CUSTOMFORMAT##
        # Essentially, if you alter anything to do with what custom formats
        # are, what their tags are, or anything along those lines, you should
        # grep for the marker in the source tree and fix it up in every place
        # so marked.
        name = "publish_" + self.customformat.name
        method = getattr(self, name, None)
        if method is not None:
            method(logger)
        else:
            raise NotFoundError("Unable to find a publisher method for %s" % (
                self.customformat.name))

    def temp_filename(self):
        """See IUploadCustom."""
        temp_dir = tempfile.mkdtemp()
        temp_file_name = os.path.join(temp_dir, self.libraryfilealias.filename)

        temp_file = file(temp_file_name, "wb")
        # Pump the file from the librarian...
        self.libraryfilealias.open()
        for chunk in filechunks(self.libraryfilealias):
            temp_file.write(chunk)
        temp_file.close()
        self.libraryfilealias.close()
        return temp_file_name

    @property
    def archive_config(self):
        """See IUploadCustom."""
        # XXX cprov 20050303: use the Zope Component Lookup to instantiate
        # the object in question and avoid circular imports
        from canonical.archivepublisher.config import Config as ArchiveConfig
        distrorelease = self.distroreleasequeue.distrorelease
        return ArchiveConfig(distrorelease.distribution)

    def publishInstallerOrUpgrader(self, action_method):
        """Publish either an installer or upgrader special using the
        supplied action method.
        """
        temp_filename = self.temp_filename()
        full_suite_name = "%s%s" % (
            self.distroreleasequeue.distrorelease.name,
            pocketsuffix[self.distroreleasequeue.pocket])
        try:
            action_method(
                self.archive_config.archiveroot, temp_filename,
                full_suite_name)
        finally:
            shutil.rmtree(os.path.dirname(temp_filename))

    def publish_DEBIAN_INSTALLER(self, logger=None):
        """See IUploadCustom."""
        # XXX cprov 20050303: We need to use the Zope Component Lookup
        # to instantiate the object in question and avoid circular imports
        from canonical.archivepublisher.debian_installer import (
            process_debian_installer)
        
        self.publishInstallerOrUpgrader(process_debian_installer)

    def publish_DIST_UPGRADER(self, logger=None):
        """See IUploadCustom."""
        # XXX cprov 20050303: We need to use the Zope Component Lookup
        # to instantiate the object in question and avoid circular imports
        from canonical.archivepublisher.dist_upgrader import (
            process_dist_upgrader)
        
        self.publishInstallerOrUpgrader(process_dist_upgrader)

    def publish_ROSETTA_TRANSLATIONS(self, logger=None):
        """See IUploadCustom."""
        # XXX: dsilvers: 20051115: We should be able to get a
        # sourcepackagerelease directly.
        sourcepackagerelease = (
            self.distroreleasequeue.builds[0].build.sourcepackagerelease)

        # Attach the translation tarball. It's always published.
        try:
            sourcepackagerelease.attachTranslationFiles(
                self.libraryfilealias, True)
        except DownloadFailed:
            if logger is not None:
                debug(logger, "Unable to fetch %s to import it into Rosetta" %
                    self.libraryfilealias.url)


class UploadSet:
    """See IUploadSet"""
    implements(IUploadSet)

    def __iter__(self):
        """See IUploadSet."""
        return iter(Upload.select())

    def __getitem__(self, queue_id):
        """See IUploadSet."""
        try:
            return Upload.get(queue_id)
        except SQLObjectNotFound:
            raise NotFoundError(queue_id)

    def get(self, queue_id):
        """See IUploadSet."""
        try:
            return Upload.get(queue_id)
        except SQLObjectNotFound:
            raise NotFoundError(queue_id)

    def count(self, status=None, distrorelease=None):
        """See IUploadSet."""
        clauses = []
        if status:
            clauses.append("status=%s" % sqlvalues(status))

        if distrorelease:
            clauses.append("distrorelease=%s" % sqlvalues(distrorelease.id))

        query = " AND ".join(clauses)
        return Upload.select(query).count()

