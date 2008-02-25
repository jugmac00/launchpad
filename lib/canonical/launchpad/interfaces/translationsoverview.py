# Copyright 2007 Canonical Ltd.  All rights reserved.
# pylint: disable-msg=E0211,E0213

"""Interfaces related to bugs."""

__metaclass__ = type

__all__ = [
    'ITranslationsOverview',
    ]

from zope.interface import Interface
from zope.schema import Int

from canonical.launchpad import _

class ITranslationsOverview(Interface):
    """Overview of Launchpad Translations component."""

    MINIMUM_SIZE = Int(
        title=_('Minimum relative weight for a product'),
        required=True, readonly=False)

    MAXIMUM_SIZE = Int(
        title=_('Maximum relative weight for a product'),
        required=True, readonly=False)

    def getMostTranslatedPillars(limit=50):
        """Get a list of products and distributions with most translations.

        :limit: A number of 'top' products to get.

        It returns a list of pairs (pillar, size), where `pillar` is
        either a product or a distribution, and size is the relative
        amount of contribution a pillar has received.
        """
