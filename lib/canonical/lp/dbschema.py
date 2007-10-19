# Copyright 2004-2007 Canonical Ltd.  All rights reserved.
#
"""Database schemas

Use them like this:

  from canonical.lp.dbschema import BugTaskImportance

  print "SELECT * FROM Bug WHERE Bug.importance='%d'" % BugTaskImportance.CRITICAL

"""
__metaclass__ = type

# MAINTAINER:
#
# When you add a new DBSchema subclass, add its name to the __all__ tuple
# below.
#
# If you do not do this, from canonical.lp.dbschema import * will not
# work properly, and the thing/lp:SchemaClass will not work properly.
__all__ = (
'BranchReviewStatus',
'BugNominationStatus',
'BugAttachmentType',
'BugTrackerType',
'BugExternalReferenceType',
'BugInfestationStatus',
'BugRelationship',
'BugTaskImportance',
'CodereleaseRelationships',
'CodeImportReviewStatus',
'CveStatus',
'ImportTestStatus',
'ImportStatus',
'ShippingRequestStatus',
'ShippingService',
'SpecificationImplementationStatus',
'SpecificationFilter',
'SpecificationGoalStatus',
'SpecificationLifecycleStatus',
'SpecificationPriority',
'SpecificationSort',
'SpecificationDefinitionStatus',
'SprintSpecificationStatus',
)

from canonical.lazr import DBEnumeratedType as DBSchema
from canonical.lazr import DBItem as Item


class ImportTestStatus(DBSchema):
    """An Arch Import Autotest Result

    This enum tells us whether or not a sourcesource has been put through an
    attempted import.
    """

    NEW = Item(0, """
        Untested

        The sourcesource has not yet been tested by the autotester.
        """)

    FAILED = Item(1, """
        Failed

        The sourcesource failed to import cleanly.
        """)

    SUCCEEDED = Item(2, """
        Succeeded

        The sourcesource was successfully imported by the autotester.
        """)

class BugTrackerType(DBSchema):
    """The Types of BugTracker Supported by Launchpad

    This enum is used to differentiate between the different types of Bug
    Tracker that are supported by Malone in the Launchpad.
    """

    BUGZILLA = Item(1, """
        Bugzilla

        The godfather of open source bug tracking, the Bugzilla system was
        developed for the Mozilla project and is now in widespread use. It
        is big and ugly but also comprehensive.
        """)

    DEBBUGS = Item(2, """
        Debbugs

        The debbugs tracker is email based, and allows you to treat every
        bug like a small mailing list.
        """)

    ROUNDUP = Item(3, """
        Roundup

        Roundup is a lightweight, customisable and fast web/email based bug
        tracker written in Python.
        """)

    TRAC = Item(4, """
        Trac

        Trac is an enhanced wiki and issue tracking system for
        software development projects.
        """)

    SOURCEFORGE = Item(5, """
        SourceForge

        SourceForge is a project hosting service which includes bug,
        support and request tracking.
        """)

    MANTIS = Item(6, """
        Mantis

        Mantis is a web-based bug tracking system written in PHP.
        """)


class CveStatus(DBSchema):
    """The Status of this item in the CVE Database

    When a potential problem is reported to the CVE authorities they assign
    a CAN number to it. At a later stage, that may be converted into a CVE
    number. This indicator tells us whether or not the issue is believed to
    be a CAN or a CVE.
    """

    CANDIDATE = Item(1, """
        Candidate

        The vulnerability is a candidate, it has not yet been confirmed and
        given "Entry" status.
        """)

    ENTRY = Item(2, """
        Entry

        This vulnerability or threat has been assigned a CVE number, and is
        fully documented. It has been through the full CVE verification
        process.
        """)

    DEPRECATED = Item(3, """
        Deprecated

        This entry is deprecated, and should no longer be referred to in
        general correspondence. There is either a newer entry that better
        defines the problem, or the original candidate was never promoted to
        "Entry" status.
        """)


class SpecificationImplementationStatus(DBSchema):
    # Note that some of the states associated with this schema correlate to
    # a "not started" definition. See Specification.started_clause for
    # further information, and make sure that it is updated (together with
    # the relevant database checks) if additional states are added that are
    # also "not started".
    """Specification Delivery Status

    This tracks the implementation or delivery of the feature being
    specified. The status values indicate the progress that is being made in
    the actual coding or configuration that is needed to realise the
    feature.
    """
    # NB this state is considered "not started"
    UNKNOWN = Item(0, """
        Unknown

        We have no information on the implementation of this feature.
        """)

    # NB this state is considered "not started"
    NOTSTARTED = Item(5, """
        Not started

        No work has yet been done on the implementation of this feature.
        """)

    # NB this state is considered "not started"
    DEFERRED = Item(10, """
        Deferred

        There is no chance that this feature will actually be delivered in
        the targeted release. The specification has effectively been
        deferred to a later date of implementation.
        """)

    NEEDSINFRASTRUCTURE = Item(40, """
        Needs Infrastructure

        Work cannot proceed, because the feature depends on
        infrastructure (servers, databases, connectivity, system
        administration work) that has not been supplied.
        """)

    BLOCKED = Item(50, """
        Blocked

        Work cannot proceed on this specification because it depends on
        a separate feature that has not yet been implemented.
        (The specification for that feature should be listed as a blocker of
        this one.)
        """)

    STARTED = Item(60, """
        Started

        Work has begun, but has not yet been published
        except as informal branches or patches. No indication is given as to
        whether or not this work will be completed for the targeted release.
        """)

    SLOW = Item(65, """
        Slow progress

        Work has been slow on this item, and it has a high risk of not being
        delivered on time. Help is wanted with the implementation.
        """)

    GOOD = Item(70, """
        Good progress

        The feature is considered on track for delivery in the targeted release.
        """)

    BETA = Item(75, """
        Beta Available

        A beta version, implementing substantially all of the feature,
        has been published for widespread testing in personal package
        archives or a personal release. The code is not yet in the
        main archive or mainline branch. Testing and feedback are solicited.
        """)

    NEEDSREVIEW = Item(80, """
        Needs Code Review

        The developer is satisfied that the feature has been well
        implemented. It is now ready for review and final sign-off,
        after which it will be marked implemented or deployed.
        """)

    AWAITINGDEPLOYMENT = Item(85, """
        Deployment

        The implementation has been done, and can be deployed in the production
        environment, but this has not yet been done by the system
        administrators. (This status is typically used for Web services where
        code is not released but instead is pushed into production.
        """)

    IMPLEMENTED = Item(90, """
        Implemented

        This functionality has been delivered for the targeted release, the
        code has been uploaded to the main archives or committed to the
        targeted product series, and no further work is necessary.
        """)

    INFORMATIONAL = Item(95, """
        Informational

        This specification is informational, and does not require
        any implementation.
        """)


class SpecificationLifecycleStatus(DBSchema):
    """The current "lifecycle" status of a specification. Specs go from
    NOTSTARTED, to STARTED, to COMPLETE.
    """

    NOTSTARTED = Item(10, """
        Not started

        No work has yet been done on this feature.
        """)

    STARTED = Item(20, """
        Started

        This feature is under active development.
        """)

    COMPLETE = Item(30, """
        Complete

        This feature has been marked "complete" because no further work is
        expected. Either the feature is done, or it has been abandoned.
        """)


class SpecificationPriority(DBSchema):
    """The Priority with a Specification must be implemented.

    This enum is used to prioritise work.
    """

    NOTFORUS = Item(0, """
        Not

        This feature has been proposed but the project leaders have decided
        that it is not appropriate for inclusion in the mainline codebase.
        See the status whiteboard or the
        specification itself for the rationale for this decision. Of course,
        you are welcome to implement it in any event and publish that work
        for consideration by the community and end users, but it is unlikely
        to be accepted by the mainline developers.
        """)

    UNDEFINED = Item(5, """
        Undefined

        This feature has recently been proposed and has not yet been
        evaluated and prioritised by the project leaders.
        """)

    LOW = Item(10, """
        Low

        We would like to have it in the
        code, but it's not on any critical path and is likely to get bumped
        in favour of higher-priority work. The idea behind the specification
        is sound and the project leaders would incorporate this
        functionality if the work was done. In general, "low" priority
        specifications will not get core resources assigned to them.
        """)

    MEDIUM = Item(50, """
        Medium

        The project developers will definitely get to this feature,
        but perhaps not in the next major release or two.
        """)

    HIGH = Item(70, """
        High

        Strongly desired by the project leaders.
        The feature will definitely get review time, and contributions would
        be most effective if directed at a feature with this priority.
        """)

    ESSENTIAL = Item(90, """
        Essential

        The specification is essential for the next release, and should be
        the focus of current development. Use this state only for the most
        important of all features.
        """)


class SpecificationFilter(DBSchema):
    """An indicator of the kinds of specifications that should be returned
    for a listing of specifications.

    This is used by browser classes that are generating a list of
    specifications for a person, or product, or project, to indicate what
    kinds of specs they want returned. The different filters can be OR'ed so
    that multiple pieces of information can be used for the filter.
    """
    ALL = Item(0, """
        All

        This indicates that the list should simply include ALL
        specifications for the underlying object (person, product etc).
        """)

    COMPLETE = Item(5, """
        Complete

        This indicates that the list should include only the complete
        specifications for this object.
        """)

    INCOMPLETE = Item(10, """
        Incomplete

        This indicates that the list should include the incomplete items
        only. The rules for determining if a specification is incomplete are
        complex, depending on whether or not the spec is informational.
        """)

    INFORMATIONAL = Item(20, """
        Informational

        This indicates that the list should include only the informational
        specifications.
        """)

    PROPOSED = Item(30, """
        Proposed

        This indicates that the list should include specifications that have
        been proposed as goals for the underlying objects, but not yet
        accepted or declined.
        """)

    DECLINED = Item(40, """
        Declined

        This indicates that the list should include specifications that were
        declined as goals for the underlying productseries or distroseries.
        """)

    ACCEPTED = Item(50, """
        Accepted

        This indicates that the list should include specifications that were
        accepted as goals for the underlying productseries or distroseries.
        """)

    VALID = Item(55, """
        Valid

        This indicates that the list should include specifications that are
        not obsolete or superseded.
        """)

    CREATOR = Item(60, """
        Creator

        This indicates that the list should include specifications that the
        person registered in Launchpad.
        """)

    ASSIGNEE = Item(70, """
        Assignee

        This indicates that the list should include specifications that the
        person has been assigned to implement.
        """)

    APPROVER = Item(80, """
        Approver

        This indicates that the list should include specifications that the
        person is supposed to review and approve.
        """)

    DRAFTER = Item(90, """
        Drafter

        This indicates that the list should include specifications that the
        person is supposed to draft. The drafter is usually only needed
        during spec sprints when there's a bottleneck on guys who are
        assignees for many specs.
        """)

    SUBSCRIBER = Item(100, """
        Subscriber

        This indicates that the list should include all the specifications
        to which the person has subscribed.
        """)

    FEEDBACK = Item(110, """
        Feedback

        This indicates that the list should include all the specifications
        which the person has been asked to provide specific feedback on.
        """)


class SpecificationSort(DBSchema):
    """A preferred sorting scheme for the results of a query about
    specifications.

    This is usually used in interfaces which ask for a filtered list of
    specifications, so that you can tell which specifications you would
    expect to see first.

    NB: this is not really a "dbschema" in that is doesn't map to an int
    that is stored in the db. In future, we will likely have a different way
    of defining such enums.
    """
    DATE = Item(10, """
        Date

        This indicates a preferred sort order of date of creation, newest
        first.
        """)

    PRIORITY = Item(20, """
        Priority

        This indicates a preferred sort order of priority (highest first)
        followed by status. This is the default sort order when retrieving
        specifications from the system.
        """)


class SpecificationDefinitionStatus(DBSchema):
    """The current status of a Specification

    This enum tells us whether or not a specification is approved, or still
    being drafted, or implemented, or obsolete in some way. The ordinality
    of the values is important, it's the order (lowest to highest) in which
    we probably want them displayed by default.
    """

    APPROVED = Item(10, """
        Approved

        The project team believe that the specification is ready to be
        implemented, without substantial issues being encountered.
        """)

    PENDINGAPPROVAL = Item(15, """
        Pending Approval

        Reviewed and considered ready for final approval.
        The reviewer believes the specification is clearly written,
        and adequately addresses all important issues that will
        be raised during implementation.
        """)

    PENDINGREVIEW = Item(20, """
        Review

        Has been put in a reviewer's queue. The reviewer will
        assess it for clarity and comprehensiveness, and decide
        whether further work is needed before the spec can be considered for
        actual approval.
        """)

    DRAFT = Item(30, """
        Drafting

        The specification is actively being drafted, with a drafter in place
        and frequent revision occurring.
        Do not park specs in the "drafting" state indefinitely.
        """)

    DISCUSSION = Item(35, """
        Discussion

        Still needs active discussion, at a sprint for example.
        """)

    NEW = Item(40, """
        New

        No thought has yet been given to implementation strategy, dependencies,
        or presentation/UI issues.
        """)

    SUPERSEDED = Item(60, """
        Superseded

        Still interesting, but superseded by a newer spec or set of specs that
        clarify or describe a newer way to implement the desired feature.
        Please use the newer specs and not this one.
        """)

    OBSOLETE = Item(70, """
        Obsolete

        The specification has been obsoleted, probably because it was decided
        against. People should not put any effort into implementing it.
        """)


class SpecificationGoalStatus(DBSchema):
    """The target status for this specification

    This enum allows us to show whether or not the specification has been
    approved or declined as a target for the given product series or distro
    release.
    """

    ACCEPTED = Item(10, """
        Accepted

        The drivers have confirmed that this specification is targeted to
        the stated distribution release or product series.
        """)

    DECLINED = Item(20, """
        Declined

        The drivers have decided not to accept this specification as a goal
        for the stated distribution release or product series.
        """)

    PROPOSED = Item(30, """
        Proposed

        This spec has been submitted as a potential goal for the stated
        product series or distribution release, but the drivers have not yet
        accepted or declined that goal.
        """)


class SprintSpecificationStatus(DBSchema):
    """The current approval status of the spec on this sprint's agenda.

    This enum allows us to know whether or not the meeting admin team has
    agreed to discuss an item.
    """

    ACCEPTED = Item(10, """
        Accepted

        The meeting organisers have confirmed this topic for the meeting
        agenda.
        """)

    DECLINED = Item(20, """
        Declined

        This spec has been declined from the meeting agenda
        because of a lack of available resources, or uncertainty over
        the specific requirements or outcome desired.
        """)

    PROPOSED = Item(30, """
        Proposed

        This spec has been submitted for consideration by the meeting
        organisers. It has not yet been accepted or declined for the
        agenda.
        """)


class ImportStatus(DBSchema):
    """This schema describes the states that a SourceSource record can take
    on."""

    DONTSYNC = Item(1, """
        Do Not Import

        Launchpad will not attempt to make a Bazaar import.
        """)

    TESTING = Item(2, """
        Testing

        Launchpad has not yet attempted this import. The vcs-imports operator
        will review the source details and either mark the series \"Do not
        sync\", or perform a test import. If the test import is successful, a
        public import will be created. After the public import completes, it
        will be updated automatically.
        """)

    TESTFAILED = Item(3, """
        Test Failed

        The test import has failed. We will do further tests, and plan to
        complete this import eventually, but it may take a long time. For more
        details, you can ask on the launchpad-users@canonical.com mailing list
        or on IRC in the #launchpad channel on irc.freenode.net.
        """)

    AUTOTESTED = Item(4, """
        Test Successful

        The test import was successful. The vcs-imports operator will lock the
        source details for this series and perform a public Bazaar import.
        """)

    PROCESSING = Item(5, """
        Processing

        The public Bazaar import is being created. When it is complete, a
        Bazaar branch will be published and updated automatically. The source
        details for this series are locked and can only be modified by
        vcs-imports members and Launchpad administrators.
        """)

    SYNCING = Item(6, """
        Online

        The Bazaar import is published and automatically updated to reflect the
        upstream revision control system. The source details for this series
        are locked and can only be modified by vcs-imports members and
        Launchpad administrators.
        """)

    STOPPED = Item(7, """
        Stopped

        The Bazaar import has been suspended and is no longer updated. The
        source details for this series are locked and can only be modified by
        vcs-imports members and Launchpad administrators.
        """)


class CodereleaseRelationships(DBSchema):
    """Coderelease Relationships

    Code releases are both upstream releases and distribution source package
    releases, and in this schema we document the relationships that Launchpad
    understands between these two.
    """

    PACKAGES = Item(1, """
        Packages

        The subject is a distribution packing of the object. For example,
        apache2-2.0.48-1 "packages" the upstream apache2.0.48.tar.gz.
        """)

    REPLACES = Item(2, """
        Replaces

        A subsequent release in the same product series typically
        "replaces" the prior release. For example, apache2.0.48
        "replaces" apache2.0.47. Similarly, within the distribution
        world, apache-2.0.48-3ubuntu2 "replaces" apache2-2.0.48-3ubuntu2.
        """)

    DERIVESFROM = Item(3, """
        Derives From

        The subject package derives from the object package. It is common
        for distributions to build on top of one another's work, creating
        source packages that are modified versions of the source package
        in a different distribution, and this relationship captures that
        concept.
        """)


class CodeImportReviewStatus(DBSchema):
    """CodeImport review status.

    Before a code import is performed, it is reviewed. Only reviewed imports
    are processed.
    """

    NEW = Item(1, """Pending Review

    This code import request has recently been filed an has not been reviewed
    yet.
    """)

    INVALID = Item(10, """Invalid

    This code import will not be processed.
    """)

    REVIEWED = Item(20, """Reviewed

    This code import has been approved and will be processed.
    """)

    SUSPENDED = Item(30, """Suspended

    This code import has been approved, but it has been suspended and is not
    processed.""")


class BugInfestationStatus(DBSchema):
    """Bug Infestation Status

    Malone is the bug tracking application that is part of Launchpad. It
    tracks the status of bugs in different distributions as well as
    upstream. This schema documents the kinds of infestation of a bug
    in a coderelease.
    """

    AFFECTED = Item(60, """
        Affected

        It is believed that this bug affects that coderelease. The
        verifiedby field will indicate whether that has been verified
        by a package maintainer.
        """)

    DORMANT = Item(50, """
        Dormant

        The bug exists in the code of this coderelease, but it is dormant
        because that codepath is unused in this release.
        """)

    VICTIMIZED = Item(40, """
        Victimized

        This code release does not actually contain the buggy code, but
        it is affected by the bug nonetheless because of the way it
        interacts with the products or packages that are actually buggy.
        Often users will report a bug against the package which displays
        the symptoms when the bug itself lies elsewhere.
        """)

    FIXED = Item(30, """
        Fixed

        It is believed that the bug is actually fixed in this release of code.
        Setting the "fixed" flag allows us to generate lists of bugs fixed
        in a release.
        """)

    UNAFFECTED = Item(20, """
        Unaffected

        It is believed that this bug does not infest this release of code.
        """)

    UNKNOWN = Item(10, """
        Unknown

        We don't know if this bug infests that coderelease.
        """)


class BranchReviewStatus(DBSchema):
    """Branch Review Cycle

    This is an indicator of what the project thinks about this branch.
    Typically, it will be set by the upstream as part of a review process
    before the branch lands on an official series.
    """

    NONE = Item(10, """
        None

        This branch has not been queued for review, and no review has been
        done on it.
        """)

    REQUESTED = Item(20, """
        Requested

        The author has requested a review of the branch. This usually
        indicates that the code is mature and ready for merging, but it may
        also indicate that the author would like some feedback on the
        direction in which he is headed.
        """)

    NEEDSWORK = Item(30, """
        Needs Further Work

        The reviewer feels that this branch is not yet ready for merging, or
        is not on the right track. Detailed comments would be found in the
        reviewer discussion around the branch, see those for a list of the
        issues to be addressed or discussed.
        """)

    MERGECONDITIONAL = Item(50, """
        Conditional Merge Approved

        The reviewer has said that this branch can be merged if specific
        issues are addressed. The review feedback will be contained in the
        branch discussion. Once those are addressed by the author the branch
        can be merged without further review.
        """)

    MERGEAPPROVED = Item(60, """
        Merge Approved

        The reviewer is satisfied that the branch can be merged without
        further changes.
        """)


class BugNominationStatus(DBSchema):
    """Bug Nomination Status

    The status of the decision to fix a bug in a specific release.
    """

    PROPOSED = Item(10, """
        Nominated

        This nomination hasn't yet been reviewed, or is still under
        review.
        """)

    APPROVED = Item(20, """
        Approved

        The release management team has approved fixing the bug for this
        release.
        """)

    DECLINED = Item(30, """
        Declined

        The release management team has declined fixing the bug for this
        release.
        """)


class BugTaskImportance(DBSchema):
    """Bug Task Importance

    Importance is used by developers and their managers to indicate how
    important fixing a bug is. Importance is typically a combination of the
    harm caused by the bug, and how often it is encountered.
    """

    UNKNOWN = Item(999, """
        Unknown

        The severity of this bug task is unknown.
        """)

    CRITICAL = Item(50, """
        Critical

        This bug is essential to fix as soon as possible. It affects
        system stability, data integrity and / or remote access
        security.
        """)

    HIGH = Item(40, """
        High

        This bug needs urgent attention from the maintainer or
        upstream. It affects local system security or data integrity.
        """)

    MEDIUM = Item(30, """
        Medium

        This bug warrants an upload just to fix it, but can be put
        off until other major or critical bugs have been fixed.
        """)

    LOW = Item(20, """
        Low

        This bug does not warrant an upload just to fix it, but
        should if possible be fixed when next the maintainer does an
        upload. For example, it might be a typo in a document.
        """)

    WISHLIST = Item(10, """
        Wishlist

        This is not a bug, but is a request for an enhancement or
        new feature that does not yet exist in the package. It does
        not affect system stability, it might be a usability or
        documentation fix.
        """)

    UNDECIDED = Item(5, """
        Undecided

        A relevant developer or manager has not yet decided how
        important this bug is.
        """)


class BugExternalReferenceType(DBSchema):
    """Bug External Reference Type

    Malone allows external information references to be attached to
    a bug. This schema lists the known types of external references.
    """

    CVE = Item(1, """
        CVE Reference

        This external reference is a CVE number, which means it
        exists in the CVE database of security bugs.
        """)

    URL = Item(2, """
        URL

        This external reference is a URL. Typically that means it
        is a reference to a web page or other internet resource
        related to the bug.
        """)


class BugRelationship(DBSchema):
    """Bug Relationship

    Malone allows for rich relationships between bugs to be specified,
    and this schema lists the types of relationships supported.
    """

    RELATED = Item(1, """
        Related Bug

        This indicates that the subject and object bugs are related in
        some way. The order does not matter. When displaying one bug, it
        would be appropriate to list the other bugs which are related to it.
        """)


class BugAttachmentType(DBSchema):
    """Bug Attachment Type.

    An attachment to a bug can be of different types, since for example
    a patch is more important than a screenshot. This schema describes the
    different types.
    """

    PATCH = Item(1, """
        Patch

        This is a patch that potentially fixes the bug.
        """)

    UNSPECIFIED = Item(2, """
        Unspecified

        This is everything else. It can be a screenshot, a log file, a core
        dump, etc. Basically anything that adds more information to the bug.
        """)
