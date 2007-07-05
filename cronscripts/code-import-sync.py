#!/usr/bin/python2.4
# Copyright 2007 Canonical Ltd.  All rights reserved.

"""Populate and update the CodeImport table from ProductSeries."""

__metaclass__ = type

import _pythonpath

from canonical.launchpad.scripts.base import LaunchpadCronScript
from canonical.launchpad.scripts.importd.code_import_sync import (
    CodeImportSync)


class SyncCodeImports(LaunchpadCronScript):

    def main(self):
        CodeImportSync(self.logger, self.txn).runAndCommit()


if __name__ == '__main__':
    script = SyncCodeImports("code-import-sync")
    script.lock_and_run()
