#!/usr/bin/python2.4
#
# Copyright 2009 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

# pylint: disable-msg=C0103,W0403

"""Refresh and verify cached POFile translation statistics."""

import _pythonpath

from lp.services.scripts.base import LaunchpadCronScript
from lp.translations.scripts.verify_pofile_stats import (
    VerifyPOFileStatsProcess)


class VerifyPOFileStats(LaunchpadCronScript):
    """Trawl `POFile` table, verifying and updating cached statistics."""

    def main(self):
        VerifyPOFileStatsProcess(self.txn, self.logger).run()


if __name__ == '__main__':
    script = VerifyPOFileStats(name="pofile-stats", dbuser='pofilestats')
    script.lock_and_run()

