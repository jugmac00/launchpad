# -*- coding: utf-8 -*-
# Copyright 2011-2020 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""Tests for Distribution page."""

from __future__ import absolute_import, print_function, unicode_literals

__metaclass__ = type

from fixtures import FakeLogger
from lazr.restful.interfaces import IJSONRequestCache
import soupmatchers
from testtools.matchers import (
    MatchesAll,
    MatchesAny,
    Not,
    )
from zope.schema.vocabulary import SimpleVocabulary
from zope.security.proxy import removeSecurityProxy

from lp.app.browser.lazrjs import vocabulary_to_choice_edit_items
from lp.registry.enums import EXCLUSIVE_TEAM_POLICY
from lp.registry.interfaces.ociproject import OCI_PROJECT_ALLOW_CREATE
from lp.registry.interfaces.series import SeriesStatus
from lp.services.features.testing import FeatureFixture
from lp.services.webapp import canonical_url
from lp.services.webapp.publisher import RedirectionView
from lp.testing import (
    admin_logged_in,
    login_celebrity,
    login_person,
    TestCaseWithFactory,
    )
from lp.testing.layers import (
    DatabaseFunctionalLayer,
    ZopelessDatabaseLayer,
    )
from lp.testing.publication import test_traverse
from lp.testing.views import create_initialized_view


class TestDistributionNavigation(TestCaseWithFactory):

    layer = ZopelessDatabaseLayer

    def assertRedirects(self, url, expected_url):
        _, view, _ = test_traverse(url)
        self.assertIsInstance(view, RedirectionView)
        self.assertEqual(expected_url, removeSecurityProxy(view).target)

    def test_classic_series_url(self):
        distroseries = self.factory.makeDistroSeries()
        obj, _, _ = test_traverse(
            "http://launchpad.test/%s/%s" % (
                distroseries.distribution.name, distroseries.name))
        self.assertEqual(distroseries, obj)

    def test_classic_series_url_with_alias(self):
        distroseries = self.factory.makeDistroSeries()
        distroseries.distribution.development_series_alias = "devel"
        self.assertRedirects(
            "http://launchpad.test/%s/devel" % distroseries.distribution.name,
            "http://launchpad.test/%s/%s" % (
                distroseries.distribution.name, distroseries.name))

    def test_new_series_url_redirects(self):
        distroseries = self.factory.makeDistroSeries()
        self.assertRedirects(
            "http://launchpad.test/%s/+series/%s" % (
                distroseries.distribution.name, distroseries.name),
            "http://launchpad.test/%s/%s" % (
                distroseries.distribution.name, distroseries.name))

    def test_new_series_url_with_alias_redirects(self):
        distroseries = self.factory.makeDistroSeries()
        distroseries.distribution.development_series_alias = "devel"
        self.assertRedirects(
            "http://launchpad.test/%s/+series/devel" % (
                distroseries.distribution.name),
            "http://launchpad.test/%s/%s" % (
                distroseries.distribution.name, distroseries.name))


class TestDistributionPage(TestCaseWithFactory):
    """A TestCase for the distribution index page."""

    layer = DatabaseFunctionalLayer

    def setUp(self):
        super(TestDistributionPage, self).setUp()
        self.distro = self.factory.makeDistribution(
            name="distro", displayname=u'distro')
        self.simple_user = self.factory.makePerson()
        # Use a FakeLogger fixture to prevent Memcached warnings to be
        # printed to stdout while browsing pages.
        self.useFixture(FeatureFixture({OCI_PROJECT_ALLOW_CREATE: True}))
        self.useFixture(FakeLogger())

    def test_distributionpage_addseries_link(self):
        # An admin sees the +addseries link.
        self.admin = login_celebrity('admin')
        view = create_initialized_view(
            self.distro, '+index', principal=self.admin)
        series_matches = soupmatchers.HTMLContains(
            soupmatchers.Tag(
                'link to add a series', 'a',
                attrs={'href':
                    canonical_url(self.distro, view_name='+addseries')},
                text='Add series'),
            soupmatchers.Tag(
                'Active series and milestones widget', 'h2',
                text='Active series and milestones'),
            )
        self.assertThat(view.render(), series_matches)

    def test_distributionpage_search_oci_project_link_is_hidden(self):
        # User can't see the +search-oci-project link if there are no
        # available OCI projects.
        admin = login_celebrity('admin')
        browser = self.getUserBrowser(canonical_url(self.distro), user=admin)
        matchers = Not(soupmatchers.HTMLContains(
            soupmatchers.Tag(
                'link to search oci project', 'a',
                attrs={'href': canonical_url(
                    self.distro, view_name='+search-oci-project')},
                text='Search for OCI project')))
        self.assertThat(browser.contents, matchers)

    def test_distributionpage_search_oci_project_link_is_shown(self):
        # User can see the +search-oci-project link if there are OCI projects.
        self.factory.makeOCIProject(pillar=self.distro)
        admin = login_celebrity('admin')
        browser = self.getUserBrowser(canonical_url(self.distro), user=admin)
        matchers = soupmatchers.HTMLContains(
            soupmatchers.Tag(
                'link to search oci project', 'a',
                attrs={'href': canonical_url(
                    self.distro, view_name='+search-oci-project')},
                text='Search for OCI project'))
        self.assertThat(browser.contents, matchers)

    def test_distributionpage_oci_links_are_hidden_if_disabled_flag(self):
        # User can't see OCI project create/search links if the feature flag
        # is disabled.
        self.useFixture(FeatureFixture({OCI_PROJECT_ALLOW_CREATE: ''}))
        user = self.factory.makePerson()
        browser = self.getUserBrowser(canonical_url(self.distro), user=user)

        self.assertThat(browser.contents, Not(soupmatchers.HTMLContains(
            soupmatchers.Tag(
                'link to search oci project', 'a',
                attrs={'href': canonical_url(
                    self.distro, view_name='+search-oci-project')},
                text='Search for OCI project'))))

        self.assertThat(browser.contents, Not(soupmatchers.HTMLContains(
            soupmatchers.Tag(
                'link to create oci project', 'a',
                attrs={'href': canonical_url(
                    self.distro, view_name='+new-oci-project')},
                text='Create an OCI project'))))

    def test_distributionpage_oci_links_for_user_no_permission(self):
        # User can't see OCI project create links if the the user
        # doesn't have permission to create OCI projects.
        self.factory.makeOCIProject(pillar=self.distro)
        user = self.factory.makePerson()
        browser = self.getUserBrowser(canonical_url(self.distro), user=user)

        # User can see search link
        self.assertThat(browser.contents, soupmatchers.HTMLContains(
            soupmatchers.Tag(
                'link to search oci project', 'a',
                attrs={'href': canonical_url(
                    self.distro, view_name='+search-oci-project')},
                text='Search for OCI project')))

        # User cannot see "new-oci-project" link.
        self.assertThat(browser.contents, Not(soupmatchers.HTMLContains(
            soupmatchers.Tag(
                'link to create oci project', 'a',
                attrs={'href': canonical_url(
                    self.distro, view_name='+new-oci-project')},
                text='Create an OCI project'))))

    def test_distributionpage_addseries_link_noadmin(self):
        # A non-admin does not see the +addseries link nor the series
        # header (since there is no series yet).
        login_person(self.simple_user)
        view = create_initialized_view(
            self.distro, '+index', principal=self.simple_user)
        add_series_match = soupmatchers.HTMLContains(
            soupmatchers.Tag(
                'link to add a series', 'a',
                attrs={'href':
                    canonical_url(self.distro, view_name='+addseries')},
                text='Add series'))
        series_header_match = soupmatchers.HTMLContains(
            soupmatchers.Tag(
                'Active series and milestones widget', 'h2',
                text='Active series and milestones'))
        self.assertThat(
            view.render(),
            Not(MatchesAny(add_series_match, series_header_match)))

    def test_distributionpage_series_list_noadmin(self):
        # A non-admin does see the series list when there is a series.
        self.factory.makeDistroSeries(distribution=self.distro,
            status=SeriesStatus.CURRENT)
        login_person(self.simple_user)
        view = create_initialized_view(
            self.distro, '+index', principal=self.simple_user)
        add_series_match = soupmatchers.HTMLContains(
            soupmatchers.Tag(
                'link to add a series', 'a',
                attrs={'href':
                    canonical_url(self.distro, view_name='+addseries')},
                text='Add series'))
        series_header_match = soupmatchers.HTMLContains(
            soupmatchers.Tag(
                'Active series and milestones widget', 'h2',
                text='Active series and milestones'))
        self.assertThat(view.render(), series_header_match)
        self.assertThat(view.render(), Not(add_series_match))

    def test_mirrors_links(self):
        view = create_initialized_view(self.distro, "+index")
        cd_mirrors_link = soupmatchers.HTMLContains(soupmatchers.Tag(
            "CD mirrors link", "a", text="CD mirrors"))
        archive_mirrors_link = soupmatchers.HTMLContains(soupmatchers.Tag(
            "Archive mirrors link", "a", text="Archive mirrors"))
        self.assertThat(
            view(), Not(MatchesAny(cd_mirrors_link, archive_mirrors_link)))
        with admin_logged_in():
            self.distro.supports_mirrors = True
        self.assertThat(
            view(), MatchesAll(cd_mirrors_link, archive_mirrors_link))

    def test_ppas_link(self):
        view = create_initialized_view(self.distro, "+index")
        ppas_link = soupmatchers.HTMLContains(soupmatchers.Tag(
            "PPAs link", "a", text="Personal Package Archives"))
        self.assertThat(view(), Not(ppas_link))
        with admin_logged_in():
            self.distro.supports_ppas = True
        self.assertThat(view(), ppas_link)

    def test_builds_link(self):
        view = create_initialized_view(self.distro, "+index")
        builds_link = soupmatchers.HTMLContains(soupmatchers.Tag(
            "Builds link", "a", text="Builds"))
        self.assertThat(view(), Not(builds_link))
        with admin_logged_in():
            self.distro.official_packages = True
        self.assertThat(view(), builds_link)


class TestDistributionView(TestCaseWithFactory):
    """Tests the DistributionView."""

    layer = DatabaseFunctionalLayer

    def setUp(self):
        super(TestDistributionView, self).setUp()
        self.distro = self.factory.makeDistribution(
            name="distro", displayname=u'distro')

    def test_view_data_model(self):
        # The view's json request cache contains the expected data.
        view = create_initialized_view(self.distro, '+index')
        cache = IJSONRequestCache(view.request)
        policy_items = [(item.name, item) for item in EXCLUSIVE_TEAM_POLICY]
        team_membership_policy_data = vocabulary_to_choice_edit_items(
            SimpleVocabulary.fromItems(policy_items),
            value_fn=lambda item: item.name)
        self.assertContentEqual(
            team_membership_policy_data,
            cache.objects['team_membership_policy_data'])
