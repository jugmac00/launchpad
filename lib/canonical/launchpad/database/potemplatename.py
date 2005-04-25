# Copyright 2004-2005 Canonical Ltd.  All rights reserved.

__metaclass__ = type
__all__ = ['POTemplateNameSet', 'POTemplateName']

from zope.interface import implements
from zope.exceptions import NotFoundError

from sqlobject import StringCol, MultipleJoin, SQLObjectNotFound
from canonical.database.sqlbase import SQLBase

from canonical.launchpad import helpers
from canonical.launchpad.interfaces import IPOTemplateName

class POTemplateNameSet:
    def __getitem__(self, name):
        try:
            return POTemplateName.byName(name)
        except SQLObjectNotFound:
            raise NotFoundError, name

    def __iter__(self):
        for potemplatename in POTemplateName.select():
            yield potemplatename

    def new(self, translationdomain, title, name=None):
        if name is None:
            name = helpers.getValidNameFromString(translationdomain)
        return POTemplateName(name=name, title=title,
                              translationdomain=translationdomain)


class POTemplateName(SQLBase):
    implements(IPOTemplateName)

    _table = 'POTemplateName'

    name = StringCol(dbName='name', notNull=True, unique=True, alternateID=True)
    title = StringCol(dbName='title', notNull=True)
    description = StringCol(dbName='description', notNull=False, default=None)
    translationdomain = StringCol(dbName='translationdomain', notNull=True,
        unique=True, alternateID=True)
    potemplates = MultipleJoin('POTemplate', joinColumn='potemplatename')

