# Copyright 2009 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

from __future__ import with_statement

import os
import tarfile
import unittest

from StringIO import StringIO
from textwrap import dedent

from bzrlib.bzrdir import BzrDir
from canonical.launchpad.scripts.tests import run_script
from lp.translations.pottery.detect_intltool import is_intltool_structure
from canonical.buildd.pottery.intltool import (
    ConfigFile, check_potfiles_in, find_intltool_dirs, find_potfiles_in,
    generate_pot, generate_pots, get_translation_domain)
from lp.testing import TestCase


class SetupTestPackageMixin(object):

    test_data_dir = "pottery_test_data"

    def prepare_package(self, packagename, buildfiles={}):
        """Unpack the specified package in a temporary directory.

        Change into the package's directory.

        :param packagename: The name of the package to prepare.
        :param buildfiles: A dictionary of path:content describing files to
            add to the package.
        """
        # First build the path for the package.
        packagepath = os.path.join(
            os.getcwd(), os.path.dirname(__file__),
            self.test_data_dir, packagename + ".tar.bz2")
        # Then change into the temporary directory and unpack it.
        self.useTempDir()
        tar = tarfile.open(packagepath, "r|bz2")
        tar.extractall()
        tar.close()
        os.chdir(packagename)
        # Add files as requested.
        for path, content in buildfiles.items():
            directory= os.path.dirname(path)
            if directory != '':
                try:
                    os.makedirs(directory)
                except OSError, e:
                    # Doesn't matter if it already exists.
                    if e.errno != 17:
                        raise
            with open(path, 'w') as the_file:
                the_file.write(content)


class TestDetectIntltool(TestCase, SetupTestPackageMixin):

    def test_detect_potfiles_in(self):
        # Find POTFILES.in in a package with multiple dirs when only one has
        # POTFILES.in.
        self.prepare_package("intltool_POTFILES_in_1")
        dirs = find_potfiles_in()
        self.assertContentEqual(["./po-intltool"], dirs)

    def test_detect_potfiles_in_module(self):
        # Find POTFILES.in in a package with POTFILES.in at different levels.
        self.prepare_package("intltool_POTFILES_in_2")
        dirs = find_potfiles_in()
        self.assertContentEqual(["./po", "./module1/po"], dirs)

    def test_check_potfiles_in_content_ok(self):
        # Ideally all files listed in POTFILES.in exist in the source package.
        self.prepare_package("intltool_single_ok")
        self.assertTrue(check_potfiles_in("./po")) 

    def test_check_potfiles_in_content_ok_file_added(self):
        # If a file is not listed in POTFILES.in, the file is still good for
        # our purposes.
        self.prepare_package("intltool_single_ok")
        added_file = file("./src/sourcefile_new.c", "w")
        added_file.write("/* Test file. */")
        added_file.close()
        self.assertTrue(check_potfiles_in("./po")) 

    def test_check_potfiles_in_content_not_ok_file_removed(self):
        # If a file is missing that is listed in POTFILES.in, the file
        # intltool structure is probably broken and cannot be used for
        # our purposes.
        self.prepare_package("intltool_single_ok")
        os.remove("./src/sourcefile1.c")
        self.assertFalse(check_potfiles_in("./po")) 

    def test_check_potfiles_in_wrong_directory(self):
        # Passing in the wrong directory will cause the check to fail
        # gracefully and return False.
        self.prepare_package("intltool_single_ok")
        self.assertFalse(check_potfiles_in("./foo")) 

    def test_find_intltool_dirs(self):
        # Complete run: find all directories with intltool structure.
        self.prepare_package("intltool_full_ok")
        self.assertEqual(
            ["./po-module1", "./po-module2"], find_intltool_dirs())

    def test_find_intltool_dirs_broken(self):
        # Complete run: part of the intltool structure is broken.
        self.prepare_package("intltool_full_ok")
        os.remove("./src/module1/sourcefile1.c")
        self.assertEqual(
            ["./po-module2"], find_intltool_dirs())


class TestIntltoolDomain(TestCase, SetupTestPackageMixin):

    def test_get_translation_domain_makevars(self):
        # Find a translation domain in Makevars.
        self.prepare_package("intltool_domain_makevars")
        self.assertEqual(
            "translationdomain",
            get_translation_domain("po"))

    def test_get_translation_domain_makevars_subst_1(self):
        # Find a translation domain in Makevars, substituted from
        # Makefile.in.in.
        self.prepare_package(
            "intltool_domain_base",
            {
                "po/Makefile.in.in": "PACKAGE=packagename-in-in\n",
                "po/Makevars": "DOMAIN = $(PACKAGE)\n",
            })
        self.assertEqual(
            "packagename-in-in",
            get_translation_domain("po"))

    def test_get_translation_domain_makevars_subst_2(self):
        # Find a translation domain in Makevars, substituted from
        # configure.ac.
        self.prepare_package(
            "intltool_domain_base",
            {
                "configure.ac": "PACKAGE=packagename-ac\n",
                "po/Makefile.in.in": "# No domain here.\n",
                "po/Makevars": "DOMAIN = $(PACKAGE)\n",
            })
        self.assertEqual(
            "packagename-ac",
            get_translation_domain("po"))

    def test_get_translation_domain_makefile_in_in(self):
        # Find a translation domain in Makefile.in.in.
        self.prepare_package("intltool_domain_makefile_in_in")
        self.assertEqual(
            "packagename-in-in",
            get_translation_domain("po"))

    def test_get_translation_domain_configure_ac(self):
        # Find a translation domain in configure.ac.
        self.prepare_package("intltool_domain_configure_ac")
        self.assertEqual(
            "packagename-ac",
            get_translation_domain("po"))

    def prepare_ac_init(self, parameters):
        # Prepare test for various permutations of AC_INIT parameters
        configure_ac_content = dedent("""
            AC_INIT(%s)
            GETTEXT_PACKAGE=AC_PACAKGE_NAME
            """) % parameters
        self.prepare_package(
            "intltool_domain_base",
            {
                "configure.ac": configure_ac_content,
            })

    def test_get_translation_domain_configure_ac_init(self):
        # Find a translation domain in configure.ac in AC_INIT.
        self.prepare_ac_init("packagename-ac-init, 1.0, http://bug.org")
        self.assertEqual(
            "packagename-ac-init",
            get_translation_domain("po"))

    def test_get_translation_domain_configure_ac_init_brackets(self):
        # Find a translation domain in configure.ac in AC_INIT with brackets.
        self.prepare_ac_init("[packagename-ac-init], 1.0, http://bug.org")
        self.assertEqual(
            "packagename-ac-init",
            get_translation_domain("po"))

    def test_get_translation_domain_configure_ac_init_tarname(self):
        # Find a translation domain in configure.ac in AC_INIT tar name
        # parameter.
        self.prepare_ac_init(
            "[Package name], 1.0, http://bug.org, [package-tarname]")
        self.assertEqual(
            "package-tarname",
            get_translation_domain("po"))

    def test_get_translation_domain_configure_ac_init_multiline(self):
        # Find a translation domain in configure.ac in AC_INIT when it
        # spans multiple lines.
        self.prepare_ac_init(
            "[packagename-ac-init],\n    1.0,\n    http://bug.org")
        self.assertEqual(
            "packagename-ac-init",
            get_translation_domain("po"))

    def test_get_translation_domain_configure_ac_init_multiline_tarname(self):
        # Find a translation domain in configure.ac in AC_INIT tar name
        # parameter that is on a different line.
        self.prepare_ac_init(
            "[Package name], 1.0,\n    http://bug.org, [package-tarname]")
        self.assertEqual(
            "package-tarname",
            get_translation_domain("po"))

    def test_get_translation_domain_configure_in(self):
        # Find a translation domain in configure.in.
        self.prepare_package("intltool_domain_configure_in")
        self.assertEqual(
            "packagename-in",
            get_translation_domain("po"))

    def test_get_translation_domain_makefile_in_in_substitute(self):
        # Find a translation domain in Makefile.in.in with substitution from
        # configure.ac.
        self.prepare_package("intltool_domain_makefile_in_in_substitute")
        self.assertEqual(
            "domainname-ac-in-in",
            get_translation_domain("po"))

    def test_get_translation_domain_makefile_in_in_substitute_same_name(self):
        # Find a translation domain in Makefile.in.in with substitution from
        # configure.ac from a variable with the same name as in
        # Makefile.in.in.
        self.prepare_package(
            "intltool_domain_makefile_in_in_substitute_same_name")
        self.assertEqual(
            "packagename-ac-in-in",
            get_translation_domain("po"))

    def test_get_translation_domain_makefile_in_in_substitute_same_file(self):
        # Find a translation domain in Makefile.in.in with substitution from
        # the same file.
        self.prepare_package(
            "intltool_domain_makefile_in_in_substitute_same_file")
        self.assertEqual(
            "domain-in-in-in-in",
            get_translation_domain("po"))

    def test_get_translation_domain_makefile_in_in_substitute_broken(self):
        # Find no translation domain in Makefile.in.in when the substitution
        # cannot be fulfilled.
        self.prepare_package(
            "intltool_domain_makefile_in_in_substitute_broken")
        self.assertIs(None, get_translation_domain("po"))

    def test_get_translation_domain_configure_in_substitute_version(self):
        # Find a translation domain in configure.in with Makefile-style
        # substitution from the same file.
        self.prepare_package(
            "intltool_domain_configure_in_substitute_version")
        self.assertEqual(
            "domainname-in42",
            get_translation_domain("po"))


class TestGenerateTemplates(TestCase, SetupTestPackageMixin):

    def test_generate_pot(self):
        # Generate a given PO template.
        self.prepare_package("intltool_full_ok")
        self.assertTrue(
            generate_pot("./po-module1", "module1"),
            "PO template generation failed.")
        expected_path = "./po-module1/module1.pot"
        self.assertTrue(
            os.access(expected_path, os.F_OK),
            "Generated PO template '%s' not found." % expected_path)

    def test_generate_pot_no_domain(self):
        # Generate a generic PO template.
        self.prepare_package("intltool_full_ok")
        self.assertTrue(
            generate_pot("./po-module1", None),
            "PO template generation failed.")
        expected_path = "./po-module1/messages.pot"
        self.assertTrue(
            os.access(expected_path, os.F_OK),
            "Generated PO template '%s' not found." % expected_path)

    def test_generate_pot_empty_domain(self):
        # Generate a generic PO template.
        self.prepare_package("intltool_full_ok")
        self.assertTrue(
            generate_pot("./po-module1", ""),
            "PO template generation failed.")
        expected_path = "./po-module1/messages.pot"
        self.assertTrue(
            os.access(expected_path, os.F_OK),
            "Generated PO template '%s' not found." % expected_path)

    def test_generate_pot_not_intltool(self):
        # Fail when not an intltool setup.
        self.prepare_package("intltool_full_ok")
        # Cripple the setup.
        os.remove("./po-module1/POTFILES.in")
        self.assertFalse(
            generate_pot("./po-module1", "nothing"),
            "PO template generation should have failed.")
        not_expected_path = "./po-module1/nothing.pot"
        self.assertFalse(
            os.access(not_expected_path, os.F_OK),
            "Not expected PO template '%s' generated." % not_expected_path)

    def test_generate_pots(self):
        # Generate all PO templates in the package.
        self.prepare_package("intltool_full_ok")
        expected_paths = [
            './po-module1/packagename-module1.pot',
            './po-module2/packagename-module2.pot',
            ]
        pots_list = generate_pots()
        self.assertEqual(expected_paths, pots_list)
        for expected_path in expected_paths:
            self.assertTrue(
                os.access(expected_path, os.F_OK),
                "Generated PO template '%s' not found." % expected_path)

    def test_pottery_generate_intltool_script(self):
        # Let the script run to see it works fine.
        self.prepare_package("intltool_full_ok")

        return_code, stdout, stderr = run_script(
            'scripts/rosetta/pottery-generate-intltool.py', [])

        self.assertEqual(dedent("""\
            ./po-module1/packagename-module1.pot
            ./po-module2/packagename-module2.pot
            """), stdout)


class TestDetectIntltoolInBzrTree(TestCase, SetupTestPackageMixin):

    def prepare_tree(self):
        return BzrDir.create_standalone_workingtree(".")

    def test_detect_intltool_structure(self):
        # Detect a simple intltool structure.
        self.prepare_package("intltool_POTFILES_in_1")
        tree = self.prepare_tree()
        self.assertTrue(is_intltool_structure(tree))

    def test_detect_no_intltool_structure(self):
        # If no POTFILES.in exists, no intltool structure is assumed.
        self.prepare_package("intltool_POTFILES_in_1")
        os.remove("./po-intltool/POTFILES.in")
        tree = self.prepare_tree()
        self.assertFalse(is_intltool_structure(tree))

    def test_detect_intltool_structure_module(self):
        # Detect an intltool structure in subdirectories.
        self.prepare_package("intltool_POTFILES_in_2")
        tree = self.prepare_tree()
        self.assertTrue(is_intltool_structure(tree))


class TestConfigFile(TestCase):

    def setUp(self):
        super(TestConfigFile, self).setUp()
        self.configfile = ConfigFile(StringIO(dedent("""\
            # Demo config file
            CCC
            AAA=
            FUNC_1(param1)
            BBB = 
            FUNC_2(param1, param2,param3 )
            CCC = ccc # comment
            ML_FUNC_1(param1,
                param2, param3)
            DDD=dd.d
            ML_FUNC_2(
            param1,
            param2)
            EEE 
            = eee
            """)))

    def test_getVariable_exists(self):
        self.assertEqual('dd.d', self.configfile.getVariable('DDD'))

    def test_getVariable_exists_spaces_comment(self):
        self.assertEqual('ccc', self.configfile.getVariable('CCC'))

    def test_getVariable_empty(self):
        self.assertEqual('', self.configfile.getVariable('AAA'))

    def test_getVariable_empty_spaces(self):
        self.assertEqual('', self.configfile.getVariable('BBB'))

    def test_getVariable_nonexistent(self):
        self.assertIs(None, self.configfile.getVariable('FFF'))

    def test_getVariable_broken(self):
        self.assertIs(None, self.configfile.getVariable('EEE'))

    def test_getFunctionParams_single(self):
        self.assertEqual(
            ['param1'], self.configfile.getFunctionParams('FUNC_1'))

    def test_getFunctionParams_multiple(self):
        self.assertEqual(
            ['param1', 'param2', 'param3'],
            self.configfile.getFunctionParams('FUNC_2'))

    def test_getFunctionParams_multiline_indented(self):
        self.assertEqual(
            ['param1', 'param2', 'param3'],
            self.configfile.getFunctionParams('ML_FUNC_1'))

    def test_getFunctionParams_multiline_not_indented(self):
        self.assertEqual(
            ['param1', 'param2'],
            self.configfile.getFunctionParams('ML_FUNC_2'))


def test_suite():
    return unittest.TestLoader().loadTestsFromName(__name__)

