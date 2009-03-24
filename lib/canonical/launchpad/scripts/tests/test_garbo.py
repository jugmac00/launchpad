# Copyright 2009 Canonical Ltd.  All rights reserved.

"""Test the database garbage collector."""

__metaclass__ = type
__all__ = []

from datetime import datetime, timedelta
import unittest

from pytz import UTC
import transaction

from canonical.launchpad.database import OAuthNonce
from canonical.launchpad.interfaces import IMasterStore
from canonical.launchpad.testing import TestCase
from canonical.launchpad.scripts.garbo import (
    DailyDatabaseGarbageCollector, HourlyDatabaseGarbageCollector)
from canonical.launchpad.scripts.tests import run_script
from canonical.launchpad.scripts.logger import QuietFakeLogger
from canonical.testing.layers import (
    DatabaseLayer, LaunchpadScriptLayer, LaunchpadZopelessLayer)

class TestGarboScript(TestCase):
    layer = LaunchpadScriptLayer

    def test_daily_script(self):
        """Ensure garbo-daily.py actually runs."""
        rv, out, err = run_script(
            "cronscripts/garbo-daily.py", ["-q"], expect_returncode=0)
        self.failIf(out.strip(), "Output to stdout: %s" % out)
        self.failIf(err.strip(), "Output to stderr: %s" % err)
        DatabaseLayer.force_dirty_database()

    def test_hourly_script(self):
        """Ensure garbo-hourly.py actually runs."""
        rv, out, err = run_script(
            "cronscripts/garbo-hourly.py", ["-q"], expect_returncode=0)
        self.failIf(out.strip(), "Output to stdout: %s" % out)
        self.failIf(err.strip(), "Output to stderr: %s" % err)


class TestGarbo(TestCase):
    layer = LaunchpadZopelessLayer

    def setUp(self):
        super(TestGarbo, self).setUp()
        # Run the garbage collectors to remove any existing garbage,
        # starting us in a known state.
        self.runDaily()
        self.runHourly()

    def runDaily(self):
        LaunchpadZopelessLayer.switchDbUser('garbo-daily')
        collector = DailyDatabaseGarbageCollector(test_args=[])
        collector.logger = QuietFakeLogger()
        collector.main()

    def runHourly(self):
        LaunchpadZopelessLayer.switchDbUser('garbo-hourly')
        collector = HourlyDatabaseGarbageCollector(test_args=[])
        collector.logger = QuietFakeLogger()
        collector.main()

    def test_OAuthNoncePruner(self):
        now = datetime.utcnow().replace(tzinfo=UTC)
        timestamps = [
            now - timedelta(days=2), # Garbage
            now - timedelta(days=1) - timedelta(seconds=60), # Garbage
            now - timedelta(days=1) + timedelta(seconds=60), # Not garbage
            now, # Not garbage
            ]
        LaunchpadZopelessLayer.switchDbUser('testadmin')

        # Make sure we start with 0 nonces.
        self.failUnlessEqual(
            0, IMasterStore(OAuthNonce).find(OAuthNonce).count())

        for timestamp in timestamps:
            OAuthNonce(
                access_tokenID=1,
                request_timestamp = timestamp,
                nonce = str(timestamp))
        transaction.commit()

        # Make sure we have 4 nonces now.
        self.failUnlessEqual(
            4, IMasterStore(OAuthNonce).find(OAuthNonce).count())

        self.runHourly()

        # Now back to two, having removed the two garbage entries.
        self.failUnlessEqual(
            2, IMasterStore(OAuthNonce).find(OAuthNonce).count())

def test_suite():
    return unittest.TestLoader().loadTestsFromName(__name__)
