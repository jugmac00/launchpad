
# Bugzilla schema:
#  http://lxr.mozilla.org/mozilla/source/webtools/bugzilla/Bugzilla/DB/Schema.pm

# XXX: 20051018 jamesh
# Currently unhandled bug info:
#  * Operating system and platform
#  * version (not really used in Ubuntu bugzilla though)
#  * target milestone
#  * keywords
#  * private bugs (none of the canonical-only bugs seem sensitive though)
#  * bug dependencies
#  * duplicate bugs
#  * "bug XYZ" references inside comment text (would need a second pass)
#
# Not all of these are necessary though

__metaclass__ = type

from cStringIO import StringIO
import logging
import datetime
import pytz

from zope.component import getUtility
from canonical.launchpad.interfaces import (
    IPersonSet, IDistributionSet, ISourcePackageSet, IBugSet,
    IBugTrackerSet, IBugExternalRefSet, IBugAttachmentSet,
    IMessageSet, ILibraryFileAliasSet, ICveSet, NotFoundError)
from canonical.lp.dbschema import (
    BugTaskSeverity, BugTaskStatus, BugTaskPriority, BugAttachmentType)

logger = logging.getLogger('canonical.launchpad.scripts.bugzilla')

def add_tz(dt):
    """Convert a naiive datetime value to a UTC datetime value."""
    assert dt.tzinfo is None, 'add_tz() only accepts naiive datetime values'
    return datetime.datetime(dt.year, dt.month, dt.day,
                             dt.hour, dt.minute, dt.second,
                             dt.microsecond, tzinfo=pytz.timezone('UTC'))


class PersonMapping:
    """A class to keep track of a mapping from Bugzilla people to
    Launchpad people."""

    def __init__(self, conn):
        self.cursor = conn.cursor()
        self.personset = getUtility(IPersonSet)
        self.mapping = {}

    def get(self, bugzilla_id):
        person = None

        # Try and get the person using a cache of the mapping.  We
        # check to make sure the person still exists and has not been
        # merged.
        launchpad_id = self.mapping.get(bugzilla_id)
        if launchpad_id is not None:
            try:
                person = self.personset[launchpad_id]
                if person.merged is not None:
                    person = None
            except KeyError:
                pass

        # look up the person
        if person is None:
            self.cursor.execute('SELECT login_name, realname '
                                '  FROM profiles '
                                '  WHERE userid = %d' % bugzilla_id)
            (email, displayname) = self.cursor.fetchone()

            person = self.personset.ensurePerson(
                email=email, displayname=displayname)
            self.mapping[bugzilla_id] = person.id

        return person


class Bug:
    """Representation of a Bugzilla Bug"""
    def __init__(self, conn, bug_id):
        self.cursor = conn.cursor()
        self.cursor.execute(
            'SELECT bug_id, assigned_to, bug_file_loc, bug_severity, '
            '    bug_status, creation_ts, short_desc, op_sys, priority, '
            '    products.name, rep_platform, reporter, version, '
            '    components.name, resolution, target_milestone, qa_contact, '
            '    status_whiteboard, keywords, alias '
            '  FROM bugs '
            '    INNER JOIN products ON bugs.product_id = products.id '
            '    INNER JOIN components ON bugs.component_id = components.id '
            '  WHERE bug_id = %d' % bug_id)
        (self.bug_id, self.assigned_to, self.bug_file_loc, self.bug_severity,
         self.bug_status, self.creation_ts, self.short_desc, self.op_sys,
         self.priority, self.product, self.rep_platform, self.reporter,
         self.version, self.component, self.resolution,
         self.target_milestone, self.qa_contact, self.status_whiteboard,
         self.keywords, self.alias) = self.cursor.fetchone()

        # fix up date ...
        self.creation_ts = add_tz(self.creation_ts)

        self._ccs = None
        self._comments = None
        self._attachments = None

    @property
    def ccs(self):
        """Return the IDs of people CC'd to this bug"""
        if self._ccs is not None: return self._ccs
        
        self.cursor.execute('SELECT who FROM cc WHERE bug_id = %d'
                            % self.bug_id)
        self._ccs = [row[0] for row in self.cursor.fetchall()]
        return self._ccs

    @property
    def comments(self):
        """Return the comments attached to this bug"""
        if self._comments is not None: return self._comments
        
        self.cursor.execute('SELECT who, bug_when, thetext '
                            '  FROM longdescs '
                            '  WHERE bug_id = %d '
                            '  ORDER BY bug_when' % self.bug_id)
        self._comments = []
        for row in self.cursor.fetchall():
            self._comments.append((row[0], add_tz(row[1]), row[2]))
        return self._comments

    @property
    def attachments(self):
        """Return the attachments for this bug"""
        if self._attachments is not None: return self._attachments

        self.cursor.execute('SELECT attach_id, creation_ts, description, '
                            '    mimetype, ispatch, filename, thedata, '
                            '    submitter_id '
                            '  FROM attachments '
                            '  WHERE bug_id = %d '
                            '  ORDER BY attach_id' % self.bug_id)
        self._attachments = []
        for row in self.cursor.fetchall():
            self._attachments.append((row[0], add_tz(row[1]), row[2], row[3],
                                      bool(row[4]), row[5], row[6], row[7]))
        return self._attachments

    def map_severity(self, bugtask):
        bugtask.severity = {
            'blocker': BugTaskSeverity.CRITICAL,
            'critical': BugTaskSeverity.CRITICAL,
            'major': BugTaskSeverity.MAJOR,
            'normal': BugTaskSeverity.NORMAL,
            'minor': BugTaskSeverity.MINOR,
            'trivial': BugTaskSeverity.MINOR,
            'enhancement': BugTaskSeverity.WISHLIST
            }.get(self.bug_severity, BugTaskSeverity.NORMAL)

    def map_priority(self, bugtask):
        bugtask.priority = {
            'P1': BugTaskPriority.HIGH,
            'P2': BugTaskPriority.MEDIUM,
            'P3': BugTaskPriority.MEDIUM,
            'P4': BugTaskPriority.LOW,
            'P5': BugTaskPriority.LOW
            }.get(self.priority, BugTaskPriority.MEDIUM)

    def map_status(self, bugtask):
        if self.bug_status == 'ASSIGNED':
            bugtask.status = BugTaskStatus.ACCEPTED
        elif self.bug_status == 'PENDINGUPLOAD':
            bugtask.status = BugTaskStatus.PENDING
        elif self.bug_status in ['RESOLVED', 'VERIFIED', 'CLOSED']:
            # depends on the resolution:
            if self.resolution == 'FIXED':
                bugtask.status = BugTaskStatus.FIXED
            elif self.resolution == 'WONTFIX':
                bugtask.status = BugTaskStatus.REJECTED
                bugtask.priority = BugTaskPriority.WONTFIX
            else:
                bugtask.status = BugTaskStatus.REJECTED
        else:
            bugtask.status = BugTaskStatus.NEW

        # add the status to the notes section, to account for any lost
        # information
        bugzilla_status = 'Bugzilla status=%s' % self.bug_status
        if self.resolution:
            bugzilla_status += ' %s' % self.resolution
        bugzilla_status += ', product=%s' % self.product
        bugzilla_status += ', component=%s' % self.component

        if bugtask.statusexplanation:
            bugtask.statusexplanation = '%s (%s)' % (bugtask.statusexplanation,
                                                     bugzilla_status)
        else:
            bugtask.statusexplanation = bugzilla_status


class Bugzilla:
    """Representation of a bugzilla instance"""

    bugtracker_name = 'ubuntu-bugzilla'

    def __init__(self, conn):
        self.conn = conn
        self.cursor = conn.cursor
        self.bugtracker = getUtility(IBugTrackerSet)[self.bugtracker_name]
        self.bugset = getUtility(IBugSet)
        self.cveset = getUtility(ICveSet)
        self.extrefset = getUtility(IBugExternalRefSet)
        self.people = PersonMapping(conn)

    def get_lp_bugtarget(self, bug):
        """Returns a dictionary of arguments to createBug() that correspond
        to the given bugzilla bug.
        """
        # we currently only support mapping Ubuntu bugs ...
        assert bug.product == 'Ubuntu'
        
        ubuntu = getUtility(IDistributionSet)['ubuntu']
        srcpkgset = getUtility(ISourcePackageSet)
        try:
            srcpkg, binpkg = srcpkgset.getPackageNames(bug.component)
        except ValueError:
            srcpkg = binpkg = None

        return {
            'distribution': ubuntu,
            'sourcepackagename': srcpkg,
            'binarypackagename': binpkg
            }

    def handle_bug(self, bug_id):
        logger.info('Handling Bugzilla bug %d', bug_id)
        
        # is there a bug watch on the bug?
        lp_bug = self.bugset.queryByRemoteBug(self.bugtracker, bug_id)

        # if we already have an associated bug, don't add a new one.
        if lp_bug is not None:
            logger.info('Bugzilla bug %d is already being watched by '
                        'Launchpad bug %d', bug_id, lp_bug.id)
            return lp_bug

        bug = Bug(self.conn, bug_id)

        comments = bug.comments[:]

        # create a message for the initial comment:
        msgset = getUtility(IMessageSet)
        who, when, text = comments.pop(0)
        msg = msgset.fromText(bug.short_desc, text, self.people.get(who), when)

        # create the bug
        target = self.get_lp_bugtarget(bug)
        lp_bug = self.bugset.createBug(msg=msg,
                                       datecreated=bug.creation_ts,
                                       title=bug.short_desc,
                                       owner=self.people.get(bug.reporter),
                                       **target)

        # add the bug watch:
        lp_bug.addWatch(self.bugtracker, bug.bug_id, lp_bug.owner)

        # add remaining comments, and add CVEs found in all text
        lp_bug.findCvesInText(text)
        for (who, when, text) in comments:
             msg = msgset.fromText(msg.followup_title, text,
                                   self.people.get(who), when)
             lp_bug.linkMessage(msg)
             lp_bug.findCvesInText(text)

        # subscribe QA contact and CC's
        if bug.qa_contact:
            lp_bug.subscribe(self.people.get(bug.qa_contact))
        for cc in bug.ccs:
            lp_bug.subscribe(self.people.get(cc))

        # if a URL is associated with the bug, add it:
        if bug.bug_file_loc:
            self.extrefset.createBugExternalRef(lp_bug, bug.bug_file_loc,
                                                bug.bug_file_loc,
                                                lp_bug.owner)

        # translate bugzilla status and severity to LP equivalents
        task = lp_bug.bugtasks[0]
        task.datecreated = bug.creation_ts
        task.assignee = self.people.get(bug.assigned_to)
        task.statusexplanation = bug.status_whiteboard
        bug.map_severity(task)
        bug.map_priority(task)
        bug.map_status(task)

        # XXX: translate milestone linkage

        # import attachments
        for (attach_id, creation_ts, description, mimetype, ispatch,
             filename, thedata, submitter_id) in bug.attachments:
            logger.debug('Creating attachment %s for bug %d',
                         filename, bug.bug_id)
            if ispatch:
                attach_type = BugAttachmentType.PATCH
                mimetype = 'text/plain'
            else:
                attach_type = BugAttachmentType.UNSPECIFIED

            # look for a message starting with "Created an attachment (id=NN)"
            for msg in lp_bug.messages:
                if msg.contents.startswith('Created an attachment (id=%d)'
                                           % attach_id):
                    break
            else:
                # could not find the add message, so create one:
                msg = msgset.fromText(description,
                                      'Created attachment %s' % filename,
                                      self.people.get(submitter_id),
                                      creation_ts)
                lp_bug.linkMessage(msg)

            filealias = getUtility(ILibraryFileAliasSet).create(
                name=filename,
                size=len(thedata),
                file=StringIO(thedata),
                contentType=mimetype)

            getUtility(IBugAttachmentSet).create(
                bug=lp_bug, filealias=filealias, attach_type=attach_type,
                title=description, message=msg)
