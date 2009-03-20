# Copyright 2008 Canonical Ltd.  All rights reserved.

"""Tests for the DBPolicy."""

__metaclass__ = type
__all__ = []

import unittest

from zope.component import getAdapter, getUtility
from zope.interface.verify import verifyObject
from zope.publisher.interfaces.xmlrpc import IXMLRPCRequest

from canonical.launchpad.interfaces import IMasterStore, ISlaveStore
from canonical.launchpad.layers import (
    FeedsLayer, setFirstLayer, WebServiceLayer)
from canonical.launchpad.webapp.dbpolicy import (
    BaseDatabasePolicy, LaunchpadDatabasePolicy,
    MasterDatabasePolicy, SlaveDatabasePolicy, SSODatabasePolicy)
from canonical.launchpad.webapp.interfaces import (
    ALL_STORES, AUTH_STORE, DEFAULT_FLAVOR, DisallowedStore, IDatabasePolicy,
    IStoreSelector, MAIN_STORE, MASTER_FLAVOR, SLAVE_FLAVOR)
from canonical.launchpad.webapp.servers import LaunchpadTestRequest
from canonical.launchpad.webapp.tests import DummyConfigurationTestCase
from canonical.testing.layers import DatabaseFunctionalLayer


class ImplicitDatabasePolicyTestCase(unittest.TestCase):
    """Tests for when there is no policy installed."""
    layer = DatabaseFunctionalLayer

    def test_defaults(self):
        for store in ALL_STORES:
            self.failUnless(verifyObject(
                IMasterStore,
                getUtility(IStoreSelector).get(store, DEFAULT_FLAVOR)))

    def test_dbusers(self):
        store_selector = getUtility(IStoreSelector)
        main_store = store_selector.get(MAIN_STORE, DEFAULT_FLAVOR)
        self.failUnlessEqual(self.getDBUser(main_store), 'launchpad_main')

        auth_store = store_selector.get(AUTH_STORE, DEFAULT_FLAVOR)
        self.failUnlessEqual(self.getDBUser(auth_store), 'launchpad_auth')

    def getDBUser(self, store):
        return store.execute(
            'SHOW session_authorization').get_one()[0]


class BaseDatabasePolicyTestCase(ImplicitDatabasePolicyTestCase):
    """Base tests for DatabasePolicy implementation."""

    policy = None

    def setUp(self):
        if self.policy is None:
            self.policy = BaseDatabasePolicy()
        getUtility(IStoreSelector).push(self.policy)

    def tearDown(self):
        getUtility(IStoreSelector).pop()

    def test_correctly_implements_IDatabasePolicy(self):
        self.failUnless(verifyObject(IDatabasePolicy, self.policy))


class SlaveDatabasePolicyTestCase(BaseDatabasePolicyTestCase):
    """Tests for the `SlaveDatabasePolicy`."""

    def setUp(self):
        self.policy = SlaveDatabasePolicy()
        BaseDatabasePolicyTestCase.setUp(self)

    def test_FeedsLayer_uses_SlaveDatabasePolicy(self):
        """FeedsRequest should use the SlaveDatabasePolicy since they
        are read-only in nature. Also we don't want to send session cookies 
        over them.
        """
        request = LaunchpadTestRequest(
            SERVER_URL='http://feeds.launchpad.dev')
        setFirstLayer(request, FeedsLayer)
        policy = IDatabasePolicy(request)
        self.failUnless(
            isinstance(policy, SlaveDatabasePolicy),
            "Expected SlaveDatabasePolicy, not %s." % policy)

    def test_defaults(self):
        for store in ALL_STORES:
            self.failUnless(verifyObject(
                ISlaveStore,
                getUtility(IStoreSelector).get(store, DEFAULT_FLAVOR)))

    def test_master_disallowed(self):
        for store in ALL_STORES:
            self.assertRaises(
                DisallowedStore,
                getUtility(IStoreSelector).get, store, MASTER_FLAVOR)


class MasterDatabasePolicyTestCase(
    BaseDatabasePolicyTestCase, DummyConfigurationTestCase):
    """Tests for the `MasterDatabasePolicy`."""

    def setUp(self):
        self.policy = MasterDatabasePolicy()
        BaseDatabasePolicyTestCase.setUp(self)
        DummyConfigurationTestCase.setUp(self)

    def test_XMLRPCRequest_uses_MasterPolicy(self):
        """XMLRPC should always use the master flavor, since they always
        use POST and do not support session cookies.
        """
        request = LaunchpadTestRequest(
            SERVER_URL='http://xmlrpc-private.launchpad.dev')
        setFirstLayer(request, IXMLRPCRequest)
        policy = getAdapter(request, IDatabasePolicy)
        self.failUnless(
            isinstance(policy, MasterDatabasePolicy),
            "Expected MasterDatabasePolicy, not %s." % policy)

    def test_WebServiceRequest_uses_MasterPolicy(self):
        """WebService requests should always use the master flavor, since
        it's likely that clients won't support cookies and thus mixing read
        and write requests will result in incoherent views of the data.

        XXX 20099320 Stuart Bishop bug=297052: This doesn't scale of course
            and will meltdown when the API becomes popular.
        """
        server_url = ('http://api.launchpad.dev/'
                      + self.config.service_version_uri_prefix)
        request = LaunchpadTestRequest(SERVER_URL=server_url)
        setFirstLayer(request, WebServiceLayer)
        policy = getAdapter(request, IDatabasePolicy)
        self.failUnless(
            isinstance(policy, MasterDatabasePolicy),
            "Expected MasterDatabasePolicy, not %s." % policy)

    def test_slave_allowed(self):
        # We get the master store even if the slave was requested.
        for store in ALL_STORES:
            self.failUnless(verifyObject(
                IMasterStore,
                getUtility(IStoreSelector).get(store, SLAVE_FLAVOR)))


class LaunchpadDatabasePolicyTestCase(BaseDatabasePolicyTestCase):

    def setUp(self):
        request = LaunchpadTestRequest(SERVER_URL='http://launchpad.dev')
        self.policy = LaunchpadDatabasePolicy(request)
        BaseDatabasePolicyTestCase.setUp(self)

    def test_beforeTraversal_alters_defaults(self):
        # We just test that beforeTraversal does something here.
        # The more advanced load balancing tests are done as a page test
        # in standalone/xx-dbpolicy.txt
        self.failUnless(
            getUtility(IStoreSelector).get(MAIN_STORE, DEFAULT_FLAVOR)
            is getUtility(IStoreSelector).get(MAIN_STORE, MASTER_FLAVOR))
        self.failUnless(
            getUtility(IStoreSelector).get(AUTH_STORE, DEFAULT_FLAVOR)
            is getUtility(IStoreSelector).get(AUTH_STORE, MASTER_FLAVOR))
        self.policy.beforeTraversal()
        try:
            self.failUnless(
                getUtility(IStoreSelector).get(MAIN_STORE, DEFAULT_FLAVOR)
                is getUtility(IStoreSelector).get(MAIN_STORE, SLAVE_FLAVOR))
            self.failUnless(
                getUtility(IStoreSelector).get(AUTH_STORE, DEFAULT_FLAVOR)
                is getUtility(IStoreSelector).get(AUTH_STORE, SLAVE_FLAVOR))
        finally:
            self.policy.afterCall()


class SSODatabasePolicyTestCase(BaseDatabasePolicyTestCase):

    def setUp(self):
        self.policy = SSODatabasePolicy()
        BaseDatabasePolicyTestCase.setUp(self)

    def test_defaults(self):
        self.failUnless(verifyObject(
            ISlaveStore,
            getUtility(IStoreSelector).get(MAIN_STORE, DEFAULT_FLAVOR)))

        self.failUnless(verifyObject(
            IMasterStore,
            getUtility(IStoreSelector).get(AUTH_STORE, DEFAULT_FLAVOR)))

    def test_dbusers(self):
        store_selector = getUtility(IStoreSelector)
        main_store = store_selector.get(MAIN_STORE, DEFAULT_FLAVOR)
        self.failUnlessEqual(self.getDBUser(main_store), 'sso_main')

        auth_store = store_selector.get(AUTH_STORE, DEFAULT_FLAVOR)
        self.failUnlessEqual(self.getDBUser(auth_store), 'sso_auth')


def test_suite():
    return unittest.TestLoader().loadTestsFromName(__name__)
