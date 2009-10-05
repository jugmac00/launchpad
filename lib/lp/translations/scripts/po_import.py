# Copyright 2009 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""Functions used with the Rosetta PO import script."""

__metaclass__ = type


__all__ = [
    'ImportProcess',
    ]

from datetime import datetime, timedelta
import sys

from pytz import UTC
from zope.component import getUtility

from canonical.config import config
from canonical.launchpad import helpers
from canonical.launchpad.interfaces.launchpad import ILaunchpadCelebrities
from lp.translations.interfaces.translationimportqueue import (
    ITranslationImportQueue, RosettaImportStatus)
from canonical.launchpad.mail import simple_sendmail
from canonical.launchpad.mailnotification import MailWrapper
from canonical.launchpad.webapp import errorlog
from lp.services.scripts.base import LaunchpadCronScript


class TranslationsImport(LaunchpadCronScript):
    """Import .po and .pot files attached to Rosetta."""
    # Time goal for one run.  It is not exact.  The script can run for
    # longer than this, but will know to stop taking on new work.
    # Since the script is run every 9 or 10 minutes, we set the goal
    # at 8 minutes.  That leaves a bit of time to complete the last
    # ongoing batch of imports.
    time_to_run = timedelta(minutes=8)

    # Failures to be reported in bulk at closing, so we don't accumulate
    # thousands of oopses for repetitive errors.
    failures = None

    def __init__(self, *args, **kwargs):
        super(TranslationsImport, self).__init__(*args, **kwargs)
        self.failures = {}

    def _describeEntry(self, entry):
        """Identify `entry` in a human-readable way."""
        if entry.import_into:
            return "%s (id %d)" % (entry.import_into.title, entry.id)

        if entry.sourcepackagename:
            return "'%s' (id %d) in %s %s package %s" % (
                entry.path, entry.id,
                entry.distroseries.distribution.name,
                entry.distroseries.displayname,
                entry.sourcepackagename.name)
        else:
            return "'%s' (id %d) in %s" % (
                entry.path, entry.id, entry.productseries.title)

    def _reportOops(self, reason, entries, exc_info=None):
        """Register an oops."""
        if exc_info is None:
            exc_info = sys.exc_info()
        description = [
            ('Reason', reason),
            ('Queue entries', entries),
            ]
        errorlog.globalErrorUtility.raising(
            exc_info, errorlog.ScriptRequest(description))

    def _registerFailure(self, entry, reason, traceback=False, abort=False):
        """Note that a queue entry is unusable in some way."""
        entry.setStatus(RosettaImportStatus.FAILED)
        entry.setErrorOutput(reason)

        if abort:
            traceback = True

        description = self._describeEntry(entry)
        message = "%s -- %s" % (reason, description)
        self.logger.error(message, exc_info=traceback)

        if abort:
            # Serious enough to stop the script.  Register as an
            # individual oops.
            self._reportOops(self, reason, [description])
        else:
            # Register problem for bulk reporting later.
            if not self.failures.get(reason):
                self.failures[reason] = []
            self.failures[reason].append(description)

    def _checkEntry(self, entry):
        """Sanity-check `entry` before importing."""
        if entry.import_into is None:
            self._registerFailure(
                entry, "Entry is approved but has no place to import to.")
            return False

        template = entry.potemplate
        if template:
            if template.distroseries != entry.distroseries:
                self._registerFailure(
                    entry, "Entry was approved for the wrong distroseries.")
                return False
            if template.productseries != entry.productseries:
                self._registerFailure(
                    entry, "Entry was approved for the wrong productseries.")
                return False

        return True

    def _importEntry(self, entry):
        """Perform the import of one entry, and notify the uploader."""
        self.logger.info('Importing: %s' % entry.import_into.title)
        target = entry.import_into
        (mail_subject, mail_body) = target.importFromQueue(entry, self.logger)

        if mail_subject is not None:
            # A `mail_subject` of None indicates that there
            # is no notification worth sending out.
            from_email = config.rosetta.admin_email
            katie = getUtility(ILaunchpadCelebrities).katie
            if entry.importer == katie:
                # Email import state to Debian imports email.
                to_email = config.rosetta.debian_import_email
            else:
                to_email = helpers.get_contact_email_addresses(entry.importer)

            if to_email:
                text = MailWrapper().format(mail_body)
                simple_sendmail(from_email, to_email, mail_subject, text)

    def main(self):
        """Import entries from the queue."""
        self.logger.debug("Starting the import process.")

        errorlog.globalErrorUtility.configure('poimport')
        self.deadline = datetime.now(UTC) + self.time_to_run
        translation_import_queue = getUtility(ITranslationImportQueue)

        # Get the list of each product or distroseries with pending imports.
        # We'll serve these queues in turn, one request each, until either the
        # queue is drained or our time is up.
        importqueues = translation_import_queue.getRequestTargets(
            RosettaImportStatus.APPROVED)

        if not importqueues:
            self.logger.info("No requests pending.")
            return

        have_work = True

        while have_work and datetime.now(UTC) < self.deadline:
            have_work = False

            # For fairness, service all queues at least once; don't
            # check for deadlines here or we'd favour some
            # products/packages over others.
            for queue in importqueues:
                entry = queue.getFirstEntryToImport()
                if entry is None:
                    continue

                have_work = True

                try:
                    if self._checkEntry(entry):
                        self._importEntry(entry)
                    if self.txn:
                        self.txn.commit()
                except KeyboardInterrupt:
                    raise
                except (AssertionError, SystemError), e:
                    self._registerFailure(entry, e, abort=True)
                    raise
                except Exception, e:
                    if self.txn:
                        self.txn.abort()
                    self._registerFailure(entry, e, traceback=True)
                    if self.txn:
                        self.txn.commit()

        if have_work:
            self.logger.info("Used up available time.")
        else:
            self.logger.info("Import requests completed.")

        self._reportFailures()

        self.logger.debug("Finished the import process.")

    def _reportFailures(self):
        """Bulk-report deferred failures as oopses."""
        for reason, entries in self.failures.iteritems():
            self._reportOops(reason, entries)
