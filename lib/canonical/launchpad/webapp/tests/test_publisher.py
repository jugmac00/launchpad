# Copyright 2009 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

from doctest import (
    DocTestSuite,
    ELLIPSIS,
    )
from unittest import TestLoader, TestSuite

from lazr.restful.interfaces import IJSONRequestCache
import simplejson
from zope.component import getUtility

from canonical.testing.layers import DatabaseFunctionalLayer
from canonical.launchpad.webapp.publisher import LaunchpadView
from canonical.launchpad.webapp.servers import LaunchpadTestRequest
from lp.services.features.testing import FeatureFixture
from lp.services.worlddata.interfaces.country import ICountrySet
from lp.testing import (
    logout,
    person_logged_in,
    TestCaseWithFactory,
    )

from canonical.launchpad.webapp import publisher


class TestLaunchpadView(TestCaseWithFactory):

    layer = DatabaseFunctionalLayer

    def test_getCacheJSON_non_resource_context(self):
        view = LaunchpadView(object(), LaunchpadTestRequest())
        self.assertEqual('{}', view.getCacheJSON())

    @staticmethod
    def getCanada():
        return getUtility(ICountrySet)['CA']

    def assertIsCanada(self, json_dict):
        self.assertIs(None, json_dict['description'])
        self.assertEqual('CA', json_dict['iso3166code2'])
        self.assertEqual('CAN', json_dict['iso3166code3'])
        self.assertEqual('Canada', json_dict['name'])
        self.assertIs(None, json_dict['title'])
        self.assertContentEqual(
            ['description', 'http_etag', 'iso3166code2', 'iso3166code3',
             'name', 'resource_type_link', 'self_link', 'title'],
            json_dict.keys())

    def test_getCacheJSON_resource_context(self):
        view = LaunchpadView(self.getCanada(), LaunchpadTestRequest())
        json_dict = simplejson.loads(view.getCacheJSON())['context']
        self.assertIsCanada(json_dict)

    def test_getCacheJSON_non_resource_object(self):
        request = LaunchpadTestRequest()
        view = LaunchpadView(object(), request)
        IJSONRequestCache(request).objects['my_bool'] = True
        with person_logged_in(self.factory.makePerson()):
            self.assertEqual('{"my_bool": true}', view.getCacheJSON())

    def test_getCacheJSON_resource_object(self):
        request = LaunchpadTestRequest()
        view = LaunchpadView(object(), request)
        IJSONRequestCache(request).objects['country'] = self.getCanada()
        with person_logged_in(self.factory.makePerson()):
            json_dict = simplejson.loads(view.getCacheJSON())['country']
        self.assertIsCanada(json_dict)

    def test_getCacheJSON_context_overrides_objects(self):
        request = LaunchpadTestRequest()
        view = LaunchpadView(self.getCanada(), request)
        IJSONRequestCache(request).objects['context'] = True
        with person_logged_in(self.factory.makePerson()):
            json_dict = simplejson.loads(view.getCacheJSON())['context']
        self.assertIsCanada(json_dict)

    def test_getCache_anonymous(self):
        request = LaunchpadTestRequest()
        view = LaunchpadView(self.getCanada(), request)
        self.assertIs(None, view.user)
        IJSONRequestCache(request).objects['my_bool'] = True
        json_dict = simplejson.loads(view.getCacheJSON())
        self.assertIsCanada(json_dict['context'])
        self.assertFalse('my_bool' in json_dict)

    def test_getCache_anonymous_obfuscated(self):
        request = LaunchpadTestRequest()
        branch = self.factory.makeBranch(name='user@domain')
        logout()
        view = LaunchpadView(branch, request)
        self.assertIs(None, view.user)
        self.assertNotIn('user@domain', view.getCacheJSON())

    def test_active_beta_features__default(self):
        # By default, LaunchpadView.active_beta_features is empty.
        request = LaunchpadTestRequest()
        view = LaunchpadView(object(), request)
        self.assertEqual(0, len(view.active_beta_features))

    def test_active_beta_features__with_beta_feature_nothing_enabled(self):
        # If a view has a non-empty sequence of beta feature flags but if
        # no matching feature rules are defined, its property
        # active_beta_features is empty.
        request = LaunchpadTestRequest()
        view = LaunchpadView(object(), request)
        view.beta_features = ['test_feature']
        self.assertEqual(0, len(view.active_beta_features))

    def test_active_beta_features__default_scope_only(self):
        # If a view has a non-empty sequence of beta feature flags but if
        # only a default scope is defined, its property
        # active_beta_features is empty.
        self.useFixture(FeatureFixture(
            {},
            (
                {
                    u'flag': u'test_feature',
                    u'scope': u'default',
                    u'priority': 0,
                    u'value': u'on',
                    },
                )))
        request = LaunchpadTestRequest()
        view = LaunchpadView(object(), request)
        view.beta_features = ['test_feature']
        self.assertEqual([], view.active_beta_features)

    def test_active_beta_features__enabled_feature(self):
        # If a view has a non-empty sequence of beta feature flags and if
        # only a non-default scope is defined and active, the property
        # active_beta_features contains this feature flag.
        self.useFixture(FeatureFixture(
            {},
            (
                {
                    u'flag': u'test_feature',
                    u'scope': u'pageid:foo',
                    u'priority': 0,
                    u'value': u'on',
                    },
                )))
        request = LaunchpadTestRequest()
        view = LaunchpadView(object(), request)
        view.beta_features = ['test_feature']
        self.assertEqual(['test_feature'], view.active_beta_features)

    def makeFeatureFlagDictionaries(self, default_value, scope_value):
        # Return two dictionaries describing a feature.
        def makeFeatureDict(value, scope, priority):
            return {
                u'flag': u'test_feature',
                u'scope': scope,
                u'priority': priority,
                u'value': value,
                }
        return (
            makeFeatureDict(default_value, u'default', 0),
            makeFeatureDict(scope_value, u'pageid:foo', 10))

    def test_active_beta_features__enabled_feature_with_default(self):
        # If a view
        #   * has a non-empty sequence of beta feature flags,
        #   * the default scope and a non-default scope are defined
        #     but have different values,
        # then the property active_beta_features contains this feature flag.
        self.useFixture(FeatureFixture(
            {}, self.makeFeatureFlagDictionaries(u'', u'on')))
        request = LaunchpadTestRequest()
        view = LaunchpadView(object(), request)
        view.beta_features = ['test_feature']
        self.assertEqual(['test_feature'], view.active_beta_features)

    def test_active_beta_features__enabled_feature_with_default_same_value(
        self):
        # If a view
        #   * has a non-empty sequence of beta feature flags,
        #   * the default scope and a non-default scope are defined
        #     and have the same values,
        # then the property active_beta_features does not contain this
        # feature flag.
        self.useFixture(FeatureFixture(
            {}, self.makeFeatureFlagDictionaries(u'on', u'on')))
        request = LaunchpadTestRequest()
        view = LaunchpadView(object(), request)
        view.beta_features = ['test_feature']
        self.assertEqual([], view.active_beta_features)


def test_suite():
    suite = TestSuite()
    suite.addTest(DocTestSuite(publisher, optionflags=ELLIPSIS))
    suite.addTest(TestLoader().loadTestsFromName(__name__))
    return suite
