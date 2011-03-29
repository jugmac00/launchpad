# Copyright 2010 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""Tests for sharing details page."""


__metaclass__ = type


import transaction

from canonical.launchpad.webapp import canonical_url
from lp.testing import (
    feature_flags,
    set_feature_flag,
    WindmillTestCase,
)
from lp.testing.windmill import (
    lpuser,
)
from lp.testing.windmill.constants import (
    FOR_ELEMENT,
    PAGE_LOAD,
)
from lp.testing.windmill.widgets import (
    search_and_select_picker_widget,
)
from lp.translations.windmill.testing import (
    TranslationsWindmillLayer,
)


class TestSharingDetails(WindmillTestCase):

    layer = TranslationsWindmillLayer

    def test_set_branch(self):
        sourcepackage = self.factory.makeSourcePackage()
        productseries = self.factory.makeProductSeries(name='my-ps-name')
        branch = self.factory.makeProductBranch(
            product=productseries.product, name='product-branch')
        self.useContext(feature_flags())
        set_feature_flag(u'translations.sharing_information.enabled', u'on')
        transaction.commit()
        url = canonical_url(
            sourcepackage, rootsite='translations',
            view_name='+sharing-details')
        self.client.open(url=url)
        self.client.waits.forPageLoad(timeout=PAGE_LOAD)
        lpuser.TRANSLATIONS_ADMIN.ensure_login(self.client)
        self.client.waits.forElement(
            id='branch-incomplete', timeout=FOR_ELEMENT)
        self.client.click(xpath='//*[@id="packaging-incomplete-picker"]/a')
        search_and_select_picker_widget(self.client, 'my-ps-name', 1)
        self.client.waits.forElementProperty(
            id='packaging-incomplete', option='className|sprite no unseen',
            timeout=FOR_ELEMENT)
        self.client.click(xpath='//*[@id="branch-incomplete-picker"]/a')
        search_and_select_picker_widget(self.client, 'product-branch', 1)
        self.client.waits.forElementProperty(
            id='branch-incomplete', option='className|sprite no unseen',
            timeout=FOR_ELEMENT)
        transaction.commit()
        self.assertEqual(branch, productseries.branch)
