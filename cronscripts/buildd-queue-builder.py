#!/usr/bin/env python
# Copyright 2004 Canonical Ltd.  All rights reserved.
# Author: Daniel Silverstone <daniel.silverstone@canonical.com>
#         Celso Providelo <celso.providelo@canonical.com>
#
# Build Jobs initialization
#
__metaclass__ = type

import _pythonpath

import sys
import os
from optparse import OptionParser

from zope.component import getUtility

from canonical.lp import initZopeless
from canonical.config import config
from canonical.launchpad.interfaces import IDistroArchReleaseSet

from canonical.launchpad.scripts.builddmaster import BuilddMaster
from canonical.launchpad.scripts.lockfile import LockFile
from canonical.launchpad.scripts import (
    execute_zcml_for_scripts, logger_options, logger
    )

_default_lockfile = '/var/lock/buildd-master.lock'


def rebuildQueue(log):
    """Look for and initialise new build jobs."""
    # setup a transaction manager
    tm = initZopeless(dbuser=config.builddmaster.dbuser)

    buildMaster = BuilddMaster(log, tm)

    # Simple container
    distroreleases = set()

    # For every distroarchrelease we can find; put it into the build master
    for archrelease in getUtility(IDistroArchReleaseSet):
        distroreleases.add(archrelease.distrorelease)
        buildMaster.addDistroArchRelease(archrelease)

    # For each distrorelease we care about; scan for sourcepackagereleases
    # with no build associated with the distroarchreleases we're
    # interested in
    for distrorelease in distroreleases:
        buildMaster.createMissingBuilds(distrorelease)

    # inspect depwaiting and look retry those which seems possible
    buildMaster.retryDepWaiting()

    # For each build record in NEEDSBUILD, ensure it has a
    # buildqueue entry
    buildMaster.addMissingBuildQueueEntries()

    # Re-score the NEEDSBUILD properly
    buildMaster.sanitiseAndScoreCandidates()

if __name__ == '__main__':
    if os.path.exists("/srv/launchpad.net/ubuntu-archive/cron.daily.lock"):
        # Quick and dirty "don't start if the publisher is here"
        sys.exit(0)

    parser = OptionParser()
    logger_options(parser)
    (options, arguments) = parser.parse_args()

    if arguments:
        parser.error("Unhandled arguments %r" % arguments)

    execute_zcml_for_scripts()

    log = logger(options, 'queuebuilder')

    log.info("Rebuilding Build Queue.")

    locker = LockFile(_default_lockfile, logger=log)
    try:
        locker.acquire()
    except OSError:
        log.info("Cannot Acquire Lock.")
        sys.exit(1)

    try:
        rebuildQueue(log)
    finally:
        locker.release()

    log.info("Buildd Queue Rebuilt.")
