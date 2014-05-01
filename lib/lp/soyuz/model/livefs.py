# Copyright 2014 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

__metaclass__ = type
__all__ = [
    'LiveFS',
    ]

import pytz
from storm.locals import (
    DateTime,
    Desc,
    Int,
    JSON,
    Reference,
    Store,
    Storm,
    Unicode,
    )
from zope.component import getUtility
from zope.interface import implements

from lp.buildmaster.enums import BuildStatus
from lp.registry.errors import NoSuchDistroSeries
from lp.registry.interfaces.distribution import (
    IDistributionSet,
    NoSuchDistribution,
    )
from lp.registry.interfaces.distroseries import IDistroSeriesSet
from lp.registry.interfaces.person import (
    IPersonSet,
    NoSuchPerson,
    )
from lp.registry.interfaces.role import IHasOwner
from lp.services.database.constants import (
    DEFAULT,
    UTC_NOW,
    )
from lp.services.database.interfaces import (
    IMasterStore,
    IStore,
    )
from lp.services.database.stormexpr import Greatest
from lp.services.features import getFeatureFlag
from lp.soyuz.interfaces.livefs import (
    ILiveFS,
    ILiveFSSet,
    InvalidLiveFSNamespace,
    LIVEFS_FEATURE_FLAG,
    LiveFSBuildAlreadyPending,
    LiveFSFeatureDisabled,
    NoSuchLiveFS,
    )
from lp.soyuz.interfaces.livefsbuild import ILiveFSBuildSet
from lp.soyuz.model.archive import Archive
from lp.soyuz.model.livefsbuild import LiveFSBuild


def livefs_modified(livefs, event):
    """Update the date_last_modified property when a LiveFS is modified.

    This method is registered as a subscriber to `IObjectModifiedEvent`
    events on live filesystems.
    """
    livefs.date_last_modified = UTC_NOW


class LiveFS(Storm):
    """See `ILiveFS`."""

    __storm_table__ = 'LiveFS'

    def __str__(self):
        return '%s %s' % (self.distroseries, self.name)

    implements(ILiveFS, IHasOwner)

    id = Int(primary=True)

    date_created = DateTime(
        name='date_created', tzinfo=pytz.UTC, allow_none=False)
    date_last_modified = DateTime(
        name='date_last_modified', tzinfo=pytz.UTC, allow_none=False)

    registrant_id = Int(name='registrant', allow_none=False)
    registrant = Reference(registrant_id, 'Person.id')

    owner_id = Int(name='owner', allow_none=False)
    owner = Reference(owner_id, 'Person.id')

    distroseries_id = Int(name='distroseries', allow_none=False)
    distroseries = Reference(distroseries_id, 'DistroSeries.id')

    name = Unicode(name='name', allow_none=False)

    metadata = JSON('json_data')

    def __init__(self, registrant, owner, distroseries, name, metadata,
                 date_created):
        """Construct a `LiveFS`."""
        if not getFeatureFlag(LIVEFS_FEATURE_FLAG):
            raise LiveFSFeatureDisabled
        super(LiveFS, self).__init__()
        self.registrant = registrant
        self.owner = owner
        self.distroseries = distroseries
        self.name = name
        self.metadata = metadata
        self.date_created = date_created
        self.date_last_modified = date_created

    def requestBuild(self, requester, archive, distroarchseries, pocket,
                     unique_key=None, metadata_override=None):
        """See `ILiveFS`."""
        pending = IStore(self).find(
            LiveFSBuild,
            LiveFSBuild.livefs_id == self.id,
            LiveFSBuild.archive_id == archive.id,
            LiveFSBuild.distroarchseries_id == distroarchseries.id,
            LiveFSBuild.pocket == pocket,
            LiveFSBuild.unique_key == unique_key,
            LiveFSBuild.status == BuildStatus.NEEDSBUILD)
        if pending.any() is not None:
            raise LiveFSBuildAlreadyPending

        build = getUtility(ILiveFSBuildSet).new(
            requester, self, archive, distroarchseries, pocket,
            unique_key=unique_key, metadata_override=metadata_override)
        build.queueBuild()
        return build

    def _getBuilds(self, filter_term, order_by):
        """The actual query to get the builds."""
        query_args = [
            LiveFSBuild.livefs == self,
            LiveFSBuild.archive_id == Archive.id,
            Archive._enabled == True,
            ]
        if filter_term is not None:
            query_args.append(filter_term)
        result = Store.of(self).find(LiveFSBuild, *query_args)
        result.order_by(order_by)
        return result

    @property
    def builds(self):
        """See `ILiveFS`."""
        order_by = (
            Desc(Greatest(
                LiveFSBuild.date_started,
                LiveFSBuild.date_finished)),
            Desc(LiveFSBuild.date_created),
            Desc(LiveFSBuild.id))
        return self._getBuilds(None, order_by)


class LiveFSSet:
    """See `ILiveFSSet`."""

    implements(ILiveFSSet)

    def new(self, registrant, owner, distroseries, name, metadata,
            date_created=DEFAULT):
        """See `ILiveFSSet`."""
        store = IMasterStore(LiveFS)
        livefs = LiveFS(
            registrant, owner, distroseries, name, metadata, date_created)
        store.add(livefs)
        return livefs

    def exists(self, owner, distroseries, name):
        """See `ILiveFSSet`."""
        livefs = self.get(owner, distroseries, name)
        if livefs:
            return True
        else:
            return False

    def get(self, owner, distroseries, name):
        """See `ILiveFSSet`."""
        store = IMasterStore(LiveFS)
        return store.find(
            LiveFS,
            LiveFS.owner == owner,
            LiveFS.distroseries == distroseries,
            LiveFS.name == name).one()

    def _findOrRaise(self, error, name, finder, *args):
        if name is None:
            return None
        args = list(args)
        args.append(name)
        result = finder(*args)
        if result is None:
            raise error(name)
        return result

    def traverse(self, segments):
        """See `ILiveFSSet`."""
        traversed_segments = []

        def get_next_segment():
            try:
                result = segments.next()
            except StopIteration:
                raise InvalidLiveFSNamespace("/".join(traversed_segments))
            if result is None:
                raise AssertionError("None segment passed to traverse()")
            traversed_segments.append(result)
            return result

        person_name = get_next_segment()
        person = self._findOrRaise(
            NoSuchPerson, person_name, getUtility(IPersonSet).getByName)
        distribution_name = get_next_segment()
        distribution = self._findOrRaise(
            NoSuchDistribution, distribution_name,
            getUtility(IDistributionSet).getByName)
        distroseries_name = get_next_segment()
        distroseries = self._findOrRaise(
            NoSuchDistroSeries, distroseries_name,
            getUtility(IDistroSeriesSet).queryByName, distribution)
        livefs_name = get_next_segment()
        return self._findOrRaise(
            NoSuchLiveFS, livefs_name, self.get, person, distroseries)
