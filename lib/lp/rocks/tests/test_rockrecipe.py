# Copyright 2024 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""Test rock recipes."""

from zope.component import getUtility
from zope.security.proxy import removeSecurityProxy

from lp.app.enums import InformationType
from lp.rocks.interfaces.rockrecipe import (
    ROCK_RECIPE_ALLOW_CREATE,
    IRockRecipe,
    IRockRecipeSet,
    NoSourceForRockRecipe,
    RockRecipeFeatureDisabled,
    RockRecipePrivateFeatureDisabled,
)
from lp.services.database.constants import ONE_DAY_AGO, UTC_NOW
from lp.services.features.testing import FeatureFixture
from lp.services.webapp.snapshot import notify_modified
from lp.testing import TestCaseWithFactory, admin_logged_in, person_logged_in
from lp.testing.layers import DatabaseFunctionalLayer, LaunchpadZopelessLayer


class TestRockRecipeFeatureFlags(TestCaseWithFactory):

    layer = LaunchpadZopelessLayer

    def test_feature_flag_disabled(self):
        # Without a feature flag, we wil not create any rock recipes.
        self.assertRaises(
            RockRecipeFeatureDisabled, self.factory.makeRockRecipe
        )

    def test_private_feature_flag_disabled(self):
        # Without a private feature flag, we will not create new private
        # rock recipes.
        self.useFixture(FeatureFixture({ROCK_RECIPE_ALLOW_CREATE: "on"}))
        self.assertRaises(
            RockRecipePrivateFeatureDisabled,
            self.factory.makeRockRecipe,
            information_type=InformationType.PROPRIETARY,
        )


class TestRockRecipe(TestCaseWithFactory):

    layer = DatabaseFunctionalLayer

    def setUp(self):
        super().setUp()
        self.useFixture(FeatureFixture({ROCK_RECIPE_ALLOW_CREATE: "on"}))

    def test_implements_interfaces(self):
        # RockRecipe implements IRockRecipe.
        recipe = self.factory.makeRockRecipe()
        with admin_logged_in():
            self.assertProvides(recipe, IRockRecipe)

    def test___repr__(self):
        # RockRecipe objects have an informative __repr__.
        recipe = self.factory.makeRockRecipe()
        self.assertEqual(
            "<RockRecipe ~%s/%s/+rock/%s>"
            % (recipe.owner.name, recipe.project.name, recipe.name),
            repr(recipe),
        )

    def test_initial_date_last_modified(self):
        # The initial value of date_last_modified is date_created.
        recipe = self.factory.makeRockRecipe(date_created=ONE_DAY_AGO)
        self.assertEqual(recipe.date_created, recipe.date_last_modified)

    def test_modifiedevent_sets_date_last_modified(self):
        # When a RockRecipe receives an object modified event, the last
        # modified date is set to UTC_NOW.
        recipe = self.factory.makeRockRecipe(date_created=ONE_DAY_AGO)
        with notify_modified(removeSecurityProxy(recipe), ["name"]):
            pass
        self.assertSqlAttributeEqualsDate(
            recipe, "date_last_modified", UTC_NOW
        )

    def test_delete_without_builds(self):
        # A rock recipe with no builds can be deleted.
        owner = self.factory.makePerson()
        project = self.factory.makeProduct()
        recipe = self.factory.makeRockRecipe(
            registrant=owner, owner=owner, project=project, name="condemned"
        )
        self.assertIsNotNone(
            getUtility(IRockRecipeSet).getByName(owner, project, "condemned")
        )
        with person_logged_in(recipe.owner):
            recipe.destroySelf()
        self.assertIsNone(
            getUtility(IRockRecipeSet).getByName(owner, project, "condemned")
        )


class TestRockRecipeSet(TestCaseWithFactory):

    layer = DatabaseFunctionalLayer

    def setUp(self):
        super().setUp()
        self.useFixture(FeatureFixture({ROCK_RECIPE_ALLOW_CREATE: "on"}))

    def test_class_implements_interfaces(self):
        # The RockRecipeSet class implements IRockRecipeSet.
        self.assertProvides(getUtility(IRockRecipeSet), IRockRecipeSet)

    def makeRockRecipeComponents(self, git_ref=None):
        """Return a dict of values that can be used to make a rock recipe.

        Suggested use: provide as kwargs to IRockRecipeSet.new.

        :param git_ref: An `IGitRef`, or None.
        """
        registrant = self.factory.makePerson()
        components = {
            "registrant": registrant,
            "owner": self.factory.makeTeam(owner=registrant),
            "project": self.factory.makeProduct(),
            "name": self.factory.getUniqueUnicode("rock-name"),
        }
        if git_ref is None:
            git_ref = self.factory.makeGitRefs()[0]
        components["git_ref"] = git_ref
        return components

    def test_creation_git(self):
        # The metadata entries supplied when a rock recipe is created for a
        # Git branch are present on the new object.
        [ref] = self.factory.makeGitRefs()
        components = self.makeRockRecipeComponents(git_ref=ref)
        recipe = getUtility(IRockRecipeSet).new(**components)
        self.assertEqual(components["registrant"], recipe.registrant)
        self.assertEqual(components["owner"], recipe.owner)
        self.assertEqual(components["project"], recipe.project)
        self.assertEqual(components["name"], recipe.name)
        self.assertEqual(ref.repository, recipe.git_repository)
        self.assertEqual(ref.path, recipe.git_path)
        self.assertEqual(ref, recipe.git_ref)
        self.assertIsNone(recipe.build_path)
        self.assertFalse(recipe.auto_build)
        self.assertIsNone(recipe.auto_build_channels)
        self.assertTrue(recipe.require_virtualized)
        self.assertFalse(recipe.private)
        self.assertFalse(recipe.store_upload)
        self.assertIsNone(recipe.store_name)
        self.assertIsNone(recipe.store_secrets)
        self.assertEqual([], recipe.store_channels)

    def test_creation_no_source(self):
        # Attempting to create a rock recipe without a Git repository
        # fails.
        registrant = self.factory.makePerson()
        self.assertRaises(
            NoSourceForRockRecipe,
            getUtility(IRockRecipeSet).new,
            registrant,
            registrant,
            self.factory.makeProduct(),
            self.factory.getUniqueUnicode("rock-name"),
        )

    def test_getByName(self):
        owner = self.factory.makePerson()
        project = self.factory.makeProduct()
        project_recipe = self.factory.makeRockRecipe(
            registrant=owner, owner=owner, project=project, name="proj-rock"
        )
        self.factory.makeRockRecipe(
            registrant=owner, owner=owner, name="proj-rock"
        )

        self.assertEqual(
            project_recipe,
            getUtility(IRockRecipeSet).getByName(owner, project, "proj-rock"),
        )

    def test_findByGitRepository(self):
        # IRockRecipeSet.findByGitRepository returns all rock recipes with
        # the given Git repository.
        repositories = [self.factory.makeGitRepository() for i in range(2)]
        recipes = []
        for repository in repositories:
            for _ in range(2):
                [ref] = self.factory.makeGitRefs(repository=repository)
                recipes.append(self.factory.makeRockRecipe(git_ref=ref))
        recipe_set = getUtility(IRockRecipeSet)
        self.assertContentEqual(
            recipes[:2], recipe_set.findByGitRepository(repositories[0])
        )
        self.assertContentEqual(
            recipes[2:], recipe_set.findByGitRepository(repositories[1])
        )

    def test_findByGitRepository_paths(self):
        # IRockRecipeSet.findByGitRepository can restrict by reference
        # paths.
        repositories = [self.factory.makeGitRepository() for i in range(2)]
        recipes = []
        for repository in repositories:
            for _ in range(3):
                [ref] = self.factory.makeGitRefs(repository=repository)
                recipes.append(self.factory.makeRockRecipe(git_ref=ref))
        recipe_set = getUtility(IRockRecipeSet)
        self.assertContentEqual(
            [], recipe_set.findByGitRepository(repositories[0], paths=[])
        )
        self.assertContentEqual(
            [recipes[0]],
            recipe_set.findByGitRepository(
                repositories[0], paths=[recipes[0].git_ref.path]
            ),
        )
        self.assertContentEqual(
            recipes[:2],
            recipe_set.findByGitRepository(
                repositories[0],
                paths=[recipes[0].git_ref.path, recipes[1].git_ref.path],
            ),
        )

    def test_detachFromGitRepository(self):
        # IRockRecipeSet.detachFromGitRepository clears the given Git
        # repository from all rock recipes.
        repositories = [self.factory.makeGitRepository() for i in range(2)]
        recipes = []
        paths = []
        refs = []
        for repository in repositories:
            for _ in range(2):
                [ref] = self.factory.makeGitRefs(repository=repository)
                paths.append(ref.path)
                refs.append(ref)
                recipes.append(
                    self.factory.makeRockRecipe(
                        git_ref=ref, date_created=ONE_DAY_AGO
                    )
                )
        getUtility(IRockRecipeSet).detachFromGitRepository(repositories[0])
        self.assertEqual(
            [None, None, repositories[1], repositories[1]],
            [recipe.git_repository for recipe in recipes],
        )
        self.assertEqual(
            [None, None, paths[2], paths[3]],
            [recipe.git_path for recipe in recipes],
        )
        self.assertEqual(
            [None, None, refs[2], refs[3]],
            [recipe.git_ref for recipe in recipes],
        )
        for recipe in recipes[:2]:
            self.assertSqlAttributeEqualsDate(
                recipe, "date_last_modified", UTC_NOW
            )
