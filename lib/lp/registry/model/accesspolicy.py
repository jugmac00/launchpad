# Copyright 2011 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""Model classes for pillar and artifact access policies."""

__metaclass__ = type
__all__ = [
    'AccessPolicy',
    'AccessPolicyArtifact',
    'AccessPolicyPermission',
    ]

from storm.properties import (
    Int,
    Unicode,
    )
from storm.references import (
    Reference,
    ReferenceSet,
    )
from zope.interface import implements

from canonical.launchpad.interfaces.lpstorm import IStore
from lp.registry.interfaces.accesspolicy import (
    IAccessPolicy,
    IAccessPolicyArtifact,
    IAccessPolicyPermission,
    )
from lp.services.database.stormbase import StormBase


class AccessPolicy(StormBase):
    implements(IAccessPolicy)

    __storm_table__ = 'AccessPolicy'

    id = Int(primary=True)
    product_id = Int(name='product')
    product = Reference(product_id, 'Product.id')
    distribution_id = Int(name='distribution')
    distribution = Reference(distribution_id, 'Distribution.id')
    display_name = Unicode()

    permissions = ReferenceSet(id, "AccessPolicyPermission.policy_id")

    @property
    def pillar(self):
        return self.product or self.distribution

    @classmethod
    def create(cls, pillar, display_name):
        from lp.registry.interfaces.distribution import IDistribution
        from lp.registry.interfaces.product import IProduct
        obj = cls()
        if IProduct.providedBy(pillar):
            obj.product = pillar
        elif IDistribution.providedBy(pillar):
            obj.distribution = pillar
        obj.display_name = display_name
        IStore(cls).add(obj)
        return obj

    @classmethod
    def _constraintForPillar(cls, pillar):
        from lp.registry.interfaces.distribution import IDistribution
        from lp.registry.interfaces.product import IProduct
        if IProduct.providedBy(pillar):
            col = cls.product
        elif IDistribution.providedBy(pillar):
            col = cls.distribution
        else:
            raise AssertionError("%r is not a supported pillar" % pillar)
        return col == pillar

    @classmethod
    def getByID(cls, id):
        """See `IAccessPolicySource`."""
        return IStore(cls).get(cls, id)

    @classmethod
    def findByPillar(cls, pillar):
        """See `IAccessPolicySource`."""
        return IStore(cls).find(cls, cls._constraintForPillar(pillar))

    @classmethod
    def getByPillarAndName(cls, pillar, display_name):
        """See `IAccessPolicySource`."""
        return cls.findByPillar(pillar).find(display_name=display_name).one()


class AccessPolicyArtifact(StormBase):
    implements(IAccessPolicyArtifact)

    __storm_table__ = 'AccessPolicyArtifact'

    id = Int(primary=True)
    bug_id = Int(name='bug')
    bug = Reference(bug_id, 'Bug.id')
    branch_id = Int(name='branch')
    branch = Reference(branch_id, 'Branch.id')

    @property
    def concrete_artifact(self):
        artifact = self.bug or self.branch
        assert artifact is not None
        return artifact

    @classmethod
    def ensure(cls, concrete_artifact):
        """See `IAccessPolicyArtifactSource`."""
        from lp.bugs.interfaces.bug import IBug
        from lp.code.interfaces.branch import IBranch
        obj = cls()
        if IBug.providedBy(concrete_artifact):
            obj.bug = concrete_artifact
        elif IBranch.providedBy(concrete_artifact):
            obj.branch = concrete_artifact
        IStore(cls).add(obj)
        return obj


class AccessPolicyPermission(StormBase):
    implements(IAccessPolicyPermission)

    __storm_table__ = 'AccessPolicyPermission'

    id = Int(primary=True)
    policy_id = Int(name='policy')
    policy = Reference(policy_id, 'AccessPolicy.id')
    person_id = Int(name='person')
    person = Reference(person_id, 'Person.id')
    abstract_artifact_id = Int(name='artifact')
    abstract_artifact = Reference(
        abstract_artifact_id, 'AccessPolicyArtifact.id')

    @property
    def concrete_artifact(self):
        if self.abstract_artifact is not None:
            return self.abstract_artifact.concrete_artifact
