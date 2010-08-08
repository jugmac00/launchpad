# Copyright 2009 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""Soyuz buildd slave manager logic."""

__metaclass__ = type

__all__ = [
    'BaseDispatchResult',
    'BuilddManager',
    'FailDispatchResult',
    'RecordingSlave',
    'ResetDispatchResult',
    'buildd_success_result_map',
    ]

import logging
import os
import transaction

from twisted.application import service
from twisted.internet import defer, reactor
from twisted.protocols.policies import TimeoutMixin
from twisted.python import log
from twisted.python.failure import Failure
from twisted.web import xmlrpc

from zope.component import getUtility

from canonical.config import config
from canonical.launchpad.webapp import urlappend
from canonical.librarian.db import write_transaction
from lp.buildmaster.interfaces.buildbase import BUILDD_MANAGER_LOG_NAME
from lp.services.twistedsupport.processmonitor import ProcessWithTimeout


buildd_success_result_map = {
    'ensurepresent': True,
    'build': 'BuilderStatus.BUILDING',
    }


class QueryWithTimeoutProtocol(xmlrpc.QueryProtocol, TimeoutMixin):
    """XMLRPC query protocol with a configurable timeout.

    XMLRPC queries using this protocol will be unconditionally closed
    when the timeout is elapsed. The timeout is fetched from the context
    Launchpad configuration file (`config.builddmaster.socket_timeout`).
    """
    def connectionMade(self):
        xmlrpc.QueryProtocol.connectionMade(self)
        self.setTimeout(config.builddmaster.socket_timeout)


class QueryFactoryWithTimeout(xmlrpc._QueryFactory):
    """XMLRPC client factory with timeout support."""
    # Make this factory quiet.
    noisy = False
    # Use the protocol with timeout support.
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

    def __init__(self, name, url, vm_host):
        self.name = name
        self.url = url
        self.vm_host = vm_host

        self.resume_requested = False
        self.calls = []

    def __repr__(self):
        return '<%s:%s>' % (self.name, self.url)

    def cacheFile(self, logger, libraryfilealias):
        """Cache the file on the server."""
        self.ensurepresent(
            libraryfilealias.content.sha1, libraryfilealias.http_url, '', '')

    def sendFileToSlave(self, *args):
        """Helper to send a file to this builder."""
        return self.ensurepresent(*args)

    def ensurepresent(self, *args):
        """Download files needed for the build."""
        self.calls.append(('ensurepresent', args))
        result = buildd_success_result_map.get('ensurepresent')
        return [result, 'Download']

    def build(self, *args):
        """Perform the build."""
        self.calls.append(('build', args))
        result = buildd_success_result_map.get('build')
        return [result, args[0]]

    def resume(self):
        """Record the request to resume the builder..

        Always succeed.

        :return: a (stdout, stderr, subprocess exitcode) triple
        """
        self.resume_requested = True
        return ['', '', 0]

    def resumeSlave(self, clock=None):
        """Resume the builder in a asynchronous fashion.

        Used the configuration command-line in the same way
        `BuilddSlave.resume` does.

        Also use the builddmaster configuration 'socket_timeout' as
        the process timeout.

        :param clock: An optional twisted.internet.task.Clock to override
                      the default clock.  For use in tests.

        :return: a Deferred
        """
        resume_command = config.builddmaster.vm_resume_command % {
            'vm_host': self.vm_host}
        # Twisted API require string and the configuration provides unicode.
        resume_argv = [str(term) for term in resume_command.split()]

        d = defer.Deferred()
        p = ProcessWithTimeout(
            d, config.builddmaster.socket_timeout, clock=clock)
        p.spawnProcess(resume_argv[0], tuple(resume_argv))
        return d


class BaseDispatchResult:
    """Base class for *DispatchResult variations.


    It will be extended to represent dispatching results and allow
    homogeneous processing.
    """

    def __init__(self, slave, info=None):
        self.slave = slave
        self.info = info

    def _cleanJob(self, job):
        """Clean up in case of builder reset or dispatch failure."""
        if job is not None:
            job.reset()

    def ___call__(self):
        raise NotImplementedError(
            "Call sites must define an evaluation method.")


class FailDispatchResult(BaseDispatchResult):
    """Represents a communication failure while dispatching a build job..

    When evaluated this object mark the corresponding `IBuilder` as
    'NOK' with the given text as 'failnotes'. It also cleans up the running
    job (`IBuildQueue`).
    """

    def __repr__(self):
        return  '%r failure (%s)' % (self.slave, self.info)

    @write_transaction
    def __call__(self):
        # Avoiding circular imports.
        from lp.buildmaster.interfaces.builder import IBuilderSet

        builder = getUtility(IBuilderSet)[self.slave.name]
        builder.failBuilder(self.info)
        self._cleanJob(builder.currentjob)


class ResetDispatchResult(BaseDispatchResult):
    """Represents a failure to reset a builder.

    When evaluated this object simply cleans up the running job
    (`IBuildQueue`) and marks the builder down.
    """

    def __repr__(self):
        return  '%r reset failure' % self.slave

    @write_transaction
    def __call__(self):
        # Avoiding circular imports.
        from lp.buildmaster.interfaces.builder import IBuilderSet

        builder = getUtility(IBuilderSet)[self.slave.name]
        # Builders that fail to reset should be disabled as per bug
        # 563353.
        # XXX Julian bug=586362
        # This is disabled until this code is not also used for dispatch
        # failures where we *don't* want to disable the builder.
        # builder.failBuilder(self.info)
        self._cleanJob(builder.currentjob)


class SlaveScanner:
    """A manager for a single builder."""

    SCAN_INTERVAL = 5

    # These are for the benefit of tests; see `TestingSlaveScanner`.
    # It pokes fake versions in here so that it can verify methods were
    # called.  The tests should really be using FakeMethod() though.
    reset_result = ResetDispatchResult
    fail_result = FailDispatchResult

    def __init__(self, builder_name, logger):
        self.builder_name = builder_name
        self.logger = logger
        self._deferred_list = []

    def scheduleNextScanCycle(self):
        """Schedule another scan of the builder some time in the future."""
        self._deferred_list = []
        reactor.callLater(self.SCAN_INTERVAL, self.startCycle)

    def startCycle(self):
        """Scan the builder and dispatch to it or deal with failures."""
        self.logger.debug("Scanning builder: %s" % self.builder_name)

        try:
            slave = self.scan()
            if slave is None:
                self.scheduleNextScanCycle()
            else:
                self.resumeAndDispatch(slave)
        except:
            error = Failure()
            self.logger.info("Scanning failed with: %s\n%s" %
                (error.getErrorMessage(), error.getTraceback()))
            # We should probably detect continuous failures here and mark
            # the builder down.
            self.scheduleNextScanCycle()

    @write_transaction
    def scan(self):
        """Probe the builder and update/dispatch/collect as appropriate.

        The whole method is wrapped in a transaction, but we do partial
        commits to avoid holding locks on tables.

        :return: A `RecordingSlave` if we dispatched a job to it, or None.
        """
        # We need to re-fetch the builder object on each cycle as the
        # Storm store is invalidated over transaction boundaries.

        # Avoid circular import.
        from lp.buildmaster.interfaces.builder import IBuilderSet
        builder_set = getUtility(IBuilderSet)
        self.builder = builder_set[self.builder_name]

        if self.builder.builderok:
            self.builder.updateStatus(self.logger)
            transaction.commit()

        # See if we think there's an active build on the builder.
        buildqueue = self.builder.getBuildQueue()

        # XXX Julian 2010-07-29 bug=611258
        # We're not using the RecordingSlave until dispatching, which
        # means that this part blocks until we've received a response
        # from the builder.  updateBuild() needs to be made
        # asyncronous.

        # Scan the slave and get the logtail, or collect the build if
        # it's ready.  Yes, "updateBuild" is a bad name.
        if buildqueue is not None:
            self.builder.updateBuild(buildqueue)
            transaction.commit()

        # If the builder is in manual mode, don't dispatch anything.
        if self.builder.manual:
            self.logger.debug(
                '%s is in manual mode, not dispatching.' % self.builder.name)
            return None

        # If the builder is marked unavailable, don't dispatch anything.
        # Additionaly, because builders can be removed from the pool at
        # any time, we need to see if we think there was a build running
        # on it before it was marked unavailable. In this case we reset
        # the build thusly forcing it to get re-dispatched to another
        # builder.
        if not self.builder.is_available:
            job = self.builder.currentjob
            if job is not None and not self.builder.builderok:
                self.logger.info(
                    "%s was made unavailable, resetting attached "
                    "job" % self.builder.name)
                job.reset()
                transaction.commit()
            return None

        # See if there is a job we can dispatch to the builder slave.
        slave = RecordingSlave(
            self.builder.name, self.builder.url, self.builder.vm_host)
        candidate = self.builder.findAndStartJob(buildd_slave=slave)
        if self.builder.currentjob is not None:
            transaction.commit()
            return slave

        return None

    def resumeAndDispatch(self, slave):
        """Chain the resume and dispatching Deferreds."""
        if slave.resume_requested:
            # The slave needs to be reset before we can dispatch to
            # it (e.g. a virtual slave)
            d = slave.resumeSlave()
            d.addBoth(self.checkResume, slave)
        else:
            # No resume required, build dispatching can commence.
            d = defer.succeed(None)

        # Dispatch the build to the slave asynchronously.
        d.addCallback(self.initiateDispatch, slave)
        # Store this deferred so we can wait for it along with all
        # the others that will be generated by RecordingSlave during
        # the dispatch process, and chain a callback after they've
        # all fired.
        self._deferred_list.append(d)

    def initiateDispatch(self, resume_result, slave):
        """Start dispatching a build to a slave.

        If the previous task in chain (slave resuming) has failed it will
        receive a `ResetBuilderRequest` instance as 'resume_result' and
        will immediately return that so the subsequent callback can collect
        it.

        If the slave resuming succeeded, it starts the XMLRPC dialogue.  The
        dialogue may consist of many calls to the slave before the build
        starts.  Each call is done via a Deferred event, where slave calls
        are sent in callSlave(), and checked in checkDispatch() which will
        keep firing events via callSlave() until all the events are done or
        an error occurs.
        """
        if resume_result is not None:
            self.slaveConversationEnded()
            return resume_result

        self.logger.info('Dispatching: %s' % slave)
        self.callSlave(slave)

    def _getProxyForSlave(self, slave):
        """Return a twisted.web.xmlrpc.Proxy for the buildd slave.

        Uses a protocol with timeout support, See QueryFactoryWithTimeout.
        """
        proxy = xmlrpc.Proxy(str(urlappend(slave.url, 'rpc')))
        proxy.queryFactory = QueryFactoryWithTimeout
        return proxy

    def callSlave(self, slave):
        """Dispatch the next XMLRPC for the given slave."""
        if len(slave.calls) == 0:
            # That's the end of the dialogue with the slave.
            self.slaveConversationEnded()
            return

        # Get an XMLRPC proxy for the buildd slave.
        proxy = self._getProxyForSlave(slave)
        method, args = slave.calls.pop(0)
        d = proxy.callRemote(method, *args)
        d.addBoth(self.checkDispatch, method, slave)
        self._deferred_list.append(d)
        self.logger.debug('%s -> %s(%s)' % (slave, method, args))

    def slaveConversationEnded(self):
        """After all the Deferreds are set up, chain a callback on them."""
        dl = defer.DeferredList(self._deferred_list, consumeErrors=True)
        dl.addBoth(self.evaluateDispatchResult)
        return dl

    def evaluateDispatchResult(self, deferred_list_results):
        """Process the DispatchResult for this dispatch chain.

        After waiting for the Deferred chain to finish, we'll have a
        DispatchResult to evaluate, which deals with the result of
        dispatching.
        """
        # The `deferred_list_results` is what we get when waiting on a
        # DeferredList.  It's a list of tuples of (status, result) where
        # result is what the last callback in that chain returned.

        # If the result is an instance of BaseDispatchResult we need to
        # evaluate it, as there's further action required at the end of
        # the dispatch chain.  None, resulting from successful chains,
        # are discarded.

        dispatch_results = [
            result for status, result in deferred_list_results
            if isinstance(result, BaseDispatchResult)]

        for result in dispatch_results:
            self.logger.info("%r" % result)
            result()

        # At this point, we're done dispatching, so we can schedule the
        # next scan cycle.
        self.scheduleNextScanCycle()

        # For the test suite so that it can chain callback results.
        return deferred_list_results

    def checkResume(self, response, slave):
        """Check the result of resuming a slave.

        If there's a problem resuming, we return a ResetDispatchResult which
        will get evaluated at the end of the scan, or None if the resume
        was OK.

        :param response: the tuple that's constructed in
            ProcessWithTimeout.processEnded(), or a Failure that
            contains the tuple.
        :param slave: the slave object we're talking to
        """
        if isinstance(response, Failure):
            out, err, code = response.value
        else:
            out, err, code = response
            if code == os.EX_OK:
                return None

        error_text = '%s\n%s' % (out, err)
        self.logger.error('%s resume failure: %s' % (slave, error_text))
        return self.reset_result(slave, error_text)

    def checkDispatch(self, response, method, slave):
        """Verify the results of a slave xmlrpc call.

        If it failed and it compromises the slave then return a corresponding
        `FailDispatchResult`, if it was a communication failure, simply
        reset the slave by returning a `ResetDispatchResult`.
        """
        # XXX these DispatchResult classes are badly named and do the
        # same thing.  We need to fix that.
        self.logger.debug(
            '%s response for "%s": %s' % (slave, method, response))

        if isinstance(response, Failure):
            self.logger.warn(
                '%s communication failed (%s)' %
                (slave, response.getErrorMessage()))
            self.slaveConversationEnded()
            return self.reset_result(slave)

        if isinstance(response, list) and len(response) == 2:
            if method in buildd_success_result_map:
                expected_status = buildd_success_result_map.get(method)
                status, info = response
                if status == expected_status:
                    self.callSlave(slave)
                    return None
            else:
                info = 'Unknown slave method: %s' % method
        else:
            info = 'Unexpected response: %s' % repr(response)

        self.logger.error(
            '%s failed to dispatch (%s)' % (slave, info))

        self.slaveConversationEnded()
        return self.fail_result(slave, info)


class NewBuildersScanner:
    """If new builders appear, create a scanner for them."""

    # How often to check for new builders, in seconds.
    SCAN_INTERVAL = 300

    def __init__(self, manager, clock=None):
        self.manager = manager
        # Use the clock if provided, it's so that tests can
        # advance it.  Use the reactor by default.
        if clock is None:
            clock = reactor
        self._clock = clock
        # Avoid circular import.
        from lp.buildmaster.interfaces.builder import IBuilderSet
        self.current_builders = [
            builder.name for builder in getUtility(IBuilderSet)]

    def scheduleScan(self):
        """Schedule a callback SCAN_INTERVAL seconds later."""
        return self._clock.callLater(self.SCAN_INTERVAL, self.scan)

    def scan(self):
        """If a new builder appears, create a SlaveScanner for it."""
        new_builders = self.checkForNewBuilders()
        self.manager.addScanForBuilders(new_builders)
        self.scheduleScan()

    def checkForNewBuilders(self):
        """See if any new builders were added."""
        # Avoid circular import.
        from lp.buildmaster.interfaces.builder import IBuilderSet
        new_builders = set(
            builder.name for builder in getUtility(IBuilderSet))
        old_builders = set(self.current_builders)
        extra_builders = new_builders.difference(old_builders)
        return list(extra_builders)


class BuilddManager(service.Service):
    """Main Buildd Manager service class."""

    def __init__(self, clock=None):
        self.builder_slaves = []
        self.logger = self._setupLogger()
        self.new_builders_scanner = NewBuildersScanner(
            manager=self, clock=clock)

    def _setupLogger(self):
        """Setup a 'slave-scanner' logger that redirects to twisted.

        It is going to be used locally and within the thread running
        the scan() method.

        Make it less verbose to avoid messing too much with the old code.
        """
        level = logging.INFO
        logger = logging.getLogger(BUILDD_MANAGER_LOG_NAME)

        # Redirect the output to the twisted log module.
        channel = logging.StreamHandler(log.StdioOnnaStick())
        channel.setLevel(level)
        channel.setFormatter(logging.Formatter('%(message)s'))

        logger.addHandler(channel)
        logger.setLevel(level)
        return logger

    def startService(self):
        """Service entry point, called when the application starts."""

        # Get a list of builders and set up scanners on each one.

        # Avoiding circular imports.
        from lp.buildmaster.interfaces.builder import IBuilderSet
        builder_set = getUtility(IBuilderSet)
        builders = [builder.name for builder in builder_set]
        self.addScanForBuilders(builders)
        self.new_builders_scanner.scheduleScan()

        # Events will now fire in the SlaveScanner objects to scan each
        # builder.

    def addScanForBuilders(self, builders):
        """Set up scanner objects for the builders specified."""
        for builder in builders:
            slave_scanner = SlaveScanner(builder, self.logger)
            self.builder_slaves.append(slave_scanner)
            slave_scanner.scheduleNextScanCycle()

        # Return the slave list for the benefit of tests.
        return self.builder_slaves
