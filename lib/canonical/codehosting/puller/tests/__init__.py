from StringIO import StringIO

from canonical.codehosting.puller.worker import (
    PullerWorker, PullerWorkerProtocol, URLChecker)


class PullerWorkerMixin:
    """Mixin for tests that want to make PullerWorker objects.

    Assumes that it is mixed into a class that runs in a temporary directory,
    such as `TestCaseInTempDir` and that `get_transport` is provided as a
    method.
    """

    def makePullerWorker(self, src_dir=None, dest_dir=None, branch_type=None,
                         protocol=None, oops_prefix=None):
        """Anonymous creation method for PullerWorker."""
        if src_dir is None:
            src_dir = self.get_transport('source-branch').base
        if dest_dir is None:
            dest_dir = './dest-branch'
        if protocol is None:
            protocol = PullerWorkerProtocol(StringIO())
        if oops_prefix is None:
            oops_prefix = ''
        class _AcceptAnythingChecker(URLChecker):
            def checkOneURL(self, url):
                pass
        checker = _AcceptAnythingChecker()
        return PullerWorker(
            src_dir, dest_dir, branch_id=1, unique_name='foo/bar/baz',
            branch_type=branch_type, protocol=protocol, checker=checker,
            oops_prefix=oops_prefix)
