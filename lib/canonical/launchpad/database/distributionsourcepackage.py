# Copyright 2005-2007 Canonical Ltd.  All rights reserved.
# pylint: disable-msg=E0611,W0212

"""Classes to represent source packages in a distribution."""

__metaclass__ = type

__all__ = [
    'DistributionSourcePackage',
    ]

from sqlobject.sqlbuilder import SQLConstant

from zope.interface import implements

from canonical.launchpad.interfaces import (
    BlueprintNotificationLevel, BugNotificationLevel, DeleteSubscriptionError,
    DuplicateSubscriptionError, IDistributionSourcePackage, IQuestionTarget,
    PackagePublishingStatus)
from canonical.database.sqlbase import sqlvalues
from canonical.launchpad.database.bug import BugSet, get_bug_tags_open_count
from canonical.launchpad.database.bugtarget import BugTargetBase
from canonical.launchpad.database.bugtask import BugTask, BugTaskSet
from canonical.launchpad.database.distributionsourcepackagecache import (
    DistributionSourcePackageCache)
from canonical.launchpad.database.distributionsourcepackagerelease import (
    DistributionSourcePackageRelease)
from canonical.launchpad.database.structuralsubscription import (
    StructuralSubscription)
from canonical.launchpad.database.publishing import (
    SourcePackagePublishingHistory)
from canonical.launchpad.database.sourcepackagerelease import (
    SourcePackageRelease)
from canonical.launchpad.database.sourcepackage import (
    SourcePackage, SourcePackageQuestionTargetMixin)


class DistributionSourcePackage(BugTargetBase,
                                SourcePackageQuestionTargetMixin):
    """This is a "Magic Distribution Source Package". It is not an
    SQLObject, but instead it represents a source package with a particular
    name in a particular distribution. You can then ask it all sorts of
    things about the releases that are published under its name, the latest
    or current release, etc.
    """

    implements(IDistributionSourcePackage, IQuestionTarget)

    def __init__(self, distribution, sourcepackagename):
        self.distribution = distribution
        self.sourcepackagename = sourcepackagename

    @property
    def name(self):
        """See IDistributionSourcePackage."""
        return self.sourcepackagename.name

    @property
    def displayname(self):
        """See IDistributionSourcePackage."""
        return '%s in %s' % (
            self.sourcepackagename.name, self.distribution.name)

    @property
    def bugtargetdisplayname(self):
        """See IBugTarget."""
        return "%s (%s)" % (self.name, self.distribution.displayname)

    @property
    def bugtargetname(self):
        """See IBugTarget."""
        return "%s (%s)" % (self.name, self.distribution.displayname)

    @property
    def title(self):
        """See IDistributionSourcePackage."""
        return 'Source Package "%s" in %s' % (
            self.sourcepackagename.name, self.distribution.title)

    @property
    def bug_reporting_guidelines(self):
        """See `IBugTarget`."""
        return self.distribution.bug_reporting_guidelines

    def __getitem__(self, version):
        return self.getVersion(version)

    def getVersion(self, version):
        """See IDistributionSourcePackage."""
        spph = SourcePackagePublishingHistory.select("""
            SourcePackagePublishingHistory.distroseries =
                DistroSeries.id AND
            DistroSeries.distribution = %s AND
            SourcePackagePublishingHistory.archive IN %s AND
            SourcePackagePublishingHistory.sourcepackagerelease =
                SourcePackageRelease.id AND
            SourcePackageRelease.sourcepackagename = %s AND
            SourcePackageRelease.version = %s
            """ % sqlvalues(self.distribution,
                            self.distribution.all_distro_archive_ids,
                            self.sourcepackagename,
                            version),
            orderBy='-datecreated',
            prejoinClauseTables=['SourcePackageRelease'],
            clauseTables=['DistroSeries', 'SourcePackageRelease'])
        if spph.count() == 0:
            return None
        return DistributionSourcePackageRelease(
            distribution=self.distribution,
            sourcepackagerelease=spph[0].sourcepackagerelease)

    # XXX kiko 2006-08-16: Bad method name, no need to be a property.
    @property
    def currentrelease(self):
        """See IDistributionSourcePackage."""
        order_const = "debversion_sort_key(SourcePackageRelease.version) DESC"
        spr = SourcePackageRelease.selectFirst("""
            SourcePackageRelease.sourcepackagename = %s AND
            SourcePackageRelease.id =
                SourcePackagePublishingHistory.sourcepackagerelease AND
            SourcePackagePublishingHistory.distroseries =
                DistroSeries.id AND
            DistroSeries.distribution = %s AND
            SourcePackagePublishingHistory.archive IN %s AND
            SourcePackagePublishingHistory.dateremoved is NULL
            """ % sqlvalues(self.sourcepackagename,
                            self.distribution,
                            self.distribution.all_distro_archive_ids),
            clauseTables=['SourcePackagePublishingHistory', 'DistroSeries'],
            orderBy=[SQLConstant(order_const),
                     "-SourcePackagePublishingHistory.datepublished"])

        if spr is None:
            return None
        else:
            return DistributionSourcePackageRelease(
                distribution=self.distribution,
                sourcepackagerelease=spr)

    def bugtasks(self, quantity=None):
        """See IDistributionSourcePackage."""
        return BugTask.select("""
            distribution=%s AND
            sourcepackagename=%s
            """ % sqlvalues(self.distribution.id,
                            self.sourcepackagename.id),
            orderBy='-datecreated',
            limit=quantity)

    def addSubscription(self, subscriber, subscribed_by):
        """See `IDistributionSourcePackage`."""
        subscription_already_exists = self.isSubscribed(subscriber)

        if subscription_already_exists:
            raise DuplicateSubscriptionError(
                "%s is already subscribed to %s." %
                (subscriber.name, self.displayname))
        else:
            return StructuralSubscription(
                distribution=self.distribution,
                sourcepackagename=self.sourcepackagename,
                subscriber=subscriber,
                subscribed_by=subscribed_by)

    def addBugSubscription(self, subscriber, subscribed_by):
        """See `IDistributionSourcePackage`."""
        # This is a helper method for creating a structural
        # subscription and immediately giving it a full
        # bug notification level. It is useful so long as
        # subscriptions are mainly used to implement bug contacts.
        sub = self.addSubscription(subscriber, subscribed_by)
        sub.bug_notification_level = BugNotificationLevel.COMMENTS
        return sub

    def removeSubscription(self, person):
        """See `IDistributionSourcePackage`."""
        subscription_to_remove = self.isSubscribed(person)

        if not subscription_to_remove:
            raise DeleteSubscriptionError(
                "%s is not subscribed to %s." % (
                person.name, self.displayname))
        else:
            subscription_to_remove.destroySelf()

    def removeBugSubscription(self, person):
        """See `IDistributionSourcePackage`."""
        subscription_to_remove = self.isSubscribed(person)

        if not subscription_to_remove:
            raise DeleteSubscriptionError(
                "%s is not subscribed to %s." % (
                person.name, self.displayname))
        else:
            if (subscription_to_remove.blueprint_notification_level >
                BlueprintNotificationLevel.NOTHING):
                # This is a subscription to other application too
                # so only set the bug notification level
                subscription_to_remove.bug_notification_level = (
                    BugNotificationLeve.NOTHING)
            else:
                subscription_to_remove.destroySelf()

    def isSubscribed(self, person):
        """See `IDistributionSourcePackage`."""
        subscriptions = StructuralSubscription.selectBy(
            distribution=self.distribution,
            sourcepackagename=self.sourcepackagename,
            subscriber=person)

        min_bug_notification_level = BugNotificationLevel.METADATA

        for sub in subscriptions:
            if sub.bug_notification_level > min_bug_notification_level:
                return sub
        return False

    @property
    def binary_package_names(self):
        """See IDistributionSourcePackage."""
        cache = DistributionSourcePackageCache.selectOne("""
            distribution = %s AND
            sourcepackagename = %s
            """ % sqlvalues(self.distribution.id, self.sourcepackagename.id))
        if cache is None:
            return None
        return cache.binpkgnames

    def get_distroseries_packages(self, active_only=True):
        """See IDistributionSourcePackage."""
        result = []
        for series in self.distribution.serieses:
            if active_only:
                if not series.active:
                    continue
            candidate = SourcePackage(self.sourcepackagename, series)
            if candidate.currentrelease is not None:
                result.append(candidate)
        return result

    @property
    def publishing_history(self):
        """See IDistributionSourcePackage."""
        return self._getPublishingHistoryQuery()

    # XXX kiko 2006-08-16: Bad method name, no need to be a property.
    @property
    def current_publishing_records(self):
        """See IDistributionSourcePackage."""
        status = PackagePublishingStatus.PUBLISHED
        return self._getPublishingHistoryQuery(status)

    def _getPublishingHistoryQuery(self, status=None):
        query = """
            DistroSeries.distribution = %s AND
            SourcePackagePublishingHistory.archive IN %s AND
            SourcePackagePublishingHistory.distroseries =
                DistroSeries.id AND
            SourcePackagePublishingHistory.sourcepackagerelease =
                SourcePackageRelease.id AND
            SourcePackageRelease.sourcepackagename = %s
            """ % sqlvalues(self.distribution,
                            self.distribution.all_distro_archive_ids,
                            self.sourcepackagename)

        if status is not None:
            query += ("AND SourcePackagePublishingHistory.status = %s"
                      % sqlvalues(status))

        return SourcePackagePublishingHistory.select(query,
            clauseTables=['DistroSeries', 'SourcePackageRelease'],
            prejoinClauseTables=['SourcePackageRelease'],
            orderBy='-datecreated')

    # XXX kiko 2006-08-16: Bad method name, no need to be a property.
    @property
    def releases(self):
        """See IDistributionSourcePackage."""
        ret = SourcePackagePublishingHistory.select("""
            sourcepackagepublishinghistory.distroseries = DistroSeries.id AND
            DistroSeries.distribution = %s AND
            sourcepackagepublishinghistory.archive IN %s AND
            sourcepackagepublishinghistory.sourcepackagerelease =
                sourcepackagerelease.id AND
            sourcepackagerelease.sourcepackagename = %s
            """ % sqlvalues(self.distribution,
                            self.distribution.all_distro_archive_ids,
                            self.sourcepackagename),
            orderBy='-datecreated',
            clauseTables=['distroseries', 'sourcepackagerelease'])
        result = []
        versions = set()
        for spp in ret:
            if spp.sourcepackagerelease.version not in versions:
                versions.add(spp.sourcepackagerelease.version)
                dspr = DistributionSourcePackageRelease(
                    distribution=self.distribution,
                    sourcepackagerelease=spp.sourcepackagerelease)
                result.append(dspr)
        return result

    def __eq__(self, other):
        """See IDistributionSourcePackage."""
        return (
            (IDistributionSourcePackage.providedBy(other)) and
            (self.distribution.id == other.distribution.id) and
            (self.sourcepackagename.id == other.sourcepackagename.id))

    def __ne__(self, other):
        """See IDistributionSourcePackage."""
        return not self.__eq__(other)

    def _getBugTaskContextWhereClause(self):
        """See BugTargetBase."""
        return (
            "BugTask.distribution = %d AND BugTask.sourcepackagename = %d" % (
            self.distribution.id, self.sourcepackagename.id))

    def searchTasks(self, search_params):
        """See IBugTarget."""
        search_params.setSourcePackage(self)
        return BugTaskSet().search(search_params)

    def getUsedBugTags(self):
        """See IBugTarget."""
        return self.distribution.getUsedBugTags()

    def getUsedBugTagsWithOpenCounts(self, user):
        """See IBugTarget."""
        return get_bug_tags_open_count(
            "BugTask.distribution = %s" % sqlvalues(self.distribution),
            user,
            count_subcontext_clause="BugTask.sourcepackagename = %s" % (
                sqlvalues(self.sourcepackagename)))

    def createBug(self, bug_params):
        """See IBugTarget."""
        bug_params.setBugTarget(
            distribution=self.distribution,
            sourcepackagename=self.sourcepackagename)
        return BugSet().createBug(bug_params)

    def _getBugTaskContextClause(self):
        """See BugTargetBase."""
        return (
            'BugTask.distribution = %s AND BugTask.sourcepackagename = %s' %
                sqlvalues(self.distribution, self.sourcepackagename))

    def getSubscriptions(self,
                         min_bug_notification_level=
                         BugNotificationLevel.NOTHING,
                         min_blueprint_notification_level=
                         BlueprintNotificationLevel.NOTHING):
        """See `IStructuralSubscriptionTarget`."""
        query = """
            StructuralSubscription.distribution=%s
            AND StructuralSubscription.sourcepackagename = %s
            AND StructuralSubscription.subscriber = Person.id
            """ % sqlvalues(self.distribution, self.sourcepackagename)
        all_subscriptions = StructuralSubscription.select(
            query,
            orderBy='Person.displayname',
            clauseTables=['Person'])
        # TODO : this can be done more efficiently by SQL
        subscriptions = [sub for sub
                         in all_subscriptions
                         if ((sub.bug_notification_level >=
                             min_bug_notification_level) and
                             (sub.blueprint_notification_level >=
                              min_blueprint_notification_level))]
        return subscriptions

    @property
    def bug_subscriptions(self):
        """See `IStructuralSubscriptionTarget`."""
        return self.getSubscriptions(
            min_bug_notification_level=BugNotificationLevel.METADATA)
