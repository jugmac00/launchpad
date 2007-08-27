# Copyright 2007 Canonical Ltd.  All rights reserved.
"""Mozilla XPI importer tests."""

__metaclass__ = type

import unittest
import transaction
from zope.component import getUtility
from zope.interface.verify import verifyObject

from canonical.launchpad.translationformat.tests.test_xpi_import import (
    get_en_US_xpi_file_to_import)
from canonical.launchpad.translationformat.mozilla_xpi_importer import (
    MozillaXpiImporter)
from canonical.launchpad.interfaces import (
    IPersonSet, IProductSet, ITranslationFormatImporter,
    ITranslationImportQueue)
from canonical.lp.dbschema import TranslationFileFormat
from canonical.testing import LaunchpadZopelessLayer


class MozillaXpiImporterTestCase(unittest.TestCase):
    """Class test for mozilla's .xpi file imports"""

    layer = LaunchpadZopelessLayer

    def setUp(self):
        # Add a new entry for testing purposes. It's a template one.
        self.translation_import_queue = getUtility(ITranslationImportQueue)
        template_path = 'en_US.xpi'
        is_published = True
        personset = getUtility(IPersonSet)
        importer = personset.getByName('carlos')
        productset = getUtility(IProductSet)
        firefox = productset.getByName('firefox')
        trunk_series = firefox.getSeries('trunk')
        template_entry = self.translation_import_queue.addOrUpdateEntry(
            template_path, get_en_US_xpi_file_to_import().read(), is_published,
            importer, productseries=trunk_series)

        # Add another one, a translation file.
        translation_path = 'es_ES.xpi'
        translation_entry = self.translation_import_queue.addOrUpdateEntry(
            translation_path, get_en_US_xpi_file_to_import().read(), is_published,
            importer, productseries=trunk_series)

        # We need to get back the librarian entry and thus, we need to do a
        # commit first.
        transaction.commit()
        self.template_importer = MozillaXpiImporter()
        self.template_importer.parse(template_entry)
        self.translation_importer = MozillaXpiImporter()
        self.translation_importer.parse(translation_entry)

    def testInterface(self):
        """Check whether the object follows the interface."""
        self.failUnless(
            verifyObject(ITranslationFormatImporter, self.template_importer))

    def testFormat(self):
        """Check that MozillaXpiImporter handles the XPI file format."""
        format = self.template_importer.format('')
        self.failUnless(
            format == TranslationFileFormat.XPI,
            'MozillaXpiImporter format expected XPI but got %s' % format.name)

    def testGetLastTranslator(self):
        """Tests whether we extract last translator information correctly."""
        # Let's try with the translation file, it has valid Last Translator
        # information.
        name, email = self.template_importer.getLastTranslator()
        self.assertEqual(name, u'Carlos Perell\xf3 Mar\xedn')
        self.assertEqual(email, u'carlos@canonical.com')

    def testHasAlternativeMsgID(self):
        """Check that MozillaXpiImporter has an alternative msgid."""
        self.failUnless(
            self.template_importer.has_alternative_msgid,
            "MozillaXpiImporter format says it's not using alternative msgid"
            " when it really does!")


def test_suite():
    return unittest.defaultTestLoader.loadTestsFromName(__name__)
