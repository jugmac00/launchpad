#!/usr/bin/env python
"""Soyuz buildd slave manager logic."""

import logging

from twisted.application import service
from twisted.internet import defer, reactor, utils
from twisted.internet.threads import deferToThread
from twisted.protocols.policies import TimeoutMixin
from twisted.web.xmlrpc import Proxy, _QueryFactory, QueryProtocol

from zope.component import getUtility
from zope.security.management import newInteraction

from canonical.config import config
from canonical.launchpad.interfaces.build import BuildStatus
from canonical.launchpad.interfaces.builder import IBuilderSet
from canonical.launchpad.webapp import urlappend
from canonical.librarian.db import write_transaction


class FakeZTM:
    """Fake transaction manager."""
    def commit(self):
        pass
    def abort(self):
        pass


class QueryWithTimeoutProtocol(QueryProtocol, TimeoutMixin):
    """XMLRPC query protocol with a configurable timeout."""

    def connectionMade(self):
        QueryProtocol.connectionMade(self)
        self.setTimeout(config.builddmaster.socket_timeout)


class QueryFactoryWithTimeout(_QueryFactory):
    """XMLRPC client facory with timeout support."""
    protocol = QueryWithTimeoutProtocol


class RecordingSlave:
    """An RPC proxy for buildd slaves that records instructions to the latter.

    The idea here is to merely record the instructions that the slave-scanner
    issues to the buildd slaves and "replay" them a bit later in asynchronous
    and parallel fashion.

    By dealing with a number of buildd slaves in parallel we remove *the*
    major slave-scanner throughput issue while avoiding large-scale changes to
    its code base.
    """
    def __init__(self, name, url):
        self.name = name
        self.url = url
        self.resume = False
        self.resume_argv = None
        self.calls = []

    def __repr__(self):
        return '<%s:%s>' % (self.name, self.url)

    def ensurepresent(self, *args):
        self.calls.append(('ensurepresent', args))
        return (True, 'Download')

    def build(self, *args):
        self.calls.append(('build', args))
        return ('BuilderStatus.BUILDING', args[0])

    def resumeHost(self, logger, resume_argv):
        """Record the request to initialize a builder to a known state.

        The supplied resume command will be run in a deferred and parallel
        fashion in order to increase the slave-scanner throughput.
        For now we merely record it.

        :param logger: the logger to use
        :param resume_argv: the resume command to run (sequence of strings)

        :return: a (stdout, stderr, subprocess exitcode) triple
        """
        self.resume = True
        logger.debug("Recording slave reset request for %s", self.url)
        self.resume_argv = resume_argv
        return ('', '', 0)

    def resumeSlaveHost(self):
        """Initialize a virtual builder to a known state.

        The recorded resume command is run in a subprocess in order to reset a
        slave to a known state. This method will only be invoked for virtual
        slaves.

        :return: a deferred
        """
        d = utils.getProcessOutputAndValue(
            self.resume_argv[0], self.resume_argv[1:])
        return d


class BuilddManagerHelper:
    """Helper class for build slave mananager.

    This class encapsulates the dealings with the database.
    """

    @write_transaction
    def scanAllBuilders(self):
        """Scan all builders and "dispatch" build jobs to the idle ones.

        All builders are polled for status and any required post-processing
        actions are performed.

        Subsequently, build job candidates are selected and assigned to the
        idle builders. The necessary build job assignment actions are not
        carried out directly though but merely memorized by the recording
        build slaves.

        In a second stage (see resumeAndDispatch()) each of the latter will be
        handled in an asynchronous and parallel fashion.
        """
        recording_slaves = []

        level = logging.DEBUG
        logger = logging.getLogger('slave-scanner')
        logger.setLevel(level)
        ch = logging.StreamHandler()
        ch.setLevel(level)
        ch.setFormatter(logging.Formatter('%(levelname)s %(message)s'))
        logger.addHandler(ch)

        newInteraction()

        builder_set = getUtility(IBuilderSet)
        builder_set.pollBuilders(logger, FakeZTM())

        for builder in builder_set:
            # XXX cprov 2007-11-09: we don't support manual dispatching
            # yet. Once we support it this clause should be removed.
            if builder.manual:
                logger.warn('Builder is in manual state, ignored.')
                continue

            if not builder.is_available:
                logger.warn('Builder is not available, ignored.')
                continue

            candidate = builder.findBuildCandidate()
            if candidate is None:
                logger.debug("No build candidates available for builder.")
                continue

            slave = RecordingSlave(builder.name, builder.url)
            builder.setSlaveForTesting(slave)

            builder.dispatchBuildCandidate(candidate)
            recording_slaves.append(slave)

        return recording_slaves

    def _cleanJob(self, job):
        """Clean up in case of builder reset or dispatch failure."""
        if job is not None:
            job.build.buildstate = BuildStatus.NEEDSBUILD
            job.builder = None
            job.buildstart = None
            job.logtail = None

    @write_transaction
    def resetBuilder(self, name):
        """Clean up in case a builder could not be reset."""
        newInteraction()
        builder = getUtility(IBuilderSet)[name]
        self._cleanJob(builder.currentjob)

    @write_transaction
    def dispatchFail(self, error, name):
        """Clean up in case we failed to dispatch to a builder."""
        newInteraction()
        builder = getUtility(IBuilderSet)[name]
        builder.failbuilder(error)
        self._cleanJob(builder.currentjob)


class BuilddManager(service.Service):

    def __init__(self):
        self.helper = BuilddManagerHelper()
        self.running_jobs = 0

    def startService(self):
        deferred = deferToThread(self.scan)
        deferred.addCallback(self.resumeAndDispatch)

    def scan(self):
        return self.helper.scanAllBuilders()

    def checkResume(self, response, name):
        out, err, code = response
        if code != 0:
            self.helper.resetBuilder(name)
            return False
        return True

    def checkDispatch(self, response, name):
        status, info = response
        if not status:
            self.helper.dispatchFail(info, name)

    def resumeAndDispatch(self, recording_slaves):
        for slave in recording_slaves:
            self.running_jobs += 1
            if slave.resume:
                # The buildd slave needs to be reset before we can dispatch
                # builds to it.
                d = slave.resumeSlaveHost()
                d.addCallback(self.checkResume, slave.name)
            else:
                # Buildd slave is clean, we can dispatch a build to it
                # straightaway.
                d = defer.maybeDeferred(lambda: True)
            d.addCallback(self.dispatchBuild, slave)
            d.addBoth(self.stopWhenDone)

    def _getProxyForSlave(self, slave):
        """Return a twisted.web.xmlrpc.Proxy for the buildd slave.

        Uses a protocol with timeout support, See QueryFactoryWithTimeout.
        """
        proxy = Proxy(str(urlappend(slave.url, 'rpc')))
        proxy.queryFactory = QueryFactoryWithTimeout
        return proxy

    def dispatchBuild(self, resume_ok, slave):
        """Dispatch a build to a slave.

        This may involve a number of actions which should be chained in the
        same order as recorded.
        """
        # Stop right here if the buildd slave could not be reset.
        if not resume_ok:
            return False

        # Get an XMPRPC proxy for the buildd slave.
        proxy = self._getProxyForSlave(slave)

        # We want the actions (needed to dispatch the build) chained in
        # the same order in which they were recorded.
        previous_deferred = deferred = None

        for method, args in slave.calls:
            deferred = proxy.callRemote(method, *args)
            if previous_deferred is not None:
                previous_deferred.chainDeferred(deferred)
            previous_deferred = deferred

        # Last but not least, add the method that will check whether the
        # dispatching succeeded.
        deferred.addCallback(self.checkDispatch, slave.name)

        self.running_jobs += 1
        return True

    def gameOver(self):
        """Stops the reactor.

        It is usually overridden for tests.
        """
        reactor.stop()

    def stopWhenDone(self, result):
        """Finishes the process if there are no 'running jobs'.

        See `gameOver`.
        """
        self.running_jobs -= 1
        if self.running_jobs <= 0:
            self.gameOver()


if __name__ == "__main__":
    from canonical.config import dbconfig
    from canonical.launchpad.scripts import execute_zcml_for_scripts

    # Connect to database
    dbconfig.setConfigSection('builddmaster')
    execute_zcml_for_scripts()

    bm = BuilddManager()
    bm.startService()
    reactor.run()
