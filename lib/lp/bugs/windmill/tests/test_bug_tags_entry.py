# Copyright 2009 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""Test for the bug tag entry UI."""

__metaclass__ = type
__all__ = []

import transaction
import unittest

from windmill.authoring import WindmillTestClient

from canonical.launchpad.webapp import canonical_url
from canonical.launchpad.windmill.testing import constants, lpuser
from lp.bugs.windmill.testing import BugsWindmillLayer
from lp.testing import TestCaseWithFactory

from zope.security.proxy import removeSecurityProxy

class TestBugTagsEntry(TestCaseWithFactory):

    layer = BugsWindmillLayer

    def test_bug_tags_entry(self):
        """Test bug tags inline, auto-completing UI."""
        client = WindmillTestClient('Bug tags entry test')

        # First, we add some official tags to test with

        product = self.factory.makeProduct()
        removeSecurityProxy(product).official_bug_tags = [
            u'eenie', u'meenie', u'meinie', u'moe']
        bug = self.factory.makeBug(product=product)
        removeSecurityProxy(bug).tags = ['unofficial-tag']
        # XXX Make the testing canonical_url available as a global utility
        bug_url = canonical_url(bug).replace(
            'https', 'http').replace('.dev/', '.dev:8085/')
        transaction.commit()

        lpuser.FOO_BAR.ensure_login(client)

        # Now let's tag a bug using the auto-complete widget

        client.open(url=bug_url)
        client.waits.forPageLoad(timeout=constants.PAGE_LOAD)
        client.waits.sleep(milliseconds=constants.SLEEP)

        # XXX intellectronica 2009-05-26:
        # We (almost) consistently get an error on the following line
        # where instead of trigerring the onclick event handler we navigate
        # to the link's URL.

        client.click(id=u'edit-tags-trigger')
        client.waits.forElement(
            id=u'tag-input', timeout=constants.FOR_ELEMENT)
        client.type(text=u'ee', id=u'tag-input')
        client.waits.sleep(milliseconds=constants.SLEEP)
        client.asserts.assertNode(classname=u'yui-autocomplete-list')
        client.click(id=u'item0')
        client.click(id=u'edit-tags-ok')
        client.waits.sleep(milliseconds=constants.SLEEP)
        client.asserts.assertText(id=u'tag-list', validator=u'eenie')

        # Test that anonymous users are prompted to log in.

        lpuser.ANONYMOUS.ensure_login(client)
        client.open(url=bug_url)
        client.waits.forPageLoad(timeout=constants.PAGE_LOAD)
        client.waits.sleep(milliseconds=constants.SLEEP)
        client.click(id=u'edit-tags-trigger')
        client.waits.forPageLoad(timeout=constants.PAGE_LOAD)
        client.asserts.assertJS(
            js=u'window.location.href.indexOf("+login") > 0')


def test_suite():
    return unittest.TestLoader().loadTestsFromName(__name__)
