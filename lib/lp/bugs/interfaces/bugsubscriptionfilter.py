# Copyright 2010 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""Bug subscription filter interfaces."""

__metaclass__ = type
__all__ = [
    "IBugSubscriptionFilter",
    ]


from lazr.restful.declarations import (
    export_as_webservice_entry,
    export_destructor_operation,
    exported,
    )
from lazr.restful.fields import Reference
from zope.interface import Interface
from zope.schema import (
    Bool,
    Choice,
    FrozenSet,
    Int,
    Text,
    )

from canonical.launchpad import _
from lp.bugs.enum import BugNotificationLevel
from lp.bugs.interfaces.bugtask import (
    BugTaskImportance,
    BugTaskStatus,
    )
from lp.bugs.interfaces.structuralsubscription import (
    IStructuralSubscription,
    )
from lp.services.fields import SearchTag


class IBugSubscriptionFilterAttributes(Interface):
    """Attributes of `IBugSubscriptionFilter`."""

    id = Int(required=True, readonly=True)

    structural_subscription = exported(
        Reference(
            IStructuralSubscription,
            title=_("Structural subscription"),
            required=True, readonly=True))

    find_all_tags = exported(
        Bool(
            title=_("Find all tags"),
            description=_(
                "If enabled, all tags must match, "
                "else at least one tag must match."),
            required=True, default=False))
    include_any_tags = Bool(
        title=_("Include any tags"),
        required=True, default=False)
    exclude_any_tags = Bool(
        title=_("Exclude all tags"),
        required=True, default=False)
    bug_notification_level = exported(
        Choice(
            title=_("Bug notification level"), required=True,
            vocabulary=BugNotificationLevel,
            default=BugNotificationLevel.NOTHING,
            description=_("The volume and type of bug notifications "
                          "this subscription will generate.")))

    description = exported(
        Text(
            title=_("A short description of this filter"),
            required=False))

    statuses = exported(
        FrozenSet(
            title=_("The statuses interested in (empty for all)"),
            required=True, default=frozenset(),
            value_type=Choice(
                title=_('Status'), vocabulary=BugTaskStatus)))

    importances = exported(
        FrozenSet(
            title=_("The importances interested in (empty for all)"),
            required=True, default=frozenset(),
            value_type=Choice(
                title=_('Importance'), vocabulary=BugTaskImportance)))

    tags = exported(
        FrozenSet(
            title=_("The tags interested in"),
            required=True, default=frozenset(),
            value_type=SearchTag()))


class IBugSubscriptionFilterMethods(Interface):
    """Methods of `IBugSubscriptionFilter`."""

    @export_destructor_operation()
    def delete():
        """Delete this bug subscription filter."""


class IBugSubscriptionFilter(
    IBugSubscriptionFilterAttributes, IBugSubscriptionFilterMethods):
    """A bug subscription filter."""
    export_as_webservice_entry()
