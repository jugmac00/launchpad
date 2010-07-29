# Copyright 2010 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""Test SourcePackageRelease."""

__metaclass__ = type

from canonical.testing import LaunchpadFunctionalLayer

from lp.testing import TestCaseWithFactory


class TestSourcePackageRelease(TestCaseWithFactory):

    layer = LaunchpadFunctionalLayer

    def test_uploader_no_uploader(self):
        spr = self.factory.makeSourcePackageRelease()
        self.assertEqual(
            None,
            spr.uploader)

    def test_uploader_dsc_package(self):
        owner = self.factory.makePerson()
        key = self.factory.makeGPGKey(owner)
        spr = self.factory.makeSourcePackageRelease(dscsigningkey=key)
        self.assertEqual(
            spr.dscsigningkey.owner,
            spr.uploader)

    def test_uploader_recipe(self):
        recipe_build = self.factory.makeSourcePackageRecipeBuild()
        recipe = recipe_build.recipe
        spr = self.factory.makeSourcePackageRelease(
            source_package_recipe_build=recipe_build)
        self.assertEqual(
            recipe_build.requester,
            spr.uploader)

