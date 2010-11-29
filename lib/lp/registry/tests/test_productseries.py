# Copyright 2010 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""Tests for ProductSeries and ProductSeriesSet."""

__metaclass__ = type

from unittest import TestLoader

from zope.component import getUtility

from canonical.launchpad.ftests import login
from canonical.testing.layers import (
    DatabaseFunctionalLayer,
    LaunchpadFunctionalLayer,
    ZopelessDatabaseLayer,
    )
from lp.registry.interfaces.distribution import IDistributionSet
from lp.registry.interfaces.distroseries import IDistroSeriesSet
from lp.registry.interfaces.productseries import IProductSeriesSet
from lp.testing import TestCaseWithFactory
from lp.translations.interfaces.translations import (
    TranslationsBranchImportMode,
    )


class TestProductSeriesSetPackaging(TestCaseWithFactory):
    """Test for ProductSeries.setPackaging()."""

    layer = LaunchpadFunctionalLayer

    def setUp(self):
        TestCaseWithFactory.setUp(self)
        login('admin@canonical.com')

        self.sourcepackagename = self.factory.makeSourcePackageName()

        # Set up productseries.
        self.person = self.factory.makePerson()
        self.product = self.factory.makeProduct(owner=self.person)
        self.dev_focus = self.product.development_focus
        self.product_series = self.factory.makeProductSeries(self.product)

        # Set up distroseries.
        self.distroseries_set = getUtility(IDistroSeriesSet)
        self.distribution_set = getUtility(IDistributionSet)
        self.ubuntu = self.distribution_set.getByName("ubuntu")
        self.debian = self.distribution_set.getByName("debian")
        self.ubuntu_series = self.factory.makeDistroSeries(self.ubuntu)
        self.debian_series = self.factory.makeDistroSeries(self.debian)

    def test_setPackaging_without_publishing_history(self):
        # Fully functional (ubuntu) distributions are prevented from
        # having a packaging entry for a distroseries that does not
        # have a source package publishing history.
        self.assertRaises(
            AssertionError,
            self.product_series.setPackaging,
            self.ubuntu_series, self.sourcepackagename, self.person)

    def test_setPackaging_with_publishing_history(self):
        # Add the source package publishing history to the distroseries
        # so that the packaging can be added successfully.
        self.spph = self.factory.makeSourcePackagePublishingHistory(
            sourcepackagename=self.sourcepackagename,
            distroseries=self.ubuntu_series)
        self.product_series.setPackaging(
            self.ubuntu_series, self.sourcepackagename, self.person)

    def test_setPackaging_not_ubuntu(self):
        # A non-fully-functional distribution does not need a source
        # package publishing history before adding the packaging entry.
        self.product_series.setPackaging(
            self.debian_series, self.sourcepackagename, self.person)


class TestProductSeriesDrivers(TestCaseWithFactory):
    """Test the 'drivers' attribute of a ProductSeries."""

    layer = ZopelessDatabaseLayer

    def _makeProductAndSeries(self, with_project_group=True):
        """Setup Product and a ProductSeries and an optional project group."""
        if with_project_group:
            self.projectgroup = self.factory.makeProject()
        else:
            self.projectgroup = None
        self.product = self.factory.makeProduct(project=self.projectgroup)
        self.series = self.product.getSeries('trunk')

    def test_drivers_nodrivers_group(self):
        # With no drivers set, the project group owner is the driver.
        self._makeProductAndSeries(with_project_group=True)
        self.assertContentEqual(
            [self.projectgroup.owner], self.series.drivers)

    def test_drivers_nodrivers_product(self):
        # With no drivers set and without a project group, the product
        # owner is the driver.
        self._makeProductAndSeries(with_project_group=False)
        self.assertContentEqual(
            [self.product.owner], self.series.drivers)

    def _setDriver(self, object_with_driver):
        """Make a driver for `object_with_driver`, and return the driver."""
        object_with_driver.driver = self.factory.makePerson()
        return object_with_driver.driver

    def test_drivers_group(self):
        # A driver on the group is reported as one of the drivers of the
        # series.
        self._makeProductAndSeries(with_project_group=True)
        group_driver = self._setDriver(self.projectgroup)
        self.assertContentEqual(
            [group_driver], self.series.drivers)

    def test_drivers_group_product(self):
        # The driver on the group and the product are reported as the drivers
        # of the series.
        self._makeProductAndSeries(with_project_group=True)
        group_driver = self._setDriver(self.projectgroup)
        product_driver = self._setDriver(self.product)
        self.assertContentEqual(
            [group_driver, product_driver], self.series.drivers)

    def test_drivers_group_product_series(self):
        # All drivers at all levels are reported as the drivers of the series.
        self._makeProductAndSeries(with_project_group=True)
        group_driver = self._setDriver(self.projectgroup)
        product_driver = self._setDriver(self.product)
        series_driver = self._setDriver(self.series)
        self.assertContentEqual(
            [group_driver, product_driver, series_driver],
            self.series.drivers)

    def test_drivers_product(self):
        # The product driver is the driver if there is no other.
        self._makeProductAndSeries(with_project_group=True)
        product_driver = self._setDriver(self.product)
        self.assertContentEqual(
            [product_driver], self.series.drivers)

    def test_drivers_series(self):
        # If only the series has a driver, the project group owner is
        # is reported, too.
        self._makeProductAndSeries(with_project_group=True)
        series_driver = self._setDriver(self.series)
        self.assertContentEqual(
            [self.projectgroup.owner, series_driver], self.series.drivers)

    def test_drivers_product_series(self):
        self._makeProductAndSeries(with_project_group=True)
        product_driver = self._setDriver(self.product)
        series_driver = self._setDriver(self.series)
        self.assertContentEqual(
            [product_driver, series_driver], self.series.drivers)

    def test_drivers_group_series(self):
        self._makeProductAndSeries(with_project_group=True)
        group_driver = self._setDriver(self.projectgroup)
        series_driver = self._setDriver(self.series)
        self.assertContentEqual(
            [group_driver, series_driver], self.series.drivers)

    def test_drivers_series_nogroup(self):
        # Without a project group, the product owner is reported as driver.
        self._makeProductAndSeries(with_project_group=False)
        series_driver = self._setDriver(self.series)
        self.assertContentEqual(
            [self.product.owner, series_driver], self.series.drivers)

    def test_drivers_product_series_nogroup(self):
        self._makeProductAndSeries(with_project_group=False)
        product_driver = self._setDriver(self.product)
        series_driver = self._setDriver(self.series)
        self.assertContentEqual(
            [product_driver, series_driver], self.series.drivers)

    def test_drivers_product_nogroup(self):
        self._makeProductAndSeries(with_project_group=False)
        product_driver = self._setDriver(self.product)
        self.assertContentEqual(
            [product_driver], self.series.drivers)


class TestProductSeriesSet(TestCaseWithFactory):
    """Test ProductSeriesSet."""

    layer = ZopelessDatabaseLayer

    def setUp(self):
        super(TestProductSeriesSet, self).setUp()
        self.ps_set = getUtility(IProductSeriesSet)

    def _makeSeriesAndBranch(
            self, import_mode, branch=None, link_branch=True):
        productseries = self.factory.makeProductSeries()
        productseries.translations_autoimport_mode = import_mode
        if branch is None:
            branch = self.factory.makeProductBranch(productseries.product)
        if link_branch:
            productseries.branch = branch
        return (productseries, branch)

    def test_findByTranslationsImportBranch(self):
        productseries, branch = self._makeSeriesAndBranch(
            TranslationsBranchImportMode.IMPORT_TEMPLATES)

        self.assertContentEqual(
                [productseries],
                self.ps_set.findByTranslationsImportBranch(branch))

    def test_findByTranslationsImportBranch_full_import(self):
        productseries, branch = self._makeSeriesAndBranch(
            TranslationsBranchImportMode.IMPORT_TRANSLATIONS)

        self.assertContentEqual(
                [productseries],
                self.ps_set.findByTranslationsImportBranch(branch))

    def test_findByTranslationsImportBranch_no_autoimport(self):
        productseries, branch = self._makeSeriesAndBranch(
            TranslationsBranchImportMode.NO_IMPORT)

        self.assertContentEqual(
                [],
                self.ps_set.findByTranslationsImportBranch(branch))

    def test_findByTranslationsImportBranch_no_branch(self):
        productseries, branch = self._makeSeriesAndBranch(
            TranslationsBranchImportMode.IMPORT_TEMPLATES, link_branch=False)

        self.assertContentEqual(
                [],
                self.ps_set.findByTranslationsImportBranch(branch))

    def test_findByTranslationsImportBranch_force_import(self):
        productseries, branch = self._makeSeriesAndBranch(
            TranslationsBranchImportMode.NO_IMPORT)

        self.assertContentEqual(
                [productseries],
                self.ps_set.findByTranslationsImportBranch(branch, True))

    def test_findByTranslationsImportBranch_no_branch_force_import(self):
        productseries, branch = self._makeSeriesAndBranch(
            TranslationsBranchImportMode.NO_IMPORT, link_branch=False)

        self.assertContentEqual(
                [],
                self.ps_set.findByTranslationsImportBranch(branch, True))

    def test_findByTranslationsImportBranch_multiple_series(self):
        productseries, branch = self._makeSeriesAndBranch(
            TranslationsBranchImportMode.IMPORT_TEMPLATES)
        second_series, branch = self._makeSeriesAndBranch(
            TranslationsBranchImportMode.IMPORT_TEMPLATES, branch=branch)

        self.assertContentEqual(
                [productseries, second_series],
                self.ps_set.findByTranslationsImportBranch(branch))

    def test_findByTranslationsImportBranch_multiple_series_force(self):
        # XXX henninge 2010-03-18 bug=521095: This will fail when the bug
        # fixed. Please update the test accordingly.
        productseries, branch = self._makeSeriesAndBranch(
            TranslationsBranchImportMode.IMPORT_TEMPLATES)
        second_series, branch = self._makeSeriesAndBranch(
            TranslationsBranchImportMode.IMPORT_TEMPLATES, branch=branch)

        self.assertContentEqual(
                [productseries, second_series],
                self.ps_set.findByTranslationsImportBranch(branch, True))


class TestProductSeriesReleases(TestCaseWithFactory):
    '''Tests the releases functions for productseries.'''

    layer = DatabaseFunctionalLayer

    def setUp(self):
        super(TestProductSeriesReleases, self).setUp()
        self.product = self.factory.makeProduct()
        self.productseries = self.factory.makeProductSeries(
                                            product=self.product)

    def test_getLatestRelease(self):
        # getLatestRelease returns the most recent release.
        self.assertIs(None, self.productseries.getLatestRelease())

        release = self.factory.makeProductRelease(
                        product=self.product,
                        productseries=self.productseries)
        self.assertEqual(release, self.productseries.getLatestRelease())

        second_release = self.factory.makeProductRelease(
                                product=self.product,
                                productseries=self.productseries)
        self.assertEqual(
            second_release,
            self.productseries.getLatestRelease())


def test_suite():
    return TestLoader().loadTestsFromName(__name__)
