# Copyright 2004 Canonical Ltd.  All rights reserved.
#
# arch-tag: 6f729cad-ca7b-4d66-8008-617457ac9ca1

__metaclass__ = type

import unittest

from zope.component import getService, servicenames
from zope.component.tests.placelesssetup import PlacelessSetup
from canonical.arch.sqlbase import SQLBase
from canonical.rosetta.interfaces import ILanguages
from canonical.rosetta.sql import RosettaPerson, RosettaPOTemplate, \
    RosettaProject, RosettaProduct, RosettaLanguages
from canonical.rosetta.poexport import POExport
from sqlobject import connectionForURI


class POExportTestCase(PlacelessSetup, unittest.TestCase):

    def setUp(self):
        super(POExportTestCase, self).setUp()
#        utilityService = getService(servicenames.Utilities)
#        utilityService.provideUtility(ILanguages, RosettaLanguages(), '')
        SQLBase.initZopeless(connectionForURI('postgres:///launchpad_test'))

    def testPoExportAdapter(self):
        project = RosettaProject.selectBy(name = 'gnome')[0]
        #print project, type(project)
        product = RosettaProduct.selectBy(projectID = project.id, name = 'evolution')[0]
        poTemplate = RosettaPOTemplate.selectBy(productID = product.id, name='evolution-1.5.90')[0]
        export = POExport(poTemplate)
        dump = export.export('cy')
        self.assertEqual(dump, '''# SOME DESCRIPTIVE TITLE.
# Copyright (C) YEAR THE PACKAGE'S COPYRIGHT HOLDER
# This file is distributed under the same license as the PACKAGE package.
#, fuzzy
msgid ""
msgstr ""
"Project-Id-Version: PACKAGE VERSION\\n"
"Report-Msgid-Bugs-To: \\n"
"POT-Creation-Date: 2004-07-18 23:00+0200\\n"
"PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE\\n"
"Last-Translator: FULL NAME <EMAIL@ADDRESS>\\n"
"Language-Team: LANGUAGE <LL@li.org>\\n"
"MIME-Version: 1.0\\n"
"Content-Type: text/plain; charset=UTF-8\\n"
"Content-Transfer-Encoding: 8bit\\n"

#: some/file.c:498
#, fuzzy, c-string
msgid "I am the text of POTSighting 1"
msgid_plural "And I'm a plural form 1"
msgstr[0] "I am a translation text in Welsh"
msgstr[1] "I am a translation text for a plural form in Welsh"

#: some/file.c:498
#, fuzzy, c-string
msgid "I am the text of POTSighting 2"
msgid_plural "And I'm a plural form 2"
msgstr[0] "I am a translation text in Welsh"
msgstr[1] "I am a translation text for a plural form in Welsh"

#: some/file.c:498
#, fuzzy, c-string
msgid "I am the text of POTSighting 3"
msgid_plural "And I'm a plural form 3"
msgstr[0] "I am a translation text in Welsh"
msgstr[1] "I am a translation text for a plural form in Welsh"

#: some/file.c:498
#, fuzzy, c-string
msgid "I am the text of POTSighting 4"
msgid_plural "And I'm a plural form 4"
msgstr[0] "I am a translation text in Welsh"
msgstr[1] "I am a translation text for a plural form in Welsh"

#: some/file.c:498
#, fuzzy, c-string
msgid "I am the text of POTSighting 5"
msgid_plural "And I'm a plural form 5"
msgstr[0] "I am a translation text in Welsh"
msgstr[1] "I am a translation text for a plural form in Welsh"
''')

def test_suite():
    loader = unittest.TestLoader()
    return loader.loadTestsFromTestCase(POExportTestCase)

if __name__ == '__main__':
    unittest.main()
