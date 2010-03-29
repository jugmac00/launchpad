# Copyright 2010 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""Test the SIGDUMPMEM signal handler."""

__metaclass__ = type

import os
import time

from canonical.lazr.pidfile import get_pid

from canonical.config import config
from canonical.launchpad.webapp.sigdumpmem import (
    DUMP_FILE, SIGDUMPMEM)
from canonical.testing.layers import AppServerLayer
from lp.testing import TestCase


class SIGDUMPMEMTestCase(TestCase):
    layer = AppServerLayer

    def test_sigdumpmem(self):
        # Remove the dump file, if one exists.
        if os.path.exists(DUMP_FILE):
            os.unlink(DUMP_FILE)
        self.assertFalse(os.path.exists(DUMP_FILE))

        # Get the pid for the process spawned by the AppServerLayer, which is
        # the one we'll be sending the signal to.
        orig_instance_name = config.instance_name
        config.setInstance('testrunner-appserver')
        pid = get_pid('launchpad')
        config.setInstance(orig_instance_name)

        # Send the signal and ensure the dump file is created.
        os.kill(pid, SIGDUMPMEM)
        timeout = 10
        start_time = time.time()
        while time.time() < start_time + timeout:
            if os.path.exists(DUMP_FILE):
                break
        self.assertTrue(os.path.exists(DUMP_FILE))
