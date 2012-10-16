# Copyright 2009-2011 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""Milestone related test helper."""

__metaclass__ = type

from operator import attrgetter
from storm.exceptions import NoneError
import unittest

from zope.component import getUtility
from zope.security.checker import (
    CheckerPublic,
    getChecker,
    )
from zope.security.interfaces import Unauthorized

from lp.app.enums import InformationType
from lp.app.interfaces.services import IService
from lp.app.errors import NotFoundError
from lp.registry.enums import SharingPermission
from lp.registry.interfaces.distribution import IDistributionSet
from lp.registry.interfaces.milestone import (
    IHasMilestones,
    IMilestoneSet,
    )
from lp.registry.interfaces.product import IProductSet
from lp.testing import (
    ANONYMOUS,
    login,
    logout,
    person_logged_in,
    TestCaseWithFactory,
    )
from lp.testing.layers import (
    DatabaseFunctionalLayer,
    LaunchpadFunctionalLayer,
    )
from lp.testing.matchers import DoesNotSnapshot


class MilestoneTest(unittest.TestCase):
    """Milestone tests."""

    layer = LaunchpadFunctionalLayer

    def setUp(self):
        login(ANONYMOUS)

    def tearDown(self):
        logout()

    def testMilestoneSetIterator(self):
        """Test of MilestoneSet.__iter__()."""
        all_milestones_ids = set(
            milestone.id for milestone in getUtility(IMilestoneSet))
        self.assertEqual(all_milestones_ids,
                         set((1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)))

    def testMilestoneSetGet(self):
        """Test of MilestoneSet.get()"""
        milestone_set = getUtility(IMilestoneSet)
        self.assertEqual(milestone_set.get(1).id, 1)
        self.assertRaises(NotFoundError, milestone_set.get, 100000)

    def testMilestoneSetGetIDs(self):
        """Test of MilestoneSet.getByIds()"""
        milestone_set = getUtility(IMilestoneSet)
        milestones = milestone_set.getByIds([1, 3])
        ids = sorted(map(attrgetter('id'), milestones))
        self.assertEqual([1, 3], ids)

    def testMilestoneSetGetByIDs_ignores_missing(self):
        milestone_set = getUtility(IMilestoneSet)
        self.assertEqual([], list(milestone_set.getByIds([100000])))

    def testMilestoneSetGetByNameAndProduct(self):
        """Test of MilestoneSet.getByNameAndProduct()"""
        firefox = getUtility(IProductSet).getByName('firefox')
        milestone_set = getUtility(IMilestoneSet)
        milestone = milestone_set.getByNameAndProduct('1.0', firefox)
        self.assertEqual(milestone.name, '1.0')
        self.assertEqual(milestone.target, firefox)

        marker = object()
        milestone = milestone_set.getByNameAndProduct(
            'does not exist', firefox, default=marker)
        self.assertEqual(milestone, marker)

    def testMilestoneSetGetByNameAndDistribution(self):
        """Test of MilestoneSet.getByNameAndDistribution()"""
        debian = getUtility(IDistributionSet).getByName('debian')
        milestone_set = getUtility(IMilestoneSet)
        milestone = milestone_set.getByNameAndDistribution('3.1', debian)
        self.assertEqual(milestone.name, '3.1')
        self.assertEqual(milestone.target, debian)

        marker = object()
        milestone = milestone_set.getByNameAndDistribution(
            'does not exist', debian, default=marker)
        self.assertEqual(milestone, marker)

    def testMilestoneSetGetVisibleMilestones(self):
        all_visible_milestones_ids = [
            milestone.id
            for milestone in getUtility(IMilestoneSet).getVisibleMilestones()]
        self.assertEqual(
            all_visible_milestones_ids,
            [1, 2, 3])


class MilestoneSecurityAdaperTestCase(TestCaseWithFactory):
    """A TestCase for the security adapter of milestones."""

    layer = DatabaseFunctionalLayer

    def setUp(self):
        super(MilestoneSecurityAdaperTestCase, self).setUp()
        self.public_product = self.factory.makeProduct()
        self.public_milestone = self.factory.makeMilestone(
            product=self.public_product)
        self.proprietary_product_owner = self.factory.makePerson()
        self.proprietary_product = self.factory.makeProduct(
            owner=self.proprietary_product_owner,
            information_type=InformationType.PROPRIETARY)
        self.proprietary_milestone = self.factory.makeMilestone(
            product=self.proprietary_product)

    expected_get_permissions = {
        CheckerPublic: set((
            'id', 'checkAuthenticated', 'checkUnauthenticated',
            'userCanView',
            )),
        'launchpad.View': set((
            'active', 'bug_subscriptions', 'bugtasks', 'code_name',
            'dateexpected', 'displayname', 'distribution', 'distroseries',
            '_getOfficialTagClause', 'getBugSummaryContextWhereClause',
            'getBugTaskWeightFunction', 'getSubscription',
            'getSubscriptions', 'getTags', 'getTagsData',
            'getUsedBugTagsWithOpenCounts', 'name', 'official_bug_tags',
            'parent_subscription_target', 'product', 'product_release',
            'productseries', 'searchTasks', 'series_target',
            'specifications', 'summary', 'target', 'target_type_display',
            'title', 'userCanAlterBugSubscription',
            'userCanAlterSubscription', 'userHasBugSubscriptions',
            )),
        'launchpad.AnyAllowedPerson': set((
            'addBugSubscription', 'addBugSubscriptionFilter',
            'addSubscription', 'removeBugSubscription',
            )),
        'launchpad.Edit': set((
            'closeBugsAndBlueprints', 'createProductRelease',
            'destroySelf', 'setTags',
            )),
        }

    def test_get_permissions(self):
        milestone = self.factory.makeMilestone()
        checker = getChecker(milestone)
        self.checkPermissions(
            self.expected_get_permissions, checker.get_permissions, 'get')

    expected_set_permissions = {
        'launchpad.Edit': set((
            'active', 'code_name', 'dateexpected', 'distroseries', 'name',
            'product_release', 'productseries', 'summary',
            )),
        }

    def test_set_permissions(self):
        milestone = self.factory.makeMilestone()
        checker = getChecker(milestone)
        self.checkPermissions(
            self.expected_set_permissions, checker.set_permissions, 'set')

    def assertAccessAuthorzized(self, attribute_names, obj):
        # Try to access the given attributes of obj. No exception
        # should be raised.
        for name in attribute_names:
            # class Milestone does not implenet all attributes defined by
            # class IMilestone. AttributeErrors caused by attempts to
            # access these attribues are not relevant here: We simply
            # want to be sure that no Unauthorized error is raised.
            try:
                getattr(obj, name)
            except AttributeError:
                pass

    def assertAccessUnauthorzized(self, attribute_names, obj):
        # Try to access the given attributes of obj. Unauthorized
        # should be raised.
        for name in attribute_names:
            self.assertRaises(Unauthorized, getattr, obj, name)

    def assertChangeAuthorzized(self, attribute_names, obj):
        # Try to changes the given attributes of obj. Unauthorized
        # should be raised.
        for name in attribute_names:
            # Not all attributes declared in configure.zcml to be
            # settable actually exist. Attempts to set them raises
            # an AttributeError. Setting an Attribute to None may no
            # be allowed.
            #
            # Both errors can be ignored here: This method intends only
            # to prove that Unauthorized is not raised.
            try:
                setattr(obj, name, None)
            except (AttributeError, NoneError):
                pass

    def assertChangeUnauthorzized(self, attribute_names, obj):
        # Try to changes the given attributes of obj. Unauthorized
        # should be raised.
        for name in attribute_names:
            self.assertRaises(Unauthorized, setattr, obj, name, None)

    def test_access_for_anonymous(self):
        # Anonymous users have to public attributes of milestones for
        # private and public products.
        with person_logged_in(ANONYMOUS):
            self.assertAccessAuthorzized(
                self.expected_get_permissions[CheckerPublic],
                self.public_milestone)
            self.assertAccessAuthorzized(
                self.expected_get_permissions[CheckerPublic],
                self.proprietary_milestone)

            # They have access to attributes requiring the permission
            # launchpad.View of milestones for public products...
            self.assertAccessAuthorzized(
                self.expected_get_permissions['launchpad.View'],
                self.public_milestone)

            # ...but not to the same attributes of milestones for private
            # products.
            self.assertAccessUnauthorzized(
                self.expected_get_permissions['launchpad.View'],
                self.proprietary_milestone)

            # They cannot access other attributes.
            for permission, names in self.expected_get_permissions.items():
                if permission in (CheckerPublic, 'launchpad.View'):
                    continue
                self.assertAccessUnauthorzized(names, self.public_milestone)
                self.assertAccessUnauthorzized(
                    names, self.proprietary_milestone)

            # They cannot change any attributes.
            for permission, names in self.expected_set_permissions.items():
                self.assertChangeUnauthorzized(names, self.public_milestone)
                self.assertChangeUnauthorzized(
                    names, self.proprietary_milestone)

    def test_access_for_ordinary_user(self):
        # Regular users have to public attributes of milestones for
        # private and public products.
        user = self.factory.makePerson()
        with person_logged_in(user):
            self.assertAccessAuthorzized(
                self.expected_get_permissions[CheckerPublic],
                self.public_milestone)
            self.assertAccessAuthorzized(
                self.expected_get_permissions[CheckerPublic],
                self.proprietary_milestone)

            # They have access to attributes requiring the permission
            # launchpad.View or launchpad.AnyAllowedPerson of milestones
            # for public products...
            self.assertAccessAuthorzized(
                self.expected_get_permissions['launchpad.View'],
                self.public_milestone)
            self.assertAccessAuthorzized(
                self.expected_get_permissions['launchpad.AnyAllowedPerson'],
                self.public_milestone)

            # ...but not to the same attributes of milestones for private
            # products.
            self.assertAccessUnauthorzized(
                self.expected_get_permissions['launchpad.View'],
                self.proprietary_milestone)
            self.assertAccessUnauthorzized(
                self.expected_get_permissions['launchpad.AnyAllowedPerson'],
                self.proprietary_milestone)

            # They cannot access other attributes.
            for permission, names in self.expected_get_permissions.items():
                if permission in (
                    CheckerPublic, 'launchpad.View',
                    'launchpad.AnyAllowedPerson'):
                    continue
                self.assertAccessUnauthorzized(names, self.public_milestone)
                self.assertAccessUnauthorzized(
                    names, self.proprietary_milestone)

            # They cannot change attributes.
            for permission, names in self.expected_set_permissions.items():
                self.assertChangeUnauthorzized(names, self.public_milestone)
                self.assertChangeUnauthorzized(
                    names, self.proprietary_milestone)

    def test_access_for_user_with_grant_for_private_product(self):
        # Users with a policy grant for a private product have access
        # to most attributes of the private product.
        user = self.factory.makePerson()
        with person_logged_in(self.proprietary_product_owner):
            getUtility(IService, 'sharing').sharePillarInformation(
                self.proprietary_product, user, self.proprietary_product_owner,
                {InformationType.PROPRIETARY: SharingPermission.ALL})

        with person_logged_in(user):
            self.assertAccessAuthorzized(
                self.expected_get_permissions[CheckerPublic],
                self.proprietary_milestone)

            # They have access to attributes requiring the permission
            # launchpad.View or launchpad.AnyAllowedPerson of milestones
            # for the private product.
            self.assertAccessAuthorzized(
                self.expected_get_permissions['launchpad.View'],
                self.proprietary_milestone)
            self.assertAccessAuthorzized(
                self.expected_get_permissions['launchpad.AnyAllowedPerson'],
                self.proprietary_milestone)

            # They cannot access other attributes.
            for permission, names in self.expected_get_permissions.items():
                if permission in (
                    CheckerPublic, 'launchpad.View',
                    'launchpad.AnyAllowedPerson'):
                    continue
                self.assertAccessUnauthorzized(
                    names, self.proprietary_milestone)

            # They cannot change attributes.
            for names in self.expected_set_permissions.values():
                self.assertChangeUnauthorzized(
                    names, self.proprietary_milestone)

    def test_access_for_product_owner(self):
        # The owner of a private product can access all attributes.
        with person_logged_in(self.proprietary_product_owner):
            for names in self.expected_get_permissions.values():
                self.assertAccessAuthorzized(names, self.proprietary_milestone)

            # They can change attributes.
            for permission, names in self.expected_set_permissions.items():
                self.assertChangeAuthorzized(names, self.proprietary_milestone)


class HasMilestonesSnapshotTestCase(TestCaseWithFactory):
    """A TestCase for snapshots of pillars with milestones."""

    layer = DatabaseFunctionalLayer

    def check_skipped(self, target):
        """Asserts that fields marked doNotSnapshot are skipped."""
        skipped = [
            'milestones',
            'all_milestones',
            ]
        self.assertThat(target, DoesNotSnapshot(skipped, IHasMilestones))

    def test_product(self):
        product = self.factory.makeProduct()
        self.check_skipped(product)

    def test_distribution(self):
        distribution = self.factory.makeDistribution()
        self.check_skipped(distribution)

    def test_distroseries(self):
        distroseries = self.factory.makeDistroSeries()
        self.check_skipped(distroseries)

    def test_projectgroup(self):
        projectgroup = self.factory.makeProject()
        self.check_skipped(projectgroup)


class MilestoneBugTaskSpecificationTest(TestCaseWithFactory):
    """Test cases for retrieving bugtasks and specifications for a milestone.
    """

    layer = DatabaseFunctionalLayer

    def setUp(self):
        super(MilestoneBugTaskSpecificationTest, self).setUp()
        self.owner = self.factory.makePerson()
        self.product = self.factory.makeProduct(name="product1")
        self.milestone = self.factory.makeMilestone(product=self.product)

    def _make_bug(self, **kwargs):
        milestone = kwargs.pop('milestone', None)
        bugtask = self.factory.makeBugTask(**kwargs)
        bugtask.milestone = milestone
        return bugtask

    def _create_items(self, num, factory, **kwargs):
        items = []
        with person_logged_in(self.owner):
            for n in xrange(num):
                items.append(factory(**kwargs))
        return items

    def test_bugtask_retrieval(self):
        # Ensure that all bugtasks on a milestone can be retrieved.
        bugtasks = self._create_items(
            5, self._make_bug,
            milestone=self.milestone,
            owner=self.owner,
            target=self.product,
            )
        self.assertContentEqual(bugtasks, self.milestone.bugtasks(self.owner))

    def test_specification_retrieval(self):
        # Ensure that all specifications on a milestone can be retrieved.
        specifications = self._create_items(
            5, self.factory.makeSpecification,
            milestone=self.milestone,
            owner=self.owner,
            product=self.product,
            )
        self.assertContentEqual(specifications, self.milestone.specifications)


class MilestonesContainsPartialSpecifications(TestCaseWithFactory):
    """Milestones list specifications with some workitems targeted to it."""

    layer = DatabaseFunctionalLayer

    def _create_milestones_on_target(self, **kwargs):
        """Create a milestone on a target with work targeted to it.

        Target should be specified using either product or distribution
        argument which is directly passed into makeMilestone call.
        """
        other_milestone = self.factory.makeMilestone(**kwargs)
        target_milestone = self.factory.makeMilestone(**kwargs)
        specification = self.factory.makeSpecification(
            milestone=other_milestone, **kwargs)
        # Create two workitems to ensure this doesn't cause
        # two specifications to be returned.
        self.factory.makeSpecificationWorkItem(
            specification=specification, milestone=target_milestone)
        self.factory.makeSpecificationWorkItem(
            specification=specification, milestone=target_milestone)
        return specification, target_milestone

    def test_milestones_on_product(self):
        spec, target_milestone = self._create_milestones_on_target(
            product=self.factory.makeProduct())
        self.assertContentEqual([spec], target_milestone.specifications)

    def test_milestones_on_distribution(self):
        spec, target_milestone = self._create_milestones_on_target(
            distribution=self.factory.makeDistribution())
        self.assertContentEqual([spec], target_milestone.specifications)

    def test_milestones_on_project(self):
        # A Project (Project Group) milestone contains all specifications
        # targetted to contained Products (Projects) for milestones of
        # a certain name.
        projectgroup = self.factory.makeProject()
        product = self.factory.makeProduct(project=projectgroup)
        spec, target_milestone = self._create_milestones_on_target(
            product=product)
        milestone = projectgroup.getMilestone(name=target_milestone.name)
        self.assertContentEqual([spec], milestone.specifications)

    def test_milestones_with_deleted_workitems(self):
        # Deleted work items do not cause the specification to show up
        # in the milestone page.
        milestone = self.factory.makeMilestone(
            product=self.factory.makeProduct())
        specification = self.factory.makeSpecification(
            product=milestone.product)
        self.factory.makeSpecificationWorkItem(
            specification=specification, milestone=milestone, deleted=True)
        self.assertContentEqual([], milestone.specifications)
