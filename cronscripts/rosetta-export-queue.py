#!/usr/bin/python
# Copyright 2005 Canonical Ltd. All rights reserved.

import _pythonpath

from canonical.lp import READ_COMMITTED_ISOLATION
from canonical.launchpad.scripts.po_export_queue import process_queue
from canonical.launchpad.scripts.base import LaunchpadScript


class RosettaExportQueue(LaunchpadScript):
    def main(self):
        self.txn.set_isolation_level(READ_COMMITTED_ISOLATION)
        process_queue(self.txn, self.logger)


if __name__ == '__main__':
    script = RosettaExportQueue('rosetta-export-queue', dbuser='poexport')
    script.lock_and_run()

