#!/usr/bin/env python2.4
##############################################################################
#
# Copyright (c) 2004 Zope Corporation and Contributors.
# All Rights Reserved.
#
# This software is subject to the provisions of the Zope Public License,
# Version 2.1 (ZPL).  A copy of the ZPL should accompany this distribution.
# THIS SOFTWARE IS PROVIDED "AS IS" AND ANY AND ALL EXPRESS OR IMPLIED
# WARRANTIES ARE DISCLAIMED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF TITLE, MERCHANTABILITY, AGAINST INFRINGEMENT, AND FITNESS
# FOR A PARTICULAR PURPOSE.
#
##############################################################################
"""Test script

$Id: test.py 25177 2004-06-02 13:17:31Z jim $
"""
import sys, os, psycopg, time, logging, warnings

os.setpgrp() # So test_on_merge.py can reap its children

# Make tests run in a timezone no launchpad developers live in.
# Our tests need to run in any timezone.
# (No longer actually required, as PQM does this)
os.environ['TZ'] = 'Asia/Calcutta'
time.tzset()

here = os.path.dirname(os.path.realpath(__file__))
sys.path.insert(0, os.path.join(here, 'lib'))

# Set PYTHONPATH environment variable for spawned processes
os.environ['PYTHONPATH'] = ':'.join(sys.path)

# Install the import fascist import hook and atexit handler.
import importfascist
importfascist.install_import_fascist()

# Install the warning handler hook and atexit handler.
import warninghandler
warninghandler.install_warning_handler()


# Tell canonical.config to use the test config section in launchpad.conf
from canonical.config import config
config.setDefaultSection('testrunner')

# Turn on psycopg debugging wrapper
#import canonical.database.debug
#canonical.database.debug.install()

# Unset the http_proxy environment variable, because we're going to make
# requests to localhost and we don't wand this to be proxied.
try:
    os.environ.pop('http_proxy')
except KeyError:
    pass

# Silence spurious warnings or turn them into errors
#
warnings.filterwarnings(
        'ignore', 'PyCrypto', RuntimeWarning, 'twisted[.]conch[.]ssh'
        )
warnings.filterwarnings(
        'ignore', 'publisherhttpserver', DeprecationWarning
        )
# Our Z3 is still using whrandom
#warnings.filterwarnings(
#        "ignore",
#        "the whrandom module is deprecated; please use the random module"
#        )
# Some stuff got deprecated in 2.4 that we can clean up
#warnings.filterwarnings(
#        "error", category=DeprecationWarning, module="email"
#        )

from canonical.ftests import pgsql
# If this is removed, make sure canonical.ftests.pgsql is updated
# because the test harness there relies on the Connection wrapper being
# installed.
pgsql.installFakeConnect()

# This is a terrible hack to divorce the FunctionalTestSetup from
# its assumptions about the ZODB.
# XXX: Still needed under Z3.2?
#from zope.app.testing.functional import FunctionalTestSetup
#FunctionalTestSetup.__init__ = lambda *x: None

from zope.testing import testrunner

defaults = [
    # Find tests in the tests and ftests directories
    '--tests-pattern=^f?tests$',
    '--test-path=%s' % os.path.join(here, 'lib'),
    '--package=canonical',
    ]

if __name__ == '__main__':
    result = testrunner.run(defaults)
    # Cribbed from sourcecode/zope/test.py - avoid spurious error during exit.
    logging.disable(999999999)
    sys.exit(result)

