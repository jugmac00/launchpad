
# Python imports
from sets import Set

# Zope interfaces
from zope.interface import implements

# SQL imports
from sqlobject import ForeignKey, StringCol, DateTimeCol
from sqlobject import MultipleJoin, RelatedJoin, AND, LIKE
from canonical.database.sqlbase import SQLBase
from canonical.database.constants import UTC_NOW
from canonical.database.datetimecol import UtcDateTimeCol
from canonical.lp.dbschema import EnumCol, ImportStatus, \
        RevisionControlSystems

# canonical imports
from canonical.launchpad.interfaces import IProductSeries, \
    ISeriesSource, ISeriesSourceAdmin, IProductSeriesSet

class ProductSeries(SQLBase):
    """A series of product releases."""
    implements(IProductSeries, ISeriesSource, ISeriesSourceAdmin)
    _table = 'ProductSeries'

    product = ForeignKey(dbName='product', foreignKey='Product', notNull=True)
    name = StringCol(notNull=True)
    displayname = StringCol(notNull=True)
    shortdesc = StringCol(notNull=True)
    # below came from SourceSource
    # canonical.lp.dbschema.ImportStatus
    branch = ForeignKey(foreignKey='Branch', dbName='branch', default=None)
    importstatus = EnumCol(dbName='importstatus', notNull=False,
                           schema=ImportStatus, default=None)
    datelastsynced = UtcDateTimeCol(default=None)
    syncinterval = DateTimeCol(default=None)
    rcstype = EnumCol(dbName='rcstype',
                      schema=RevisionControlSystems,
                      notNull=False, default=None)
    cvsroot = StringCol(default=None)
    cvsmodule = StringCol(default=None)
    cvstarfileurl = StringCol(default=None)
    cvsbranch = StringCol(default=None)
    svnrepository = StringCol(default=None)
    # where are the tarballs released from this branch placed?
    releaseroot = StringCol(default=None)
    releaseverstyle = StringCol(default=None)
    releasefileglob = StringCol(default=None)
    # these fields tell us where to publish upstream as bazaar branch
    targetarcharchive = StringCol(default=None)
    targetarchcategory = StringCol(default=None)
    targetarchbranch = StringCol(default=None)
    targetarchversion = StringCol(default=None)
    dateautotested = UtcDateTimeCol(default=None)
    datestarted = UtcDateTimeCol(default=None)
    datefinished = UtcDateTimeCol(default=None)
    dateprocessapproved = UtcDateTimeCol(default=None)
    datesyncapproved = UtcDateTimeCol(default=None)

    # useful joins
    releases = MultipleJoin('ProductRelease', joinColumn='productseries',
                             orderBy=['version'])

    def getRelease(self, version):
        for release in self.releases:
            if release.version==version: return release
        raise KeyError, version

    def _title(self):
        return self.product.displayname + ' Series: ' + self.displayname

    title = property(_title)

    def certifyForSync(self):
        """enable the sync for processing"""
        self.dateprocessapproved = UTC_NOW
        self.syncinterval = datetime.timedelta(1)
        self.importstatus = ImportStatus.PROCESSING

    def syncCertified(self):
        """return true or false indicating if the sync is enabled"""
        return self.dateprocessapproved is not None

    def autoSyncEnabled(self):
        """is the sync automatically scheduling"""
        return self.importstatus == ImportStatus.SYNCING

    def enableAutoSync(self):
        """enable autosyncing"""
        self.datesyncapproved = UTC_NOW
        self.importstatus = ImportStatus.SYNCING


class ProductSeriesSet:

    implements(IProductSeriesSet)

    def __init__(self, product=None):
        self.product = product

    def __iter__(self):
        if self.product:
            theiter = iter(ProductSeries.selectBy(productID=self.product.id))
        else:
            theiter = iter(ProductSeries.select())
        return theiter

    def __getitem__(self, name):
        if not self.product:
            raise KeyError, 'ProductSeriesSet not initialised with product.'
        ret = ProductSeries.selectBy(productID=self.product.id,
                                     name=name)
        if ret.count() == 0:
            raise KeyError, name
        else:
            return ret[0]

    def _querystr(self, ready=None, text=None,
                        forimport=None, importstatus=None):
        """Return a querystring and clauseTables for use in a search or a
        get or a query."""
        query = '1=1'
        clauseTables = Set()
        # deal with the cases which require project and product
        if ( ready is not None ) or text:
            if len(query) > 0:
                query = query + ' AND\n'
            query += "ProductSeries.product = Product.id"
            if text:
                query += ' AND Product.fti @@ ftq(%s)' % quote(text)
            if ready is not None:
                query += ' AND '
                query += 'Product.active IS TRUE AND '
                query += 'Product.reviewed IS TRUE '
            query += ' AND '
            query += '( Product.project IS NULL OR '
            query += '( Product.project = Project.id '
            if text:
                query += ' AND Project.fti @@ ftq(%s) ' % quote(text)
            if ready is not None:
                query += ' AND '
                query += 'Project.active IS TRUE AND '
                query += 'Project.reviewed IS TRUE'
            query += ') )'
            clauseTables.add('Project')
            clauseTables.add('Product')
        # now just add filters on import status
        if forimport:
            if len(query) > 0:
                query += ' AND '
            query += 'ProductSeries.importstatus IS NOT NULL'
        if importstatus:
            if len(query) > 0:
                query += ' AND '
            query += 'ProductSeries.importstatus = %d' % importstatus
        return query, clauseTables

    def search(self, ready=None, 
                     text=None,
                     forimport=None,
                     importstatus=None,
                     start=None,
                     length=None):
        query, clauseTables = self._querystr(ready, text,
                                             forimport, importstatus)
        return ProductSeries.select(query, distinct=True,
                   clauseTables=clauseTables)[start:length]

