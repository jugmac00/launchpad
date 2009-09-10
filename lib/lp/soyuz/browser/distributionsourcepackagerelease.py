# Copyright 2009 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

__metaclass__ = type

__all__ = [
    'DistributionSourcePackageReleaseNavigation',
    'DistributionSourcePackageReleaseView',
    ]

import operator

from zope.component import getUtility

from canonical.cachedproperty import cachedproperty
from canonical.launchpad.browser.librarian import ProxiedLibraryFileAlias
from canonical.launchpad.webapp.interfaces import NotFoundError
from canonical.launchpad.webapp import (
    LaunchpadView, Navigation, stepthrough)
from lp.archivepublisher.debversion import Version
from lp.soyuz.interfaces.build import IBuildSet
from lp.soyuz.interfaces.distributionsourcepackagerelease import (
    IDistributionSourcePackageRelease)
from lp.soyuz.interfaces.publishing import PackagePublishingStatus


class DistributionSourcePackageReleaseNavigation(Navigation):
    usedfor = IDistributionSourcePackageRelease

    @stepthrough('+build')
    def traverse_build(self, name):
        try:
            build_id = int(name)
        except ValueError:
            return None
        try:
            return getUtility(IBuildSet).getByBuildID(build_id)
        except NotFoundError:
            return None


class DistributionSourcePackageReleaseView(LaunchpadView):
    """View logic for `DistributionSourcePackageRelease` objects. """

    usedfor = IDistributionSourcePackageRelease

    @property
    def page_title(self):
        return self.context.title

    @cachedproperty
    def _cached_publishing_history(self):
        """Local copy of the context 'publishing_history' values."""
        return list(self.context.publishing_history)

    @property
    def currently_published(self):
        """A list of published publications for this release.

        :return: a `list` of `SourcePackagePublishingHistory` currently
            published in the main archives.
        """
        return [
            publishing
            for publishing in self._cached_publishing_history
            if publishing.status == PackagePublishingStatus.PUBLISHED
            ]

    @property
    def files(self):
        """The source package release files as `ProxiedLibraryFileAlias`."""
        last_publication = self._cached_publishing_history[0]
        return [
            ProxiedLibraryFileAlias(
                source_file.libraryfile, last_publication.archive)
            for source_file in self.context.files]

    @cachedproperty
    def sponsor(self):
        """This source package's sponsor.

        A source package was sponsored if the owner of the key used to sign
        its upload is different from its 'creator' (DSC 'Changed-by:')

        :return: the sponsor `IPerson`, or none if the upload was not
            sponsored.
        """
        upload = self.context.package_upload
        if upload is None:
            return None
        signing_key = upload.signing_key
        if signing_key is None:
            return None
        if signing_key.owner.id == self.context.creator.id:
            return None
        return signing_key.owner

    @cachedproperty
    def grouped_builds(self):
        """Builds for this source in the primary archive grouped by series.

        :return: a `list` of dictionaries containing 'distroseries' and its
             grouped 'builds' ordered by descending distroseries versions.
        """
        # Build a local list of `IBuilds` ordered by ascending
        # 'architecture_tag'.
        cached_builds = sorted(
            self.context.builds, key=operator.attrgetter('arch_tag'))

        # Build a list of unique `IDistroSeries` related with the local
        # builds ordered by descending version.
        def distroseries_sort_key(item):
            return Version(item.version)
        sorted_distroseries = sorted(
            set(build.distroseries for build in cached_builds),
            key=distroseries_sort_key, reverse=True)

        # Group builds as dictionaries.
        distroseries_builds = []
        for distroseries in sorted_distroseries:
            builds = [
                build
                for build in cached_builds
                if build.distroseries == distroseries
                ]
            distroseries_builds.append(
                {'distroseries': distroseries, 'builds': builds})

        return distroseries_builds
