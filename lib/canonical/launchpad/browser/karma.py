# Copyright 2004 Canonical Ltd

__metaclass__ = type

__all__ = ['KarmaActionSetView', 'KarmaActionSetNavigation']

from zope.component import getUtility

from canonical.lp.dbschema import KarmaActionCategory
from canonical.launchpad.interfaces import IKarmaActionSet
from canonical.launchpad.webapp import Navigation


class KarmaActionSetView:

    def __init__(self, context, request):
        self.context = context
        self.request = request

    def actionCategories(self):
        return KarmaActionCategory.items

    def actions(self, actionCategory):
        return getUtility(IKarmaActionSet).selectByCategory(actionCategory)


class KarmaActionSetNavigation(Navigation):

    usedfor = IKarmaActionSet

    def traverse(self, name):
        return self.context.getByName(name)
