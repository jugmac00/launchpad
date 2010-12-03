# Copyright 2010 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""Test `BugSubscriptionInfo`."""

__metaclass__ = type

from storm.store import Store
from testtools.matchers import Equals

from canonical.testing.layers import DatabaseFunctionalLayer
from lp.bugs.model.bug import (
    BugSubscriptionInfo,
    BugSubscriptionSet,
    StructuralSubscriptionSet,
    SubscriberSet,
    )
from lp.registry.enum import BugNotificationLevel
from lp.testing import (
    person_logged_in,
    StormStatementRecorder,
    TestCaseWithFactory,
    )
from lp.testing.matchers import HasQueryCount


class TestSubscriptionRelatedSets(TestCaseWithFactory):
    """Tests for *Set classes related to subscriptions."""

    layer = DatabaseFunctionalLayer

    name_pairs = ("A", "xa"), ("C", "xd"), ("B", "xb"), ("C", "xc")
    name_pairs_sorted = ("A", "xa"), ("B", "xb"), ("C", "xc"), ("C", "xd")

    def setUp(self):
        super(TestSubscriptionRelatedSets, self).setUp()
        make_person = lambda (displayname, name): (
            self.factory.makePerson(displayname=displayname, name=name))
        subscribers = dict(
            (name_pair, make_person(name_pair))
            for name_pair in self.name_pairs)
        self.subscribers_set = frozenset(subscribers.itervalues())
        self.subscribers_sorted = tuple(
            subscribers[name_pair] for name_pair in self.name_pairs_sorted)

    def test_SubscriberSet(self):
        subscriber_set = SubscriberSet(self.subscribers_set)
        self.assertIsInstance(subscriber_set, frozenset)
        self.assertEqual(self.subscribers_set, subscriber_set)
        self.assertEqual(self.subscribers_sorted, subscriber_set.sorted)

    def test_BugSubscriptionSet(self):
        bug = self.factory.makeBug()
        with person_logged_in(bug.owner):
            subscriptions = frozenset(
                bug.subscribe(subscriber, subscriber)
                for subscriber in self.subscribers_set)
        subscription_set = BugSubscriptionSet(subscriptions)
        self.assertIsInstance(subscription_set, frozenset)
        self.assertEqual(subscriptions, subscription_set)
        # BugSubscriptionSet.sorted returns a tuple of subscriptions ordered
        # by subscribers.
        self.assertEqual(
            self.subscribers_sorted, tuple(
                subscription.person
                for subscription in subscription_set.sorted))
        # BugSubscriptionSet.subscribers returns a SubscriberSet of the
        # subscription's subscribers.
        self.assertIsInstance(subscription_set.subscribers, SubscriberSet)
        self.assertEqual(self.subscribers_set, subscription_set.subscribers)

    def test_StructuralSubscriptionSet(self):
        product = self.factory.makeProduct()
        with person_logged_in(product.owner):
            subscriptions = frozenset(
                product.addSubscription(subscriber, subscriber)
                for subscriber in self.subscribers_set)
        subscription_set = StructuralSubscriptionSet(subscriptions)
        self.assertIsInstance(subscription_set, frozenset)
        self.assertEqual(subscriptions, subscription_set)
        # StructuralSubscriptionSet.sorted returns a tuple of subscriptions
        # ordered by subscribers.
        self.assertEqual(
            self.subscribers_sorted, tuple(
                subscription.subscriber
                for subscription in subscription_set.sorted))
        # StructuralSubscriptionSet.subscribers returns a SubscriberSet of the
        # subscription's subscribers.
        self.assertIsInstance(subscription_set.subscribers, SubscriberSet)
        self.assertEqual(self.subscribers_set, subscription_set.subscribers)


class TestBugSubscriptionInfo(TestCaseWithFactory):

    layer = DatabaseFunctionalLayer

    def setUp(self):
        super(TestBugSubscriptionInfo, self).setUp()
        self.target = self.factory.makeProduct()
        self.bug = self.factory.makeBug(product=self.target)
        # Unsubscribe the bug filer to make the tests more readable.
        with person_logged_in(self.bug.owner):
            self.bug.unsubscribe(self.bug.owner, self.bug.owner)

    def getInfo(self):
        return BugSubscriptionInfo(
            self.bug, BugNotificationLevel.NOTHING)

    def test_direct(self):
        # The set of direct subscribers.
        subscribers = (
            self.factory.makePerson(),
            self.factory.makePerson())
        with person_logged_in(self.bug.owner):
            subscriptions = tuple(
                self.bug.subscribe(subscriber, subscriber)
                for subscriber in subscribers)
        found_subscriptions = self.getInfo().direct_subscriptions
        self.assertEqual(set(subscriptions), found_subscriptions)
        self.assertEqual(subscriptions, found_subscriptions.sorted)
        self.assertEqual(set(subscribers), found_subscriptions.subscribers)
        self.assertEqual(subscribers, found_subscriptions.subscribers.sorted)

    def test_duplicate(self):
        # The set of subscribers from duplicate bugs.
        found_subscriptions = self.getInfo().duplicate_subscriptions
        self.assertEqual(set(), found_subscriptions)
        self.assertEqual((), found_subscriptions.sorted)
        self.assertEqual(set(), found_subscriptions.subscribers)
        self.assertEqual((), found_subscriptions.subscribers.sorted)
        duplicate_bug = self.factory.makeBug(product=self.target)
        with person_logged_in(duplicate_bug.owner):
            duplicate_bug.markAsDuplicate(self.bug)
            duplicate_bug_subscription = (
                duplicate_bug.getSubscriptionForPerson(
                    duplicate_bug.owner))
        found_subscriptions = self.getInfo().duplicate_subscriptions
        self.assertEqual(
            set([duplicate_bug_subscription]),
            found_subscriptions)
        self.assertEqual(
            (duplicate_bug_subscription,),
            found_subscriptions.sorted)
        self.assertEqual(
            set([duplicate_bug.owner]),
            found_subscriptions.subscribers)
        self.assertEqual(
            (duplicate_bug.owner,),
            found_subscriptions.subscribers.sorted)

    def test_duplicate_for_private_bug(self):
        # The set of subscribers from duplicate bugs is always empty when the
        # master bug is private.
        duplicate_bug = self.factory.makeBug(product=self.target)
        with person_logged_in(duplicate_bug.owner):
            duplicate_bug.markAsDuplicate(self.bug)
        with person_logged_in(self.bug.owner):
            self.bug.setPrivate(True, self.bug.owner)
        found_subscriptions = self.getInfo().duplicate_subscriptions
        self.assertEqual(set(), found_subscriptions)
        self.assertEqual((), found_subscriptions.sorted)
        self.assertEqual(set(), found_subscriptions.subscribers)
        self.assertEqual((), found_subscriptions.subscribers.sorted)

    def test_structural(self):
        # The set of structural subscribers.
        subscribers = (
            self.factory.makePerson(),
            self.factory.makePerson())
        with person_logged_in(self.bug.owner):
            subscriptions = tuple(
                self.target.addBugSubscription(subscriber, subscriber)
                for subscriber in subscribers)
        found_subscriptions = self.getInfo().structural_subscriptions
        self.assertEqual(set(subscriptions), found_subscriptions)
        self.assertEqual(subscriptions, found_subscriptions.sorted)
        self.assertEqual(set(subscribers), found_subscriptions.subscribers)
        self.assertEqual(subscribers, found_subscriptions.subscribers.sorted)

    def test_all_assignees(self):
        # The set of bugtask assignees for bugtasks that have been assigned.
        found_assignees = self.getInfo().all_assignees
        self.assertEqual(set(), found_assignees)
        self.assertEqual((), found_assignees.sorted)
        with person_logged_in(self.bug.owner):
            self.bug.default_bugtask.transitionToAssignee(self.bug.owner)
        found_assignees = self.getInfo().all_assignees
        self.assertEqual(set([self.bug.owner]), found_assignees)
        self.assertEqual((self.bug.owner,), found_assignees.sorted)
        bugtask = self.factory.makeBugTask(bug=self.bug)
        with person_logged_in(bugtask.owner):
            bugtask.transitionToAssignee(bugtask.owner)
        found_assignees = self.getInfo().all_assignees
        self.assertEqual(
            set([self.bug.owner, bugtask.owner]),
            found_assignees)
        self.assertEqual(
            (self.bug.owner, bugtask.owner),
            found_assignees.sorted)

    def test_all_bug_supervisors(self):
        # The set of bug supervisors for the bug's task's target, where
        # supervisors have been configured.
        found_supervisors = self.getInfo().all_bug_supervisors
        self.assertEqual(set(), found_supervisors)
        self.assertEqual((), found_supervisors.sorted)
        # Set the supervisor for the first bugtask's target.
        [bugtask] = self.bug.bugtasks
        with person_logged_in(bugtask.target.owner):
            bugtask.target.setBugSupervisor(
                bugtask.owner, bugtask.owner)
        found_supervisors = self.getInfo().all_bug_supervisors
        self.assertEqual(set([bugtask.owner]), found_supervisors)
        self.assertEqual((bugtask.owner,), found_supervisors.sorted)
        # Add another bugtask and set its target's supervisor too.
        bugtask2 = self.factory.makeBugTask(bug=self.bug)
        with person_logged_in(bugtask2.target.owner):
            bugtask2.target.setBugSupervisor(
                bugtask2.owner, bugtask2.owner)
        found_supervisors = self.getInfo().all_bug_supervisors
        self.assertEqual(
            set([bugtask.owner, bugtask2.owner]),
            found_supervisors)
        self.assertEqual(
            (bugtask.owner, bugtask2.owner),
            found_supervisors.sorted)

    def test_also_notified_subscribers(self):
        # The set of also notified subscribers.
        found_subscribers = self.getInfo().also_notified_subscribers
        self.assertEqual(set(), found_subscribers)
        self.assertEqual((), found_subscribers.sorted)
        # Add an assignee, a bug supervisor and a structural subscriber.
        bugtask = self.bug.default_bugtask
        assignee = self.factory.makePerson()
        with person_logged_in(self.bug.owner):
            bugtask.transitionToAssignee(assignee)
        supervisor = self.factory.makePerson()
        with person_logged_in(bugtask.target.owner):
            bugtask.target.setBugSupervisor(supervisor, supervisor)
        structural_subscriber = self.factory.makePerson()
        with person_logged_in(structural_subscriber):
            bugtask.target.addSubscription(
                structural_subscriber, structural_subscriber)
        # Add a direct subscription.
        direct_subscriber = self.factory.makePerson()
        with person_logged_in(self.bug.owner):
            self.bug.subscribe(direct_subscriber, direct_subscriber)
        # The direct subscriber does not appear in the also notified set, but
        # the assignee, supervisor and structural subscriber do.
        found_subscribers = self.getInfo().also_notified_subscribers
        self.assertEqual(
            set([assignee, supervisor, structural_subscriber]),
            found_subscribers)
        self.assertEqual(
            (assignee, supervisor, structural_subscriber),
            found_subscribers.sorted)

    def test_also_notified_subscribers_for_private_bug(self):
        # The set of also notified subscribers is always empty when the master
        # bug is private.
        assignee = self.factory.makePerson()
        with person_logged_in(self.bug.owner):
            self.bug.default_bugtask.transitionToAssignee(assignee)
        with person_logged_in(self.bug.owner):
            self.bug.setPrivate(True, self.bug.owner)
        found_subscribers = self.getInfo().also_notified_subscribers
        self.assertEqual(set(), found_subscribers)
        self.assertEqual((), found_subscribers.sorted)

    def test_indirect_subscribers(self):
        # The set of indirect subscribers is the union of also notified
        # subscribers and subscribers to duplicates.
        assignee = self.factory.makePerson()
        with person_logged_in(self.bug.owner):
            self.bug.default_bugtask.transitionToAssignee(assignee)
        duplicate_bug = self.factory.makeBug(product=self.target)
        with person_logged_in(duplicate_bug.owner):
            duplicate_bug.markAsDuplicate(self.bug)
        found_subscribers = self.getInfo().indirect_subscribers
        self.assertEqual(
            set([assignee, duplicate_bug.owner]),
            found_subscribers)
        self.assertEqual(
            (assignee, duplicate_bug.owner),
            found_subscribers.sorted)


class TestBugSubscriptionInfoQueries:#(TestCaseWithFactory):

    layer = DatabaseFunctionalLayer

    def setUp(self):
        super(TestBugSubscriptionInfoQueries, self).setUp()
        self.target = self.factory.makeProduct()
        self.bug = self.factory.makeBug(product=self.target)
        self.info = BugSubscriptionInfo(
            self.bug, BugNotificationLevel.NOTHING)
        # Get the Storm cache into a known state.
        Store.of(self.bug).invalidate()
        Store.of(self.bug).reload(self.bug)
        self.bug.bugtasks
        self.bug.tags

    def test_direct_subscribers(self):
        # Looking up subscribers takes two queries: one to obtain
        # subscriptions and another to load the Person records.
        with StormStatementRecorder() as recorder:
            self.info.direct_subscribers
        self.assertThat(recorder, HasQueryCount(Equals(2)))

    def test_direct_subscriptions(self):
        # Looking up subscriptions takes a single query.
        with StormStatementRecorder() as recorder:
            self.info.direct_subscriptions
        self.assertThat(recorder, HasQueryCount(Equals(1)))

    def test_duplicate_subscribers(self):
        # Looking up duplicate subscribers takes two queries: one to obtain
        # subscriptions and another to load the Person records.
        with StormStatementRecorder() as recorder:
            self.info.duplicate_subscribers
        self.assertThat(recorder, HasQueryCount(Equals(2)))

    def test_duplicate_subscriptions(self):
        # Looking up duplicate subscriptions takes a single query.
        with StormStatementRecorder() as recorder:
            self.info.duplicate_subscriptions
        self.assertThat(recorder, HasQueryCount(Equals(1)))

    def test_duplicate_subscribers_for_private_bug(self):
        # Looking up duplicate subscribers for a private bug takes a single
        # query; obtaining subscriptions is short-circuited.
        duplicate_bug = self.factory.makeBug(product=self.target)
        with person_logged_in(duplicate_bug.owner):
            duplicate_bug.markAsDuplicate(self.bug)
        with person_logged_in(self.bug.owner):
            self.bug.setPrivate(True, self.bug.owner)
        with StormStatementRecorder() as recorder:
            self.info.duplicate_subscribers
        self.assertThat(recorder, HasQueryCount(Equals(1)))

    def test_duplicate_subscriptions_for_private_bug(self):
        # Looking up duplicate subscriptions for a private bug is
        # short-circuited.
        duplicate_bug = self.factory.makeBug(product=self.target)
        with person_logged_in(duplicate_bug.owner):
            duplicate_bug.markAsDuplicate(self.bug)
        with person_logged_in(self.bug.owner):
            self.bug.setPrivate(True, self.bug.owner)
        with StormStatementRecorder() as recorder:
            self.info.duplicate_subscriptions
        self.assertThat(recorder, HasQueryCount(Equals(0)))

    def test_structural_subscribers(self):
        # Looking up structural subscribers takes three queries: one to obtain
        # subscriptions and another to load the Person records.
        with StormStatementRecorder() as recorder:
            self.info.structural_subscribers
        self.assertThat(recorder, HasQueryCount(Equals(2)))

    def test_structural_subscriptions(self):
        # Looking up structural subscriptions takes a single query.
        with StormStatementRecorder() as recorder:
            self.info.structural_subscriptions
        self.assertThat(recorder, HasQueryCount(Equals(1)))

    def test_all_assignees(self):
        # Getting all assignees takes a single query.
        with StormStatementRecorder() as recorder:
            self.info.all_assignees
        self.assertThat(recorder, HasQueryCount(Equals(1)))

    def test_all_bug_supervisors(self):
        # Getting all bug supervisors can take several queries; bugtask
        # pillars need to be loaded, then supervisors need to be
        # loaded. However, there are typically few tasks so the trade for
        # simplicity of implementation is acceptable. Only the simplest case
        # is tested here: no queries are needed when there's a single bugtask
        # and its target does not have a bug supervisor (presumably because
        # the pillar is already cached).
        with StormStatementRecorder() as recorder:
            self.info.all_bug_supervisors
        self.assertThat(recorder, HasQueryCount(Equals(0)))

    def test_also_notified_subscribers(self):
        # Looking up also notified subscribers requires 5 queries.
        with StormStatementRecorder() as recorder:
            self.info.also_notified_subscribers
        self.assertThat(recorder, HasQueryCount(Equals(5)))

    def test_indirect_subscribers(self):
        # Looking up indirect subscribers requires 7 queries.
        with StormStatementRecorder() as recorder:
            self.info.indirect_subscribers
        self.assertThat(recorder, HasQueryCount(Equals(7)))
