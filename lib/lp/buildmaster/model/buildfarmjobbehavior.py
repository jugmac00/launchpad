# Copyright 2009 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

# pylint: disable-msg=E0211,E0213

"""Base and idle BuildFarmJobBehavior classes."""

__metaclass__ = type

__all__ = [
    'BuildFarmJobBehaviorBase',
    'IdleBuildBehavior',
    ]

from zope.interface import implements

from lp.buildmaster.interfaces.buildfarmjobbehavior import (
    BuildBehaviorMismatch, IBuildFarmJobBehavior)


class BuildFarmJobBehaviorBase:
    """Ensures that all behaviors inherit the same initialisation.

    All build-farm job behaviors should inherit from this.
    """

    def __init__(self, buildfarmjob):
        """Store a reference to the job_type with which we were created."""
        self.buildfarmjob = buildfarmjob
        self._builder = None

    def setBuilder(self, builder):
        """The builder should be set once and not changed."""
        self._builder = builder

    def verifyBuildRequest(self, logger):
        """The default behavior is a no-op."""
        pass

    def slaveStatus(self, raw_slave_status):
        """See `IBuildFarmJobBehavior`.

        The default behavior is that we don't add any extra values."""
        return {}


class IdleBuildBehavior(BuildFarmJobBehaviorBase):

    implements(IBuildFarmJobBehavior)

    def __init__(self):
        """The idle behavior is special in that a buildfarmjob is not
        specified during initialisation as it is not the result of an
        adaption.
        """
        super(IdleBuildBehavior, self).__init__(None)

    def logStartBuild(self, logger):
        """See `IBuildFarmJobBehavior`."""
        raise BuildBehaviorMismatch(
            "Builder was idle when asked to log the start of a build.")

    def dispatchBuildToSlave(self, build_queue_item_id, logger):
        """See `IBuildFarmJobBehavior`."""
        raise BuildBehaviorMismatch(
            "Builder was idle when asked to dispatch a build to the slave.")

    @property
    def status(self):
        """See `IBuildFarmJobBehavior`."""
        return "Idle"
