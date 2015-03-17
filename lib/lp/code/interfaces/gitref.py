# Copyright 2015 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""Git reference ("ref") interfaces."""

__metaclass__ = type

__all__ = [
    'IGitRef',
    ]

from zope.interface import (
    Attribute,
    Interface,
    )
from zope.schema import (
    Choice,
    TextLine,
    )

from lp import _
from lp.code.enums import GitObjectType


class IGitRef(Interface):
    """A reference in a Git repository."""

    repository = Attribute("The Git repository containing this reference.")

    path = TextLine(
        title=_("Path"), required=True, readonly=True,
        description=_(
            "The full path of this reference, e.g. refs/heads/master."))

    commit_sha1 = TextLine(
        title=_("Commit SHA-1"), required=True, readonly=True,
        description=_(
            "The full SHA-1 object name of the commit object referenced by "
            "this reference."))

    object_type = Choice(
        title=_("Object type"), required=True, readonly=True,
        vocabulary=GitObjectType)
