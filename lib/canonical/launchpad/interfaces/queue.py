# Copyright 2004-2005 Canonical Ltd.  All rights reserved.

"""Queue interfaces."""

__metaclass__ = type

__all__ = [
    'QueueStateWriteProtectedError',
    'QueueInconsistentStateError',
    'QueueSourceAcceptError',
    'QueueBuildAcceptError',
    'IPackageUploadQueue',
    'IPackageUpload',
    'IPackageUploadBuild',
    'IPackageUploadSource',
    'IPackageUploadCustom',
    'IPackageUploadSet',
    'IHasQueueItems',
    ]

from zope.schema import Int, TextLine
from zope.interface import Interface, Attribute
from canonical.launchpad import _


class QueueStateWriteProtectedError(Exception):
    """This exception prevent directly set operation in queue state.

    The queue state machine is controlled by its specific provided methods,
    like: setNew, setAccepted and so on.
    """


class QueueInconsistentStateError(Exception):
    """Queue state machine error.

    It's generated when the solicited state makes the record
    inconsistent against the current system constraints.
    """


class QueueSourceAcceptError(Exception):
    """It prevents a PackageUploadSource from being ACCEPTED.

    It is generated by Component and/or Section mismatching in a DistroSeries.
    """

class QueueBuildAcceptError(Exception):
    """It prevents a PackageUploadBuild from being ACCEPTED.

    It is generated by Component and/or Section mismatching in a DistroSeries.
    """


class IPackageUploadQueue(Interface):
    """Used to establish permission to a group of package uploads.

    Recieves an IDistroSeries and a PackageUploadStatus dbschema
    on initialisation.
    No attributes exposed via interface, only used to check permissions.
    """


class IPackageUpload(Interface):
    """A Queue item for Lucille"""

    id = Int(
            title=_("ID"), required=True, readonly=True,
            )

    status = Int(
            title=_("Queue status"), required=False, readonly=True,
            )

    distroseries = Int(
            title=_("Series"), required=True, readonly=False,
            )

    pocket = Int(
            title=_("The pocket"), required=True, readonly=False,
            )

    changesfile = Attribute("The librarian alias for the changes file "
                            "associated with this upload")

    signing_key = Attribute("Changesfile Signing Key.")
    archive = Int(title=_("Archive"), required=True, readonly=True)
    sources = Attribute("The queue sources associated with this queue item")
    builds = Attribute("The queue builds associated with the queue item")
    customfiles = Attribute("Custom upload files associated with this "
                            "queue item")

    datecreated = Attribute("The date on which this queue was created.")
    displayname = TextLine(
        title=_("Generic displayname for a queue item"), readonly=True)
    displayversion = TextLine(
        title=_("The source package version for this item"), readonly=True)
    displayarchs = TextLine(
        title=_("Architetures related to this item"), readonly=True)

    sourcepackagerelease = Attribute(
        "The source package release for this item")

    contains_source = Attribute("whether or not this upload contains sources")
    contains_build = Attribute("whether or not this upload contains binaries")
    contains_installer = Attribute(
        "whether or not this upload contains installers images")
    contains_translation = Attribute(
        "whether or not this upload contains translations")
    contains_upgrader = Attribute(
        "wheter or not this upload contains upgrader images")
    contains_ddtp = Attribute(
        "wheter or not this upload contains DDTP images")
    isPPA = Attribute(
        "Return True if this PackageUpload is a PPA upload.")

    def setNew():
        """Set queue state to NEW."""

    def setUnapproved():
        """Set queue state to UNAPPROVED."""

    def setAccepted():
        """Set queue state to ACCEPTED.

        Perform the required checks on its content, so we guarantee data
        integrity by code.
        """

    def setDone():
        """Set queue state to DONE."""

    def setRejected():
        """Set queue state to REJECTED."""

    def realiseUpload(logger=None):
        """Take this ACCEPTED upload and create the publishing records for it
        as appropriate.

        When derivation is taken into account, this may result in queue items
        being created for derived distributions.

        If a logger is provided, messages will be written to it as the upload
        is entered into the publishing records.
        """

    def addSource(spr):
        """Add the provided source package release to this queue entry."""

    def addBuild(build):
        """Add the provided build to this queue entry."""

    def addCustom(library_file, custom_type):
        """Add the provided library file alias as a custom queue entry of
        the given custom type.
        """

    def syncUpdate():
        """Write updates made on this object to the database.

        This should be used when you can't wait until the transaction is
        committed to have some updates actually written to the database.
        """

    def notify(announce_list=None, summary_text=None,
        changes_file_object=None, logger=None):
        """Notify by email when there is a new distroseriesqueue entry.

        This will send new, accept, announce and rejection messages as
        appropriate.

        :param announce_list: The email address of the distro announcements

        :param summary_text: Any additional text to append to the auto-
            generated summary.  This is also the only text used if there is
            a rejection message generated.

        :param changes_file_object: An open file object pointing at the
            changes file.  Current, only nascentupload need supply this
            as the transaction is not committed to the DB at that point so
            data needs to be obtained from the changes file.

        :param logger: Specify a logger object if required.  Mainly for tests.
        """


class IPackageUploadBuild(Interface):
    """A Queue item's related builds (for Lucille)"""

    id = Int(
            title=_("ID"), required=True, readonly=True,
            )


    packageupload = Int(
            title=_("PackageUpload"), required=True,
            readonly=False,
            )

    build = Int(
            title=_("The related build"), required=True, readonly=False,
            )

    def publish(logger=None):
        """Publish this queued source in the distroseries referred to by
        the parent queue item.

        We determine the distroarchseries by matching architecturetags against
        the distroarchseries the build was compiled for.

        This method can raise NotFoundError if the architecturetag can't be
        matched up in the queue item's distroseries.

        Returns a list of the secure binary package publishing history
        objects in case it is of use to the caller. This may include records
        published into other distroarchseriess if this build contained arch
        independant packages.

        If a logger is provided, information pertaining to the publishing
        process will be logged to it.
        """

class IPackageUploadSource(Interface):
    """A Queue item's related sourcepackagereleases (for Lucille)"""

    id = Int(
            title=_("ID"), required=True, readonly=True,
            )


    packageupload = Int(
            title=_("PackageUpload"), required=True,
            readonly=False,
            )

    sourcepackagerelease = Int(
            title=_("The related source package release"), required=True,
            readonly=False,
            )

    def verifyBeforeAccept():
        """Perform overall checks before promoting source to ACCEPTED queue.

        If two queue items have the same (name, version) pair there is
        an inconsistency. To identify this situation we check the accepted
        & done queue items for each distroseries for such duplicates and
        raise an exception if any are found.
        See bug #31038 & #62976 for details.
        """

    def verifyBeforePublish():
        """Perform overall checks before publishing a source queue record.

        Check if the source package files do not collide with the
        ones already published in the archive. We need this to catch
        inaccurate  *epoched* versions, which would pass the upload version
        check but would collide with diff(s) or dsc(s) previously published
        on disk. This inconsistency is well known in debian-like archives
        and happens because filenames do not contain epoch. For further
        information see bug #119753.
        """

    def checkComponentAndSection():
        """Verify the current Component and Section via Selection table.

        Check if the current sourcepackagerelease component and section
        matches with those included in the target distribution series,
        if not raise QueueSourceAcceptError exception.
        """

    def publish(logger=None):
        """Publish this queued source in the distroseries referred to by
        the parent queue item.

        Returns the secure source package publishing history object in case
        it is of use to the caller.

        If a logger is provided, information pertaining to the publishing
        process will be logged to it.
        """


class IPackageUploadCustom(Interface):
    """Stores anything else than source and binaries that needs publication.

    It is essentially a map between DistroSeries/Pocket/LibrarianFileAlias.

    The LibrarianFileAlias usually is a TGZ containing an specific format.
    Currently we support:
     [Debian-Installer, Rosetta-Translation, Dist-Upgrader, DDTP-Tarball]

    Each one has an processor which is invoked by the publish method.
    """

    id = Int(
            title=_("ID"), required=True, readonly=True,
            )

    packageupload = Int(
            title=_("PackageUpload"), required=True,
            readonly=False,
            )

    customformat = Int(
            title=_("The custom format for the file"), required=True,
            readonly=False,
            )

    libraryfilealias = Int(
            title=_("The file"), required=True, readonly=False,
            )

    # useful properties
    archive_config = Attribute("Build and return an ArchiveConfig object.")

    def temp_filename():
        """Return a filename containing the libraryfile for this upload.

        This filename will be in a temporary directory and can be the
        ensure dir can be deleted once whatever needed the file is finished
        with it.
        """

    def publish(logger=None):
        """Publish this custom item directly into the filesystem.

        This can only be run by a process which has filesystem access to
        the archive (or wherever else the content will go).

        If a logger is provided, information pertaining to the publishing
        process will be logged to it.
        """

    def publish_DEBIAN_INSTALLER(logger=None):
        """Publish this custom item as a raw installer tarball.

        This will write the installer tarball out to the right part of
        the archive.

        If a logger is provided, information pertaining to the publishing
        process will be logged to it.
        """

    def publish_DIST_UPGRADER(logger=None):
        """Publish this custom item as a raw dist-upgrader tarball.

        This will write the dist-upgrader tarball out to the right part of
        the archive.

        If a logger is provided, information pertaining to the publishing
        process will be logged to it.
        """

    def publish_DDTP_TARBALL(logger=None):
        """Publish this custom item as a raw ddtp-tarball.

        This will write the ddtp-tarball out to the right part of
        the archive.

        If a logger is provided, information pertaining to the publishing
        process will be logged to it.
        """

    def publish_ROSETTA_TRANSLATIONS(logger=None):
        """Publish this custom item as a rosetta tarball.

        Essentially this imports the tarball into rosetta.

        If a logger is provided, information pertaining to the publishing
        process will be logged to it.
        """

class IPackageUploadSet(Interface):
    """Represents a set of IPackageUploads"""

    def __iter__():
        """IPackageUpload iterator"""

    def __getitem__(queue_id):
        """Retrieve an IPackageUpload by a given id"""

    def get(queue_id):
        """Retrieve an IPackageUpload by a given id"""

    def count(status=None, distroseries=None, pocket=None):
        """Number of IPackageUpload present in a given status.

        If status is ommitted return the number of all entries.
        'distroseries' is optional and restrict the results in given
        distroseries, same for pocket.
        """

class IHasQueueItems(Interface):
    """An Object that has queue items"""

    def getPackageUploadQueue(state):
        """Return an IPackageUploadeQueue occording the given state."""

    def getQueueItems(status=None, name=None, version=None,
                      exact_match=False, pocket=None, archive=None):
        """Get the union of builds, sources and custom queue items.

        Returns builds, sources and custom queue items in a given state,
        matching a give name and version terms.

        If 'status' is not supplied, return all items in the queues,
        it supports multiple statuses as a list.

        If 'name' and 'version' are supplied only items which match (SQL LIKE)
        the sourcepackage name, binarypackage name or the filename will be
        returned.  'name' can be supplied without supplying 'version'.
        'version' has no effect on custom queue items.

        If 'pocket' is specified return only queue items inside it, otherwise
        return all pockets.  It supports multiple pockets as a list.

        If 'archive' is specified return only queue items targeted to this
        archive, if not restrict the results to the IDistribution.main_archive.

        Use 'exact_match' argument for precise results.
        """
