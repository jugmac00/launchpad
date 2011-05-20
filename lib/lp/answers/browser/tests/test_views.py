# Copyright 2009-2010 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""Test harness for Answer Tracker related unit tests.

"""

__metaclass__ = type

__all__ = []

import unittest

from canonical.launchpad.testing.systemdocs import (
    LayeredDocFileSuite,
    setUp,
    tearDown,
    )
from canonical.testing.layers import (
    DatabaseFunctionalLayer,
    LaunchpadFunctionalLayer,
    )
from lp.testing import BrowserTestCase


class TestEmailObfuscated(BrowserTestCase):
    """Test for obfuscated emails on answers pages."""

    layer = DatabaseFunctionalLayer

    def getBrowserForQuestionWithEmail(self, email_address, no_login):
        question = self.factory.makeQuestion(
            title="Title with %s contained" % email_address,
            description="Description with %s contained." % email_address)
        return self.getViewBrowser(
            question, rootsite="answers", no_login=no_login)

    def test_user_sees_email_address(self):
        """A logged-in user can see the email address on the page."""
        email_address = "mark@example.com"
        browser = self.getBrowserForQuestionWithEmail(
            email_address, no_login=False)
        self.assertEqual(4, browser.contents.count(email_address))

    def test_anonymous_sees_not_email_address(self):
        """The anonymous user cannot see the email address on the page."""
        email_address = "mark@example.com"
        browser = self.getBrowserForQuestionWithEmail(
            email_address, no_login=True)
        # XXX: henninge 20110520 bug=740208: One occurrence is still found
        # in the LP.cache['context'] on the page.
        self.assertEqual(2, browser.contents.count(email_address))


def test_suite():
    suite = unittest.TestSuite()
    loader = unittest.TestLoader()
    suite.addTest(loader.loadTestsFromTestCase(TestEmailObfuscated))
    suite.addTest(LayeredDocFileSuite('question-subscribe_me.txt',
                  setUp=setUp, tearDown=tearDown,
                  layer=DatabaseFunctionalLayer))
    suite.addTest(LayeredDocFileSuite('views.txt',
                  setUp=setUp, tearDown=tearDown,
                  layer=DatabaseFunctionalLayer))
    suite.addTest(LayeredDocFileSuite('faq-views.txt',
                  setUp=setUp, tearDown=tearDown,
                  layer=LaunchpadFunctionalLayer))
    return suite
