# Copyright 2009-2010 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

__metaclass__ = type

import transaction
from storm.expr import LeftJoin
from storm.store import Store
from testtools.matchers import Equals
from zope.component import getUtility

from canonical.config import config
from canonical.launchpad.ftests import (
    ANONYMOUS,
    login,
    )
from canonical.launchpad.interfaces.authtoken import LoginTokenType
from canonical.launchpad.interfaces.account import AccountStatus
from canonical.launchpad.interfaces.logintoken import ILoginTokenSet
from canonical.launchpad.interfaces.launchpad import ILaunchpadCelebrities
from canonical.launchpad.webapp.interfaces import ILaunchBag
from canonical.launchpad.webapp.servers import LaunchpadTestRequest
from canonical.testing.layers import (
    DatabaseFunctionalLayer,
    LaunchpadFunctionalLayer,
    LaunchpadZopelessLayer,
    )

from lp.app.errors import NotFoundError
from lp.bugs.model.bugtask import BugTask
from lp.buildmaster.enums import BuildStatus
from lp.registry.browser.person import (
    PersonEditView,
    PersonView,
    TeamInvitationView)


from lp.registry.interfaces.karma import IKarmaCacheManager
from lp.registry.interfaces.person import (
    PersonVisibility,
    IPersonSet,
    )
from lp.registry.interfaces.teammembership import (
    ITeamMembershipSet,
    TeamMembershipStatus,
    )

from lp.registry.model.karma import KarmaCategory
from lp.registry.model.milestone import milestone_sort_key
from lp.soyuz.enums import (
    ArchiveStatus,
    PackagePublishingStatus,
    )
from lp.registry.model.person import Person
from lp.soyuz.tests.test_publishing import SoyuzTestPublisher
from lp.testing import (
    login_person,
    person_logged_in,
    StormStatementRecorder,
    TestCaseWithFactory,
    )
from lp.testing.matchers import HasQueryCount
from lp.testing.views import (
    create_initialized_view,
    create_view,
    )


class TestPersonViewKarma(TestCaseWithFactory):

    layer = LaunchpadZopelessLayer

    def setUp(self):
        TestCaseWithFactory.setUp(self)
        person = self.factory.makePerson()
        product = self.factory.makeProduct()
        transaction.commit()
        self.view = PersonView(
            person, LaunchpadTestRequest())
        self._makeKarmaCache(
            person, product, KarmaCategory.byName('bugs'))
        self._makeKarmaCache(
            person, product, KarmaCategory.byName('answers'))
        self._makeKarmaCache(
            person, product, KarmaCategory.byName('code'))

    def test_karma_category_sort(self):
        categories = self.view.contributed_categories
        category_names = []
        for category in categories:
            category_names.append(category.name)

        self.assertEqual(category_names, [u'code', u'bugs', u'answers'],
                         'Categories are not sorted correctly')

    def _makeKarmaCache(self, person, product, category, value=10):
        """ Create and return a KarmaCache entry with the given arguments.

        In order to create the KarmaCache record we must switch to the DB
        user 'karma', so tests that need a different user after calling
        this method should do run switchDbUser() themselves.
        """

        LaunchpadZopelessLayer.switchDbUser('karma')

        cache_manager = getUtility(IKarmaCacheManager)
        karmacache = cache_manager.new(
            value, person.id, category.id, product_id=product.id)

        try:
            cache_manager.updateKarmaValue(
                value, person.id, category_id=None, product_id=product.id)
        except NotFoundError:
            cache_manager.new(
                value, person.id, category_id=None, product_id=product.id)

        # We must commit here so that the change is seen in other transactions
        # (e.g. when the callsite issues a switchDbUser() after we return).
        transaction.commit()
        return karmacache


class TestShouldShowPpaSection(TestCaseWithFactory):

    layer = LaunchpadFunctionalLayer

    def setUp(self):
        TestCaseWithFactory.setUp(self)
        self.owner = self.factory.makePerson(name='mowgli')
        self.person_ppa = self.factory.makeArchive(owner=self.owner)
        self.team = self.factory.makeTeam(name='jbook', owner=self.owner)

        # The team is the owner of the PPA.
        self.team_ppa = self.factory.makeArchive(owner=self.team)
        self.team_view = PersonView(self.team, LaunchpadTestRequest())

    def make_ppa_private(self, ppa):
        """Helper method to privatise a ppa."""
        login('foo.bar@canonical.com')
        ppa.private = True
        ppa.buildd_secret = "secret"
        login(ANONYMOUS)

    def test_viewing_person_with_public_ppa(self):
        # Show PPA section only if context has at least one PPA the user is
        # authorised to view the PPA.
        login(ANONYMOUS)
        person_view = PersonView(self.owner, LaunchpadTestRequest())
        self.failUnless(person_view.should_show_ppa_section)

    def test_viewing_person_without_ppa(self):
        # If the context person does not have a ppa then the section
        # should not display.
        login(ANONYMOUS)
        person_without_ppa = self.factory.makePerson()
        person_view = PersonView(person_without_ppa, LaunchpadTestRequest())
        self.failIf(person_view.should_show_ppa_section)

    def test_viewing_self(self):
        # If the current user has edit access to the context person then
        # the section should always display.
        login_person(self.owner)
        person_view = PersonView(self.owner, LaunchpadTestRequest())
        self.failUnless(person_view.should_show_ppa_section)

        # If the ppa is private, the section is still displayed to
        # a user with edit access to the person.
        self.make_ppa_private(self.person_ppa)
        login_person(self.owner)
        person_view = PersonView(self.owner, LaunchpadTestRequest())
        self.failUnless(person_view.should_show_ppa_section)

        # Even a person without a PPA will see the section when viewing
        # themselves.
        person_without_ppa = self.factory.makePerson()
        login_person(person_without_ppa)
        person_view = PersonView(person_without_ppa, LaunchpadTestRequest())
        self.failUnless(person_view.should_show_ppa_section)

    def test_anon_viewing_person_with_private_ppa(self):
        # If the ppa is private, the ppa section will not be displayed
        # to users without view access to the ppa.
        self.make_ppa_private(self.person_ppa)
        login(ANONYMOUS)
        person_view = PersonView(self.owner, LaunchpadTestRequest())
        self.failIf(person_view.should_show_ppa_section)

        # But if the context person has a second ppa that is public,
        # then anon users will see the section.
        second_ppa = self.factory.makeArchive(owner=self.owner)
        person_view = PersonView(self.owner, LaunchpadTestRequest())
        self.failUnless(person_view.should_show_ppa_section)

    def test_viewing_team_with_private_ppa(self):
        # If a team PPA is private, the ppa section will be displayed
        # to team members.
        self.make_ppa_private(self.team_ppa)
        member = self.factory.makePerson()
        login_person(self.owner)
        self.team.addMember(member, self.owner)
        login_person(member)

        # So the member will see the section.
        person_view = PersonView(self.team, LaunchpadTestRequest())
        self.failUnless(person_view.should_show_ppa_section)

        # But other users who are not members will not.
        non_member = self.factory.makePerson()
        login_person(non_member)
        person_view = PersonView(self.team, LaunchpadTestRequest())
        self.failIf(person_view.should_show_ppa_section)

        # Unless the team also has another ppa which is public.
        second_ppa = self.factory.makeArchive(owner=self.team)
        person_view = PersonView(self.team, LaunchpadTestRequest())
        self.failUnless(person_view.should_show_ppa_section)


class TestPersonEditView(TestCaseWithFactory):

    layer = LaunchpadFunctionalLayer

    def setUp(self):
        TestCaseWithFactory.setUp(self)
        self.valid_email_address = self.factory.getUniqueEmailAddress()
        self.person = self.factory.makePerson(email=self.valid_email_address)
        login_person(self.person)
        self.ppa = self.factory.makeArchive(owner=self.person)
        self.view = PersonEditView(
            self.person, LaunchpadTestRequest())

    def test_can_rename_with_empty_PPA(self):
        # If a PPA exists but has no packages, we can rename the
        # person.
        self.view.initialize()
        self.assertFalse(self.view.form_fields['name'].for_display)

    def _publishPPAPackage(self):
        stp = SoyuzTestPublisher()
        stp.setUpDefaultDistroSeries()
        stp.getPubSource(archive=self.ppa)

    def test_cannot_rename_with_non_empty_PPA(self):
        # Publish some packages in the PPA and test that we can't rename
        # the person.
        self._publishPPAPackage()
        self.view.initialize()
        self.assertTrue(self.view.form_fields['name'].for_display)
        self.assertEqual(
            self.view.widgets['name'].hint,
            "This user has an active PPA with packages published and "
            "may not be renamed.")

    def test_cannot_rename_with_deleting_PPA(self):
        # When a PPA is in the DELETING state we should not allow
        # renaming just yet.
        self._publishPPAPackage()
        self.view.initialize()
        self.ppa.delete(self.person)
        self.assertEqual(self.ppa.status, ArchiveStatus.DELETING)
        self.assertTrue(self.view.form_fields['name'].for_display)

    def test_can_rename_with_deleted_PPA(self):
        # Delete a PPA and test that the person can be renamed.
        self._publishPPAPackage()
        # Deleting the PPA will remove the publications, which is
        # necessary for the renaming check.
        self.ppa.delete(self.person)
        # Simulate the external script running and finalising the
        # DELETED status.
        self.ppa.status = ArchiveStatus.DELETED
        self.view.initialize()
        self.assertFalse(self.view.form_fields['name'].for_display)

    def test_add_email_good_data(self):
        email_address = self.factory.getUniqueEmailAddress()
        form = {
            'field.VALIDATED_SELECTED': self.valid_email_address,
            'field.VALIDATED_SELECTED-empty-marker': 1,
            'field.actions.add_email': 'Add',
            'field.newemail': email_address,
            }
        view = create_initialized_view(self.person, "+editemails", form=form)

        # If everything worked, there should now be a login token to validate
        # this email address for this user.
        token = getUtility(ILoginTokenSet).searchByEmailRequesterAndType(
            email_address,
            self.person,
            LoginTokenType.VALIDATEEMAIL)
        self.assertTrue(token is not None)

    def test_add_email_address_taken(self):
        email_address = self.factory.getUniqueEmailAddress()
        account = self.factory.makeAccount(
            displayname='deadaccount',
            email=email_address,
            status=AccountStatus.NOACCOUNT)
        form = {
            'field.VALIDATED_SELECTED': self.valid_email_address,
            'field.VALIDATED_SELECTED-empty-marker': 1,
            'field.actions.add_email': 'Add',
            'field.newemail': email_address,
            }
        view = create_initialized_view(self.person, "+editemails", form=form)
        error_msg = view.errors[0]
        expected_msg = ("The email address '%s' is already registered to an "
                        "account, deadaccount." % email_address)
        self.assertEqual(expected_msg, error_msg)


class TestTeamCreationView(TestCaseWithFactory):

    layer = DatabaseFunctionalLayer

    def setUp(self):
        super(TestTeamCreationView, self).setUp()
        person = self.factory.makePerson()
        login_person(person)

    def test_team_creation_good_data(self):
        form = {
            'field.actions.create': 'Create Team',
            'field.contactemail': 'contactemail@example.com',
            'field.displayname': 'liberty-land',
            'field.name': 'libertyland',
            'field.renewal_policy': 'NONE',
            'field.renewal_policy-empty-marker': 1,
            'field.subscriptionpolicy': 'RESTRICTED',
            'field.subscriptionpolicy-empty-marker': 1,
            }
        person_set = getUtility(IPersonSet)
        view = create_initialized_view(
            person_set, '+newteam', form=form)
        team = person_set.getByName('libertyland')
        self.assertTrue(team is not None)
        self.assertEqual('libertyland', team.name)

    def test_validate_email_catches_taken_emails(self):
        email_address = self.factory.getUniqueEmailAddress()
        account = self.factory.makeAccount(
            displayname='libertylandaccount',
            email=email_address,
            status=AccountStatus.NOACCOUNT)
        form = {
            'field.actions.create': 'Create Team',
            'field.contactemail': email_address,
            'field.displayname': 'liberty-land',
            'field.name': 'libertyland',
            'field.renewal_policy': 'NONE',
            'field.renewal_policy-empty-marker': 1,
            'field.subscriptionpolicy': 'RESTRICTED',
            'field.subscriptionpolicy-empty-marker': 1,
            }
        person_set = getUtility(IPersonSet)
        view = create_initialized_view(person_set, '+newteam', form=form)
        expected_msg = ('%s is already registered in Launchpad and is '
                        'associated with the libertylandaccount '
                        'account.' % email_address)
        error_msg = view.errors[0].errors[0]
        self.assertEqual(expected_msg, error_msg)


class TestPersonParticipationView(TestCaseWithFactory):

    layer = DatabaseFunctionalLayer

    def setUp(self):
        super(TestPersonParticipationView, self).setUp()
        self.user = self.factory.makePerson()
        self.view = create_view(self.user, name='+participation')

    def test__asParticpation_owner(self):
        # Team owners have the role of 'Owner'.
        self.factory.makeTeam(owner=self.user)
        [participation] = self.view.active_participations
        self.assertEqual('Owner', participation['role'])

    def test__asParticpation_admin(self):
        # Team admins have the role of 'Admin'.
        team = self.factory.makeTeam()
        login_person(team.teamowner)
        team.addMember(self.user, team.teamowner)
        for membership in self.user.team_memberships:
            membership.setStatus(
                TeamMembershipStatus.ADMIN, team.teamowner)
        [participation] = self.view.active_participations
        self.assertEqual('Admin', participation['role'])

    def test__asParticpation_member(self):
        # The default team role is 'Member'.
        team = self.factory.makeTeam()
        login_person(team.teamowner)
        team.addMember(self.user, team.teamowner)
        [participation] = self.view.active_participations
        self.assertEqual('Member', participation['role'])

    def test__asParticpation_without_mailing_list(self):
        # The default team role is 'Member'.
        team = self.factory.makeTeam()
        login_person(team.teamowner)
        team.addMember(self.user, team.teamowner)
        [participation] = self.view.active_participations
        self.assertEqual('&mdash;', participation['subscribed'])

    def test__asParticpation_unsubscribed_to_mailing_list(self):
        # The default team role is 'Member'.
        team = self.factory.makeTeam()
        self.factory.makeMailingList(team, team.teamowner)
        login_person(team.teamowner)
        team.addMember(self.user, team.teamowner)
        [participation] = self.view.active_participations
        self.assertEqual('Not subscribed', participation['subscribed'])

    def test__asParticpation_subscribed_to_mailing_list(self):
        # The default team role is 'Member'.
        team = self.factory.makeTeam()
        mailing_list = self.factory.makeMailingList(team, team.teamowner)
        mailing_list.subscribe(self.user)
        login_person(team.teamowner)
        team.addMember(self.user, team.teamowner)
        [participation] = self.view.active_participations
        self.assertEqual('Subscribed', participation['subscribed'])

    def test_active_participations_with_direct_private_team(self):
        # Users cannot see private teams that they are not members of.
        team = self.factory.makeTeam(visibility=PersonVisibility.PRIVATE)
        login_person(team.teamowner)
        team.addMember(self.user, team.teamowner)
        # The team is included in active_participations.
        login_person(self.user)
        view = create_view(
            self.user, name='+participation', principal=self.user)
        self.assertEqual(1, len(view.active_participations))
        # The team is not included in active_participations.
        observer = self.factory.makePerson()
        login_person(observer)
        view = create_view(
            self.user, name='+participation', principal=observer)
        self.assertEqual(0, len(view.active_participations))

    def test_active_participations_with_indirect_private_team(self):
        # Users cannot see private teams that they are not members of.
        team = self.factory.makeTeam(visibility=PersonVisibility.PRIVATE)
        direct_team = self.factory.makeTeam(owner=team.teamowner)
        login_person(team.teamowner)
        direct_team.addMember(self.user, team.teamowner)
        team.addMember(direct_team, team.teamowner)
        # The team is included in active_participations.
        login_person(self.user)
        view = create_view(
            self.user, name='+participation', principal=self.user)
        self.assertEqual(2, len(view.active_participations))
        # The team is not included in active_participations.
        observer = self.factory.makePerson()
        login_person(observer)
        view = create_view(
            self.user, name='+participation', principal=observer)
        self.assertEqual(1, len(view.active_participations))

    def test_active_participations_indirect_membership(self):
        # Verify the path of indirect membership.
        a_team = self.factory.makeTeam(name='a')
        b_team = self.factory.makeTeam(name='b', owner=a_team)
        c_team = self.factory.makeTeam(name='c', owner=b_team)
        login_person(a_team.teamowner)
        a_team.addMember(self.user, a_team.teamowner)
        transaction.commit()
        participations = self.view.active_participations
        self.assertEqual(3, len(participations))
        display_names = [
            participation['displayname'] for participation in participations]
        self.assertEqual(['A', 'B', 'C'], display_names)
        self.assertEqual(None, participations[0]['via'])
        self.assertEqual('A', participations[1]['via'])
        self.assertEqual('B, A', participations[2]['via'])

    def test_has_participations_false(self):
        participations = self.view.active_participations
        self.assertEqual(0, len(participations))
        self.assertEqual(False, self.view.has_participations)

    def test_has_participations_true(self):
        self.factory.makeTeam(owner=self.user)
        participations = self.view.active_participations
        self.assertEqual(1, len(participations))
        self.assertEqual(True, self.view.has_participations)


class TestPersonRelatedSoftwareView(TestCaseWithFactory):
    """Test the related software view."""

    layer = LaunchpadFunctionalLayer

    def setUp(self):
        super(TestPersonRelatedSoftwareView, self).setUp()
        self.user = self.factory.makePerson()
        self.factory.makeGPGKey(self.user)
        self.ubuntu = getUtility(ILaunchpadCelebrities).ubuntu
        self.warty = self.ubuntu.getSeries('warty')
        self.view = create_initialized_view(self.user, '+related-software')

    def publishSource(self, archive, maintainer):
        publisher = SoyuzTestPublisher()
        publisher.person = self.user
        login('foo.bar@canonical.com')
        for count in range(0, self.view.max_results_to_display + 3):
            source_name = "foo" + str(count)
            publisher.getPubSource(
                sourcename=source_name,
                status=PackagePublishingStatus.PUBLISHED,
                archive=archive,
                maintainer = maintainer,
                creator = self.user,
                distroseries=self.warty)
        login(ANONYMOUS)

    def test_view_helper_attributes(self):
        # Verify view helper attributes.
        self.assertEqual('Related software', self.view.page_title)
        self.assertEqual('summary_list_size', self.view._max_results_key)
        self.assertEqual(
            config.launchpad.summary_list_size,
            self.view.max_results_to_display)

    def test_tableHeaderMessage(self):
        limit = self.view.max_results_to_display
        expected = 'Displaying first %s packages out of 100 total' % limit
        self.assertEqual(expected, self.view._tableHeaderMessage(100))
        expected = '%s packages' % limit
        self.assertEqual(expected, self.view._tableHeaderMessage(limit))
        expected = '1 package'
        self.assertEqual(expected, self.view._tableHeaderMessage(1))

    def test_latest_uploaded_ppa_packages_with_stats(self):
        # Verify number of PPA packages to display.
        ppa = self.factory.makeArchive(owner=self.user)
        self.publishSource(ppa, self.user)
        count = len(self.view.latest_uploaded_ppa_packages_with_stats)
        self.assertEqual(self.view.max_results_to_display, count)

    def test_latest_maintained_packages_with_stats(self):
        # Verify number of maintained packages to display.
        self.publishSource(self.warty.main_archive, self.user)
        count = len(self.view.latest_maintained_packages_with_stats)
        self.assertEqual(self.view.max_results_to_display, count)

    def test_latest_uploaded_nonmaintained_packages_with_stats(self):
        # Verify number of non maintained packages to display.
        maintainer = self.factory.makePerson()
        self.publishSource(self.warty.main_archive, maintainer)
        count = len(
            self.view.latest_uploaded_but_not_maintained_packages_with_stats)
        self.assertEqual(self.view.max_results_to_display, count)


class TestPersonMaintainedPackagesView(TestCaseWithFactory):
    """Test the maintained packages view."""

    layer = DatabaseFunctionalLayer

    def setUp(self):
        super(TestPersonMaintainedPackagesView, self).setUp()
        self.user = self.factory.makePerson()
        self.view = create_initialized_view(self.user, '+maintained-packages')

    def test_view_helper_attributes(self):
        # Verify view helper attributes.
        self.assertEqual('Maintained Packages', self.view.page_title)
        self.assertEqual('default_batch_size', self.view._max_results_key)
        self.assertEqual(
            config.launchpad.default_batch_size,
            self.view.max_results_to_display)


class TestPersonUploadedPackagesView(TestCaseWithFactory):
    """Test the maintained packages view."""

    layer = DatabaseFunctionalLayer

    def setUp(self):
        super(TestPersonUploadedPackagesView, self).setUp()
        self.user = self.factory.makePerson()
        self.view = create_initialized_view(self.user, '+uploaded-packages')

    def test_view_helper_attributes(self):
        # Verify view helper attributes.
        self.assertEqual('Uploaded packages', self.view.page_title)
        self.assertEqual('default_batch_size', self.view._max_results_key)
        self.assertEqual(
            config.launchpad.default_batch_size,
            self.view.max_results_to_display)


class TestPersonPPAPackagesView(TestCaseWithFactory):
    """Test the maintained packages view."""

    layer = DatabaseFunctionalLayer

    def setUp(self):
        super(TestPersonPPAPackagesView, self).setUp()
        self.user = self.factory.makePerson()
        self.view = create_initialized_view(self.user, '+ppa-packages')

    def test_view_helper_attributes(self):
        # Verify view helper attributes.
        self.assertEqual('PPA packages', self.view.page_title)
        self.assertEqual('default_batch_size', self.view._max_results_key)
        self.assertEqual(
            config.launchpad.default_batch_size,
            self.view.max_results_to_display)


class TestPersonRelatedProjectsView(TestCaseWithFactory):
    """Test the maintained packages view."""

    layer = DatabaseFunctionalLayer

    def setUp(self):
        super(TestPersonRelatedProjectsView, self).setUp()
        self.user = self.factory.makePerson()
        self.view = create_initialized_view(self.user, '+related-projects')

    def test_view_helper_attributes(self):
        # Verify view helper attributes.
        self.assertEqual('Related projects', self.view.page_title)
        self.assertEqual('default_batch_size', self.view._max_results_key)
        self.assertEqual(
            config.launchpad.default_batch_size,
            self.view.max_results_to_display)


class TestPersonRelatedSoftwareFailedBuild(TestCaseWithFactory):
    """The related software views display links to failed builds."""

    layer = LaunchpadFunctionalLayer

    def setUp(self):
        super(TestPersonRelatedSoftwareFailedBuild, self).setUp()
        self.user = self.factory.makePerson()

        # First we need to publish some PPA packages with failed builds
        # for this person.
        # XXX michaeln 2010-06-10 bug=592050.
        # Strangely, the builds need to be built in the context of a
        # main archive to reproduce bug 591010 for which this test was
        # written to demonstrate.
        login('foo.bar@canonical.com')
        publisher = SoyuzTestPublisher()
        publisher.prepareBreezyAutotest()
        ppa = self.factory.makeArchive(owner=self.user)
        src_pub = publisher.getPubSource(
            creator=self.user, maintainer=self.user, archive=ppa)
        binaries = publisher.getPubBinaries(
            pub_source=src_pub)
        self.build = binaries[0].binarypackagerelease.build
        self.build.status = BuildStatus.FAILEDTOBUILD
        self.build.archive = publisher.distroseries.main_archive
        login(ANONYMOUS)

    def test_related_software_with_failed_build(self):
        # The link to the failed build is displayed.
        self.view = create_view(self.user, name='+related-software')
        html = self.view()
        self.assertTrue(
            '<a href="/ubuntutest/+source/foo/666/+buildjob/%d">i386</a>' % (
                self.build.url_id) in html)

    def test_related_ppa_packages_with_failed_build(self):
        # The link to the failed build is displayed.
        self.view = create_view(self.user, name='+ppa-packages')
        html = self.view()
        self.assertTrue(
            '<a href="/ubuntutest/+source/foo/666/+buildjob/%d">i386</a>' % (
                self.build.url_id) in html)


class TestPersonDeactivateAccountView(TestCaseWithFactory):
    """Tests for the PersonDeactivateAccountView."""

    layer = DatabaseFunctionalLayer
    form = {
        'field.comment': 'Gotta go.',
        'field.actions.deactivate': 'Deactivate My Account',
        }

    def test_deactivate_user_active(self):
        user = self.factory.makePerson()
        login_person(user)
        view = create_initialized_view(
            user, '+deactivate-account', form=self.form)
        self.assertEqual([], view.errors)
        notifications = view.request.response.notifications
        self.assertEqual(1, len(notifications))
        self.assertEqual(
            'Your account has been deactivated.', notifications[0].message)
        self.assertEqual(AccountStatus.DEACTIVATED, user.account_status)

    def test_deactivate_user_already_deactivated(self):
        deactivated_user = self.factory.makePerson()
        login_person(deactivated_user)
        deactivated_user.deactivateAccount('going.')
        view = create_initialized_view(
            deactivated_user, '+deactivate-account', form=self.form)
        self.assertEqual(1, len(view.errors))
        self.assertEqual(
            'This account is already deactivated.', view.errors[0])


class TestTeamInvitationView(TestCaseWithFactory):
    """Tests for TeamInvitationView."""

    layer = DatabaseFunctionalLayer

    def setUp(self):
        super(TestTeamInvitationView, self).setUp()
        self.a_team = self.factory.makeTeam(name="team-a",
                                            displayname="A-Team")
        self.b_team = self.factory.makeTeam(name="team-b",
                                            displayname="B-Team")
        transaction.commit()

    def test_circular_invite(self):
        """Two teams can invite each other without horrifying results."""

        # Make the criss-cross invitations.
        # A invites B.
        login_person(self.a_team.teamowner)
        form = {
            'field.newmember': 'team-b',
            'field.actions.add': 'Add Member',
            }
        view = create_initialized_view(
            self.a_team, "+addmember", form=form)
        self.assertEqual([], view.errors)
        notifications = view.request.response.notifications
        self.assertEqual(1, len(notifications))
        self.assertEqual(
            u'B-Team (team-b) has been invited to join this team.',
            notifications[0].message)

        # B invites A.
        login_person(self.b_team.teamowner)
        form['field.newmember'] = 'team-a'
        view = create_initialized_view(
            self.b_team, "+addmember", form=form)
        self.assertEqual([], view.errors)
        notifications = view.request.response.notifications
        self.assertEqual(1, len(notifications))
        self.assertEqual(
            u'A-Team (team-a) has been invited to join this team.',
            notifications[0].message)

        # Team A accepts the invitation.
        login_person(self.a_team.teamowner)
        form = {
            'field.actions.accept': 'Accept',
            'field.acknowledger_comment': 'Thanks for inviting us.',
            }
        request = LaunchpadTestRequest(form=form, method='POST')
        request.setPrincipal(self.a_team.teamowner)
        membership_set = getUtility(ITeamMembershipSet)
        membership = membership_set.getByPersonAndTeam(self.a_team,
                                                       self.b_team)
        view = TeamInvitationView(membership, request)
        view.initialize()
        self.assertEqual([], view.errors)
        notifications = view.request.response.notifications
        self.assertEqual(1, len(notifications))
        self.assertEqual(
            u'This team is now a member of B-Team.',
            notifications[0].message)

        # Team B attempts to accept the invitation.
        login_person(self.b_team.teamowner)
        request = LaunchpadTestRequest(form=form, method='POST')
        request.setPrincipal(self.b_team.teamowner)
        membership = membership_set.getByPersonAndTeam(self.b_team,
                                                       self.a_team)
        view = TeamInvitationView(membership, request)
        view.initialize()
        self.assertEqual([], view.errors)
        notifications = view.request.response.notifications
        self.assertEqual(1, len(notifications))
        expected = (
            u'This team may not be added to A-Team because it is a member '
            'of B-Team.')
        self.assertEqual(
            expected,
            notifications[0].message)


class TestSubscriptionsView(TestCaseWithFactory):

    layer = LaunchpadFunctionalLayer

    def setUp(self):
        super(TestSubscriptionsView, self).setUp(
            user='test@canonical.com')
        self.user = getUtility(ILaunchBag).user
        self.person = self.factory.makePerson()
        self.other_person = self.factory.makePerson()
        self.team = self.factory.makeTeam(owner=self.user)
        self.team.addMember(self.person, self.user)

    def test_unsubscribe_link_appears_for_user(self):
        login_person(self.person)
        view = create_view(self.person, '+subscriptions')
        self.assertTrue(view.canUnsubscribeFromBugTasks())

    def test_unsubscribe_link_does_not_appear_for_not_user(self):
        login_person(self.other_person)
        view = create_view(self.person, '+subscriptions')
        self.assertFalse(view.canUnsubscribeFromBugTasks())

    def test_unsubscribe_link_appears_for_team_member(self):
        login_person(self.person)
        view = create_initialized_view(self.team, '+subscriptions')
        self.assertTrue(view.canUnsubscribeFromBugTasks())


class BugTaskViewsTestBase:
    """A base class for bugtask search related tests."""

    layer = DatabaseFunctionalLayer

    def setUp(self):
        super(BugTaskViewsTestBase, self).setUp()
        self.person = self.factory.makePerson()
        with person_logged_in(self.person):
            self.subscribed_bug = self.factory.makeBug()
            self.subscribed_bug.subscribe(
                self.person, subscribed_by=self.person)
            self.assigned_bug = self.factory.makeBug()
            self.assigned_bug.default_bugtask.transitionToAssignee(
                self.person)
            self.owned_bug = self.factory.makeBug(owner=self.person)
            self.commented_bug = self.factory.makeBug()
            self.commented_bug.newMessage(owner=self.person)

        for bug in (self.subscribed_bug, self.assigned_bug, self.owned_bug,
                    self.commented_bug):
            with person_logged_in(bug.default_bugtask.product.owner):
                milestone = self.factory.makeMilestone(
                    product=bug.default_bugtask.product)
                bug.default_bugtask.transitionToMilestone(
                    milestone, bug.default_bugtask.product.owner)

    def test_searchUnbatched(self):
        view = create_initialized_view(self.person, self.view_name)
        self.assertEqual(
            self.expected_for_search_unbatched, list(view.searchUnbatched()))

    def test_searchUnbatched_with_prejoins(self):
        view = create_initialized_view(self.person, self.view_name)
        Store.of(self.subscribed_bug).invalidate()
        with StormStatementRecorder() as recorder:
            prejoins=[(Person, LeftJoin(Person, BugTask.owner==Person.id))]
            bugtasks = view.searchUnbatched(prejoins=prejoins)
            [bugtask.owner for bugtask in bugtasks]
        self.assertThat(recorder, HasQueryCount(Equals(1)))

    def test_getMilestoneWidgetValues(self):
        view = create_initialized_view(self.person, self.view_name)
        milestones = [
            bugtask.milestone
            for bugtask in self.expected_for_search_unbatched]
        milestones = sorted(milestones, key=milestone_sort_key, reverse=True)
        expected = [
            {
                'title': milestone.title,
                'value': milestone.id,
                'checked': False,
                }
            for milestone in milestones]
        Store.of(milestones[0]).invalidate()
        with StormStatementRecorder() as recorder:
            self.assertEqual(expected, view.getMilestoneWidgetValues())
        self.assertThat(recorder, HasQueryCount(Equals(1)))


class TestPersonRelatedBugTaskSearchListingView(
    BugTaskViewsTestBase, TestCaseWithFactory):
    """Tests for PersonRelatedBugTaskSearchListingView."""

    view_name = '+bugs'

    def setUp(self):
        super(TestPersonRelatedBugTaskSearchListingView, self).setUp()
        self.expected_for_search_unbatched = [
            self.subscribed_bug.default_bugtask,
            self.assigned_bug.default_bugtask,
            self.owned_bug.default_bugtask,
            self.commented_bug.default_bugtask,
            ]


class TestPersonAssignedBugTaskSearchListingView(
    BugTaskViewsTestBase, TestCaseWithFactory):
    """Tests for PersonAssignedBugTaskSearchListingView."""

    view_name = '+assignedbugs'

    def setUp(self):
        super(TestPersonAssignedBugTaskSearchListingView, self).setUp()
        self.expected_for_search_unbatched = [
            self.assigned_bug.default_bugtask,
            ]


class TestPersonCommentedBugTaskSearchListingView(
    BugTaskViewsTestBase, TestCaseWithFactory):
    """Tests for PersonAssignedBugTaskSearchListingView."""

    view_name = '+commentedbugs'

    def setUp(self):
        super(TestPersonCommentedBugTaskSearchListingView, self).setUp()
        self.expected_for_search_unbatched = [
            self.commented_bug.default_bugtask,
            ]


class TestPersonReportedBugTaskSearchListingView(
    BugTaskViewsTestBase, TestCaseWithFactory):
    """Tests for PersonAssignedBugTaskSearchListingView."""

    view_name = '+reportedbugs'

    def setUp(self):
        super(TestPersonReportedBugTaskSearchListingView, self).setUp()
        self.expected_for_search_unbatched = [
            self.owned_bug.default_bugtask,
            ]


class TestPersonSubscribedBugTaskSearchListingView(
    BugTaskViewsTestBase, TestCaseWithFactory):
    """Tests for PersonAssignedBugTaskSearchListingView."""

    view_name = '+subscribedbugs'

    def setUp(self):
        super(TestPersonSubscribedBugTaskSearchListingView, self).setUp()
        self.expected_for_search_unbatched = [
            self.subscribed_bug.default_bugtask,
            self.owned_bug.default_bugtask,
            ]
