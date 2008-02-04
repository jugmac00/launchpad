# Copyright 2008 Canonical Ltd.  All rights reserved.

__metaclass__ = type
__all__ = ['StructuralSubscription',
           'StructuralSubscriptionTargetMixin']

from zope.interface import implements

from sqlobject import ForeignKey

from canonical.database.constants import UTC_NOW
from canonical.database.datetimecol import UtcDateTimeCol
from canonical.database.enumcol import EnumCol
from canonical.database.sqlbase import quote, SQLBase

from canonical.launchpad.interfaces import (
    BlueprintNotificationLevel, BugNotificationLevel, DeleteSubscriptionError,
    DuplicateSubscriptionError, IDistribution, IDistributionSourcePackage,
    IDistroSeries, IMilestone, IProduct, IProductSeries, IProject,
    IStructuralSubscription, IStructuralSubscriptionTarget)


class StructuralSubscription(SQLBase):
    """A subscription to a Launchpad structure."""

    implements(IStructuralSubscription)

    _table = 'StructuralSubscription'

    product = ForeignKey(
        dbName='product', foreignKey='Product', notNull=False, default=None)
    productseries = ForeignKey(
        dbName='productseries', foreignKey='ProductSeries', notNull=False,
        default=None)
    project = ForeignKey(
        dbName='project', foreignKey='Project', notNull=False, default=None)
    milestone = ForeignKey(
        dbName='milestone', foreignKey='Milestone', notNull=False,
        default=None)
    distribution = ForeignKey(
        dbName='distribution', foreignKey='Distribution', notNull=False,
        default=None)
    distroseries = ForeignKey(
        dbName='distroseries', foreignKey='DistroSeries', notNull=False,
        default=None)
    sourcepackagename = ForeignKey(
        dbName='sourcepackagename', foreignKey='SourcePackageName',
        notNull=False, default=None)
    subscriber = ForeignKey(
        dbName='subscriber', foreignKey='Person', notNull=True)
    subscribed_by = ForeignKey(
        dbName='subscribed_by', foreignKey='Person', notNull=True)
    bug_notification_level = EnumCol(
        enum=BugNotificationLevel,
        default=BugNotificationLevel.NOTHING,
        notNull=True)
    blueprint_notification_level = EnumCol(
        enum=BlueprintNotificationLevel,
        default=BlueprintNotificationLevel.NOTHING,
        notNull=True)
    date_created = UtcDateTimeCol(
        dbName='date_created', notNull=True, default=UTC_NOW)
    date_last_updated = UtcDateTimeCol(
        dbName='date_last_updated', notNull=True, default=UTC_NOW)

    @property
    def target(self):
        """See `IStructuralSubscription`."""
        if self.product is not None:
            return self.product
        elif self.productseries is not None:
            return self.productseries
        elif self.project is not None:
            return self.project
        elif self.milestone is not None:
            return self.milestone
        elif self.distribution is not None:
            if self.sourcepackagename is not None:
                # XXX intellectronica 2008-01-15:
                #   We're importing this pseudo db object
                #   here because importing it from the top
                #   doesn't play well with the loading
                #   sequence.
                from canonical.launchpad.database import (
                    DistributionSourcePackage)
                return DistributionSourcePackage(
                    self.distribution, self.sourcepackagename)
            else:
                return self.distribution
        elif self.distroseries is not None:
            return self.distroseries
        else:
            raise AssertionError, 'StructuralSubscription has no target.'


class StructuralSubscriptionTargetMixin:
    """Mixin class for implementing `IStructuralSubscriptionTarget`."""
    @property
    def _target_args(self):
        """Target Arguments.

        Return a dictionary with the arguments representing this
        target in a call to the structural subscription constructor.
        """
        args = {}
        if IDistributionSourcePackage.providedBy(self):
            args['distribution'] = self.distribution
            args['sourcepackagename'] = self.sourcepackagename
        elif IProduct.providedBy(self):
            args['product'] = self
        else:
            raise AssertionError(
                '%s is not a valid structural subscription target.')
        return args

    def addSubscription(self, subscriber, subscribed_by):
        """See `IStructuralSubscriptionTarget`."""
        subscription_already_exists = (
            self.getSubscription(subscriber) is not None)

        if subscription_already_exists:
            raise DuplicateSubscriptionError(
                "%s is already subscribed to %s." %
                (subscriber.name, self.displayname))
        else:
            return StructuralSubscription(
                subscriber=subscriber,
                subscribed_by=subscribed_by,
                **self._target_args)

    def addBugSubscription(self, subscriber, subscribed_by):
        """See `IStructuralSubscriptionTarget`."""
        # This is a helper method for creating a structural
        # subscription and immediately giving it a full
        # bug notification level. It is useful so long as
        # subscriptions are mainly used to implement bug contacts.
        sub = self.addSubscription(subscriber, subscribed_by)
        sub.bug_notification_level = BugNotificationLevel.COMMENTS
        return sub

    def removeBugSubscription(self, person):
        """See `IStructuralSubscriptionTarget`."""
        subscription_to_remove = None
        for subscription in self.getSubscriptions(
            min_bug_notification_level=BugNotificationLevel.METADATA):
            # Only search for bug subscriptions
            if subscription.subscriber == person:
                subscription_to_remove = subscription
                break

        if subscription_to_remove is None:
            raise DeleteSubscriptionError(
                "%s is not subscribed to %s." % (
                person.name, self.displayname))
        else:
            if (subscription_to_remove.blueprint_notification_level >
                BlueprintNotificationLevel.NOTHING):
                # This is a subscription to other application too
                # so only set the bug notification level
                subscription_to_remove.bug_notification_level = (
                    BugNotificationLevel.NOTHING)
            else:
                subscription_to_remove.destroySelf()

    def getSubscription(self, person):
        """See `IStructuralSubscriptionTarget`."""
        all_subscriptions = self.getSubscriptions()
        for subscription in all_subscriptions:
            if subscription.subscriber == person:
                return subscription
        return None

    def getSubscriptions(self,
                         min_bug_notification_level=
                         BugNotificationLevel.NOTHING,
                         min_blueprint_notification_level=
                         BlueprintNotificationLevel.NOTHING):
        """See `IStructuralSubscriptionTarget`."""
        target_clause = " AND ".join(
            "StructuralSubscription.%s = %s " % (key, quote(value))
            for key, value in self._target_args.items())
        query = target_clause + """
            AND StructuralSubscription.subscriber = Person.id
            """
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
