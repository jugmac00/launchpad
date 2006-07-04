# Copyright 2004-2005 Canonical Ltd.  All rights reserved.

__metaclass__ = type
__all__ = ['Milestone', 'MilestoneSet']

from zope.interface import implements

from sqlobject import (
    ForeignKey, StringCol, AND, SQLObjectNotFound, BoolCol, DateCol,
    SQLMultipleJoin)

from canonical.launchpad.interfaces import (
    IMilestone, IMilestoneSet, NotFoundError)
from canonical.database.sqlbase import SQLBase


class Milestone(SQLBase):
    implements(IMilestone)

    product = ForeignKey(dbName='product',
        foreignKey='Product', default=None)
    distribution = ForeignKey(dbName='distribution',
        foreignKey='Distribution', default=None)
    productseries = ForeignKey(dbName='productseries',
        foreignKey='ProductSeries', default=None)
    distrorelease = ForeignKey(dbName='distrorelease',
        foreignKey='DistroRelease', default=None)
    name = StringCol(notNull=True)
    dateexpected = DateCol(notNull=False, default=None)
    visible = BoolCol(notNull=True, default=True)

    # joins
    specifications = SQLMultipleJoin('Specification', joinColumn='milestone',
        orderBy=['-priority', 'status', 'delivery', 'title'],
        prejoins=['assignee'])

    @property
    def target(self):
        """See IMilestone."""
        if self.product:
            return self.product
        elif self.distribution:
            return self.distribution

    @property
    def series_target(self):
        """See IMilestone."""
        if self.productseries:
            return self.productseries
        elif self.distrorelease:
            return self.distrorelease

    @property
    def displayname(self):
        """See IMilestone."""
        return "%s: %s" % (self.target.displayname, self.name)

    @property
    def title(self):
        """See IMilestone."""
        title = 'Milestone %s for %s' % (self.name, self.target.displayname)
        if self.dateexpected:
            title += ' due ' + self.dateexpected.strftime('%Y-%m-%d')
        return title


class MilestoneSet:
    implements(IMilestoneSet)

    def __iter__(self):
        """See canonical.launchpad.interfaces.milestone.IMilestoneSet."""
        for ms in Milestone.select():
            yield ms

    def get(self, milestoneid):
        """See canonical.launchpad.interfaces.milestone.IMilestoneSet."""
        try:
            return Milestone.get(milestoneid)
        except SQLObjectNotFound, err:
            raise NotFoundError(
                "Milestone with ID %d does not exist" % milestoneid)

    def getByNameAndProduct(self, name, product, default=None):
        """See canonical.launchpad.interfaces.milestone.IMilestoneSet."""
        query = AND(Milestone.q.name==name,
                    Milestone.q.productID==product.id)
        milestone = Milestone.selectOne(query)
        if milestone is None:
            return default
        return milestone

    def getByNameAndDistribution(self, name, distribution, default=None):
        """See canonical.launchpad.interfaces.milestone.IMilestoneSet."""
        query = AND(Milestone.q.name==name,
                    Milestone.q.distributionID==distribution.id)
        milestone = Milestone.selectOne(query)
        if milestone is None:
            return default
        return milestone

