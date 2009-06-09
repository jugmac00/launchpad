# Copyright 2008 Canonical Ltd.  All rights reserved.

"""Test mailing list stuff."""

__metaclass__ = type


import os
import sys
import errno
import tempfile
import unittest

# Don't use cStringIO in case Unicode leaks through.
from StringIO import StringIO
from subprocess import Popen, PIPE, STDOUT

import transaction

from canonical.launchpad.ftests import login
from canonical.launchpad.interfaces.emailaddress import EmailAddressStatus
from canonical.launchpad.scripts import FakeLogger
from canonical.launchpad.scripts.mlistimport import Importer
from lp.testing.factory import LaunchpadObjectFactory
from canonical.testing.layers import (
    AppServerLayer, DatabaseFunctionalLayer, LayerProcessController)


factory = LaunchpadObjectFactory()

class CapturingLogger(FakeLogger):
    def __init__(self):
        self.io = StringIO()

    def message(self, prefix, *stuff, **kws):
        # XXX BarryWarsaw 25-Nov-2008 (bug=302183). FakeLogger is broken.
        fmt = stuff[0]
        print >> self.io, prefix, fmt % stuff[1:]


class BaseMailingListImportTest(unittest.TestCase):
    """Common base class for mailing list import tests."""

    def setUp(self):
        # Create a team and a mailing list for the team to test.
        login('foo.bar@canonical.com')
        self.anne = factory.makePersonByName('Anne')
        self.bart = factory.makePersonByName('Bart')
        self.cris = factory.makePersonByName('Cris')
        self.dave = factory.makePersonByName('Dave')
        self.elly = factory.makePersonByName('Elly')
        self.teamowner = factory.makePersonByName('Teamowner')
        self.team, self.mailing_list = factory.makeTeamAndMailingList(
            'aardvarks', 'teamowner')
        # A temporary filename for some of the tests.
        fd, self.filename = tempfile.mkstemp()
        os.close(fd)
        # A capturing logger.
        self.logger = CapturingLogger()

    def tearDown(self):
        try:
            os.remove(self.filename)
        except OSError, error:
            if error.errno != errno.ENOENT:
                raise

    def writeFile(self, *addresses):
        # Write the addresses to import to our open temporary file.
        out_file = open(self.filename, 'w')
        try:
            for address in addresses:
                print >> out_file, address
        finally:
            out_file.close()

    def assertPeople(self, *people):
        """Assert that `people` are members of the team."""
        members = set(person.name for person in self.team.allmembers)
        expected = set(people)
        # Always add the team owner.
        expected.add(u'teamowner')
        self.assertEqual(members, expected)

    def assertAddresses(self, *addresses):
        """Assert that `addresses` are subscribed to the mailing list."""
        subscribers = set(
            email.email
            for email in self.mailing_list.getSubscribedAddresses())
        expected = set(addresses)
        self.assertEqual(subscribers, expected)


class TestMailingListImports(BaseMailingListImportTest):
    """Test mailing list imports."""

    layer = DatabaseFunctionalLayer

    def test_simple_import_membership(self):
        # Test the import of a list/team membership, where all email
        # addresses being imported actually exist in Launchpad.
        importer = Importer('aardvarks')
        importer.importAddresses((
            'anne.person@example.com',
            'bperson@example.org',
            'cris.person@example.com',
            'dperson@example.org',
            'elly.person@example.com',
            ))
        self.assertPeople(u'anne', u'bart', u'cris', u'dave', u'elly')
        self.assertAddresses(
            u'anne.person@example.com', u'bperson@example.org',
            u'cris.person@example.com', u'dperson@example.org',
            u'elly.person@example.com')

    def test_extended_import_membership(self):
        # Test the import of a list/team membership, where all email
        # addresses being imported actually exist in Launchpad.
        importer = Importer('aardvarks')
        importer.importAddresses((
            'anne.person@example.com (Anne Person)',
            'Bart Q. Person <bperson@example.org>',
            'cris.person@example.com',
            'dperson@example.org',
            'elly.person@example.com (Elly Q. Person)',
            ))
        self.assertPeople(u'anne', u'bart', u'cris', u'dave', u'elly',)
        self.assertAddresses(
            u'anne.person@example.com', u'bperson@example.org',
            u'cris.person@example.com', u'dperson@example.org',
            u'elly.person@example.com')

    def test_import_with_non_persons(self):
        # Test the import of a list/team membership where not all the
        # email addresses are associated with registered people.
        importer = Importer('aardvarks')
        importer.importAddresses((
            'anne.person@example.com',
            'bperson@example.org',
            'cris.person@example.com',
            'dperson@example.org',
            'elly.person@example.com',
            # Non-persons.
            'fperson@example.org',
            'gwen.person@example.com',
            'hperson@example.org',
            ))
        self.assertPeople(u'anne', u'bart', u'cris', u'dave', u'elly')
        self.assertAddresses(
            u'anne.person@example.com', u'bperson@example.org',
            u'cris.person@example.com', u'dperson@example.org',
            u'elly.person@example.com')

    def test_import_with_invalid_emails(self):
        # Test the import of a list/team membership where all the
        # emails are associated with valid people, but not all of the
        # email addresses are validated.
        importer = Importer('aardvarks')
        # Give Anne a new invalid email address.
        factory.makeEmail('anne.x.person@example.net', self.anne,
                          email_status=EmailAddressStatus.NEW)
        importer.importAddresses((
            # Import Anne's alternative address.
            'anne.x.person@example.net',
            'bperson@example.org',
            'cris.person@example.com',
            'dperson@example.org',
            'elly.person@example.com',
            ))
        self.assertPeople(u'bart', u'cris', u'dave', u'elly')
        self.assertAddresses(
            u'bperson@example.org', u'cris.person@example.com',
            u'dperson@example.org', u'elly.person@example.com')

    def test_already_joined(self):
        # Test import when a user is already joined to the team, but
        # not subscribed to the mailing list.
        importer = Importer('aardvarks')
        self.anne.join(self.team)
        importer.importAddresses((
            'anne.person@example.com',
            'bperson@example.org',
            'cris.person@example.com',
            'dperson@example.org',
            'elly.person@example.com',
            ))
        self.assertPeople(u'anne', u'bart', u'cris', u'dave', u'elly')
        self.assertAddresses(
            u'anne.person@example.com', u'bperson@example.org',
            u'cris.person@example.com', u'dperson@example.org',
            u'elly.person@example.com')

    def test_already_subscribed(self):
        # Test import when a user is already joined to the team, and
        # subscribed to its mailing list.
        importer = Importer('aardvarks')
        self.anne.join(self.team)
        self.mailing_list.subscribe(self.anne)
        importer.importAddresses((
            'anne.person@example.com',
            'bperson@example.org',
            'cris.person@example.com',
            'dperson@example.org',
            'elly.person@example.com',
            ))
        self.assertPeople(u'anne', u'bart', u'cris', u'dave', u'elly')
        self.assertAddresses(
            u'anne.person@example.com', u'bperson@example.org',
            u'cris.person@example.com', u'dperson@example.org',
            u'elly.person@example.com')

    def test_import_from_file(self):
        # Test importing addresses from a file.
        importer = Importer('aardvarks')
        self.writeFile(
            'Anne Person <anne.person@example.com>',
            'bart.person@example.com (Bart Q. Person)',
            'cperson@example.org',
            'dperson@example.org (Dave Person)',
            'Elly Q. Person <eperson@example.org',
            )
        importer.importFromFile(self.filename)
        self.assertPeople(u'anne', u'bart', u'cris', u'dave', u'elly')
        self.assertAddresses(
            u'anne.person@example.com', u'bart.person@example.com',
            u'cperson@example.org', u'dperson@example.org',
            u'eperson@example.org')

    def test_import_from_file_with_non_persons(self):
        # Test the import of a list/team membership from a file where
        # not all the email addresses are associated with registered
        # people.
        importer = Importer('aardvarks')
        self.writeFile(
            'Anne Person <anne.person@example.com>',
            'bart.person@example.com (Bart Q. Person)',
            'cperson@example.org',
            'dperson@example.org (Dave Person)',
            'Elly Q. Person <eperson@example.org',
            # Non-persons.
            'fperson@example.org (Fred Q. Person)',
            'Gwen Person <gwen.person@example.com>',
            'hperson@example.org',
            'iris.person@example.com',
            )
        importer.importFromFile(self.filename)
        self.assertPeople(u'anne', u'bart', u'cris', u'dave', u'elly')
        self.assertAddresses(
            u'anne.person@example.com', u'bart.person@example.com',
            u'cperson@example.org', u'dperson@example.org',
            u'eperson@example.org')

    def test_import_from_file_with_invalid_emails(self):
        # Test importing addresses from a file with invalid emails.
        importer = Importer('aardvarks')
        # Give Anne a new invalid email address.
        factory.makeEmail('anne.x.person@example.net', self.anne,
                          email_status=EmailAddressStatus.NEW)
        self.writeFile(
            'Anne Person <anne.x.person@example.net>',
            'bart.person@example.com (Bart Q. Person)',
            'cperson@example.org',
            'dperson@example.org (Dave Person)',
            'Elly Q. Person <eperson@example.org',
            )
        importer.importFromFile(self.filename)
        self.assertPeople(u'bart', u'cris', u'dave', u'elly')
        self.assertAddresses(
            u'bart.person@example.com', u'cperson@example.org',
            u'dperson@example.org', u'eperson@example.org')

    def test_logging(self):
        # Test that nothing gets logged when all imports are fine.
        importer = Importer('aardvarks')
        importer.importAddresses((
            'anne.person@example.com',
            'bperson@example.org',
            'cris.person@example.com',
            'dperson@example.org',
            'elly.person@example.com',
            ))
        self.assertEqual(self.logger.io.getvalue(), '')

    def test_logging_extended(self):
        # Test that nothing gets logged when all imports are fine.
        importer = Importer('aardvarks', self.logger)
        importer.importAddresses((
            'anne.person@example.com (Anne Person)',
            'Bart Q. Person <bperson@example.org>',
            'cris.person@example.com',
            'dperson@example.org',
            'elly.person@example.com (Elly Q. Person)',
            ))
        self.assertEqual(
            self.logger.io.getvalue(),
            'INFO anne.person@example.com (anne) joined and subscribed\n'
            'INFO bperson@example.org (bart) joined and subscribed\n'
            'INFO cris.person@example.com (cris) joined and subscribed\n'
            'INFO dperson@example.org (dave) joined and subscribed\n'
            'INFO elly.person@example.com (elly) joined and subscribed\n')

    def test_logging_with_non_persons(self):
        # Test that non-persons that were not imported are logged.
        importer = Importer('aardvarks', self.logger)
        importer.importAddresses((
            'anne.person@example.com',
            'bperson@example.org',
            'cris.person@example.com',
            'dperson@example.org',
            'elly.person@example.com',
            # Non-persons.
            'fperson@example.org',
            'gwen.person@example.com',
            'hperson@example.org',
            ))
        self.assertEqual(
            self.logger.io.getvalue(),
            'INFO anne.person@example.com (anne) joined and subscribed\n'
            'INFO bperson@example.org (bart) joined and subscribed\n'
            'INFO cris.person@example.com (cris) joined and subscribed\n'
            'INFO dperson@example.org (dave) joined and subscribed\n'
            'INFO elly.person@example.com (elly) joined and subscribed\n'
            'ERROR No person for address: fperson@example.org\n'
            'ERROR No person for address: gwen.person@example.com\n'
            'ERROR No person for address: hperson@example.org\n')

    def test_logging_with_invalid_emails(self):
        # Test that invalid emails that were not imported are logged.
        importer = Importer('aardvarks', self.logger)
        # Give Anne a new invalid email address.
        factory.makeEmail('anne.x.person@example.net', self.anne,
                          email_status=EmailAddressStatus.NEW)
        importer.importAddresses((
            # Import Anne's alternative address.
            'anne.x.person@example.net',
            'bperson@example.org',
            'cris.person@example.com',
            'dperson@example.org',
            'elly.person@example.com',
            ))
        self.assertEqual(
            self.logger.io.getvalue(),
            'ERROR No valid email for address: anne.x.person@example.net\n'
            'INFO bperson@example.org (bart) joined and subscribed\n'
            'INFO cris.person@example.com (cris) joined and subscribed\n'
            'INFO dperson@example.org (dave) joined and subscribed\n'
            'INFO elly.person@example.com (elly) joined and subscribed\n')

    def test_import_existing_with_nonascii_name(self):
        # Make sure that a person with a non-ascii name, who's already a
        # member of the list, gets a proper log message.
        self.anne.displayname = u'\u1ea2nn\u1ebf P\u1ec5rs\u1ed1n'
        importer = Importer('aardvarks', self.logger)
        self.anne.join(self.team)
        self.mailing_list.subscribe(self.anne)
        importer.importAddresses((
            'anne.person@example.com',
            'bperson@example.org',
            ))
        self.assertEqual(
            self.logger.io.getvalue(),
            'ERROR \xe1\xba\xa2nn\xe1\xba\xbf '
            'P\xe1\xbb\x85rs\xe1\xbb\x91n is already subscribed '
            'to list Aardvarks\n'
            'INFO anne.person@example.com (anne) joined and subscribed\n'
            'INFO bperson@example.org (bart) joined and subscribed\n')


class TestMailingListImportScript(BaseMailingListImportTest):
    """Test end-to-end `mlist-import.py` script."""

    layer = AppServerLayer

    def setUp(self):
        super(TestMailingListImportScript, self).setUp()
        # Since these tests involve two processes, the setup transaction must
        # be committed, otherwise the script won't see the changes.
        transaction.commit()
        # Make sure the mailbox is empty.
        LayerProcessController.smtp_controller.reset()

    def makeProcess(self, *extra_args):
        args = ['scripts/mlist-import.py', '--filename', self.filename]
        args.extend(extra_args)
        args.append(self.team.name)
        return Popen(args, stdout=PIPE, stderr=STDOUT,
                     cwd=LayerProcessController.appserver_config.root,
                     env=dict(LPCONFIG='testrunner-appserver',
                              PYTHONPATH=os.pathsep.join(sys.path)))

    def test_import(self):
        # Test that a simple invocation of the script works.
        # Use various combinations of formats supported by parseaddr().
        self.writeFile(
            'Anne Person <anne.person@example.com>',
            'bart.person@example.com (Bart Q. Person)',
            'cperson@example.org',
            'dperson@example.org (Dave Person)',
            'Elly Q. Person <eperson@example.org',
            )
        # Create the subprocess and invoke the script.
        process = self.makeProcess()
        stdout, stderr = process.communicate()
        self.assertEqual(process.returncode, 0, stdout)
        # Make sure we hit the database.
        transaction.abort()
        self.assertPeople(u'anne', u'bart', u'cris', u'dave', u'elly')
        self.assertAddresses(
            u'anne.person@example.com', u'bart.person@example.com',
            u'cperson@example.org', u'dperson@example.org',
            u'eperson@example.org')

    def test_notification_suppression(self):
        # Test that importing some addresses produces no notifications, which
        # happens by default.
        self.writeFile(
            'Anne Person <anne.person@example.com>',
            'bart.person@example.com (Bart Q. Person)',
            'cperson@example.org',
            'dperson@example.org (Dave Person)',
            'Elly Q. Person <eperson@example.org',
            )
        process = self.makeProcess()
        stdout, stderr = process.communicate()
        self.assertEqual(process.returncode, 0, stdout)
        # There should be no messages sitting in the smtp controller, because
        # all notifications were suppressed.
        messages = LayerProcessController.smtp_controller.getMessages()
        self.assertEqual(len(messages), 0)

    def test_notifications(self):
        # Test that importing some addresses the expected notifications when
        # the proper command line option is given.  Each new member and the
        # team owners should get a notification for every join.
        self.writeFile(
            'Anne Person <anne.person@example.com>',
            'bart.person@example.com (Bart Q. Person)',
            'cperson@example.org',
            'dperson@example.org (Dave Person)',
            'Elly Q. Person <eperson@example.org',
            )
        process = self.makeProcess('--notifications')
        stdout, stderr = process.communicate()
        self.assertEqual(process.returncode, 0, stdout)
        # There should be five messages sitting in the smtp controller, one
        # for each added new member, all sent to the team owner.
        messages = LayerProcessController.smtp_controller.getMessages()
        self.assertEqual(len(messages), 5)
        # The messages are all being sent to the team owner.
        recipients = set(message['to'] for message in messages)
        self.assertEqual(len(recipients), 1)
        self.assertEqual(recipients.pop(), 'teamowner.person@example.com')
        # The Subjects of all the messages indicate who was joined as a member
        # of the team.
        subjects = sorted(message['subject'] for message in messages)
        self.assertEqual(subjects, [
            'anne joined aardvarks',
            'bart joined aardvarks',
            'cris joined aardvarks',
            'dave joined aardvarks',
            'elly joined aardvarks',
            ])


def test_suite():
    return unittest.TestLoader().loadTestsFromName(__name__)
