# Copyright 2009 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

# pylint: disable-msg=E0211,E0213

"""Interfaces related to package-diff system."""

__metaclass__ = type

__all__ = [
    'IPackageDiff',
    'IPackageDiffSet',
    'PackageDiffAlreadyRequested',
    ]

from zope.interface import (
    Attribute,
    Interface,
    )
from zope.schema import (
    Choice,
    Datetime,
    Object,
    )

from canonical.launchpad import _
from canonical.launchpad.interfaces.librarian import ILibraryFileAlias

from lp.soyuz.enums import PackageDiffStatus


class PackageDiffAlreadyRequested(Exception):
    """Raised on attempts to request an already recorded diff request. """


class IPackageDiff(Interface):
    """Package diff request and storage.

    See `doc/package-diff.txt` for details about the attributes.
    """
    id = Attribute("The PackageDiff unique number.")

    from_source = Attribute(_("The base ISourcePackageRelease."))
    to_source = Attribute(_("The target ISourcePackageRelease."))

    date_requested = Datetime(
        title=_('Date Requested'), required=True, readonly=True)

    requester = Choice(
        title=_('User'),
        required=True,
        vocabulary='ValidPerson',
        description=_("The person requesting the diff."))

    date_fulfilled = Datetime(
        title=_('Date Fulfilled'), required=False)

    diff_content = Object(
        schema=ILibraryFileAlias,
        title=_("The ILibraryFileAlias containing the diff."),
        required=False)

    status = Choice(
        title=_('Status'),
        description=_('The status of this package diff request.'),
        vocabulary='PackageDiffStatus',
        required=False, default=PackageDiffStatus.PENDING,
        )

    title = Attribute("The Package diff title.")

    private = Attribute(
        "Whether or not the package diff content is private. "
        "A package diff is considered private when 'to_source' was "
        "originally uploaded to a private archive.")

    def performDiff():
        """Performs a diff between two packages."""


class IPackageDiffSet(Interface):
    """The set of `PackageDiff`."""

    def __iter__():
        """Iterate over all `PackageDiff`."""

    def get(diff_id):
        """Retrieve a `PackageDiff` for the given id."""

    def getPendingDiffs(limit=None):
        """Return all pending `PackageDiff` records.

        :param limit: optional results limitation.

        :return a `SelectResult` ordered by id respecting the given limit.
        """

    def getDiffsToReleases(self, sprs, preload_for_display=False):
        """Return all diffs that targetting a set of source package releases.

        :param sprs: a sequence of `SourcePackageRelease` objects.
        :param preload_for_display: True if all the attributes needed for
            link rendering should be preloaded.

        :return a `ResultSet` ordered by `SourcePackageRelease` ID and
        then diff request date in descending order.  If sprs is empty,
        EmptyResultSet is returned.
        """

    def getDiffBetweenReleases(self, sprs):
        """Return the diff that is targetted to the two SPRs.

        :param sprs: a two-uple of `SourcePackageRelease` objects.

        :return a `ResultSet` or None.
        """
