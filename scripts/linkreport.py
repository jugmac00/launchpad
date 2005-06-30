#!/usr/bin/env python
# Copyright 2004-2005 Canonical Ltd.  All rights reserved.
"""
Process LinkChecker .csv results for the staging server, stuff them into
a database and generate a report suitable for spamming developers with.
"""

__metaclass__ = type

import _pythonpath

import csv, re, sys
from StringIO import StringIO
from optparse import OptionParser
from sqlobject import StringCol, IntCol, BoolCol, FloatCol, DatabaseIndex
from canonical.database.datetimecol import UtcDateTimeCol
from canonical.database.constants import UTC_NOW
from canonical.launchpad.scripts import db_options, logger_options, logger
from canonical.lp import initZopeless
from canonical.database.sqlbase import SQLBase
from canonical.config import config
from canonical.launchpad.mail import simple_sendmail


class BrokenLink(SQLBase):
    _table = 'BrokenLink'
    urlname = StringCol(notNull=True)
    recursionlevel = IntCol(notNull=True)
    parentname = StringCol(notNull=True)
    baseref = StringCol(notNull=True)
    result = StringCol(notNull=True)
    resultcode = IntCol(notNull=True)
    warningstring = StringCol(notNull=True)
    infostring = StringCol(notNull=True)
    valid = BoolCol(notNull=True)
    url = StringCol(notNull=True, unique=True, alternateID=True)
    line = IntCol(notNull=True)
    col = IntCol(notNull=True)
    name = StringCol(notNull=True)
    dltime = FloatCol()
    dlsize = IntCol()
    checktime = FloatCol(notNull=True)
    since = UtcDateTimeCol(notNull=True, default=UTC_NOW)
    #cached = BoolCol(notNull=True)

    resultcode_index = DatabaseIndex('resultcode')
    recursionlevel_index = DatabaseIndex('recursionlevel')


def main(csvfile, log):

    # Where we store broken links
    broken = set()

    # Suck in the csv file, updating the database and adding to the broken set
    reader = csv.DictReader(
            (line for line in csvfile if not line.startswith('#'))
            )
    for row in reader:
        # Get the result code
        m = re.search('^(\d+)', row['result'])
        if m is None:
            if row['result'] == 'URL is empty':
                continue
            elif 'The read operation timed out' in row['result']:
                row['result'] = '504 %s' % row['result']
                row['resultcode'] = 504
            else:
                raise RuntimeError("Bad result %s" % repr(row["result"]))
        else:
            row['resultcode'] = int(m.group(1))

        # Cast input and nuke crap (to avoid confusing SQLObject)
        row['recursionlevel'] = int(row['recursionlevel'])
        row['valid'] = row['valid'] in ('True', 'true')
        row['line'] = int(row['line'])
        row['col'] = int(row['column']) # Renamed - column is a SQL keyword
        del row['column']
        row['dltime'] = float(row['dltime'])
        row['dlsize'] = int(row['dlsize'])
        row['checktime'] = float(row['checktime'])
        del row['cached']

        try:
            link = BrokenLink.byUrl(row['url'])
            link.set(**row)
        except LookupError:
            link = BrokenLink(**row)
        broken.add(link)

    total = len(broken)

    # Delete any entries that now pass
    for link in BrokenLink.select():
        if link in broken:
            continue
        link.destroySelf()

    new_broken_links = BrokenLink.select("""
        since > CURRENT_TIMESTAMP AT TIME ZONE 'UTC'
            - '1 day 12 hours'::interval
        """, orderBy=["recursionlevel", "parentname", "url"])

    rep = report("New Arrivals", new_broken_links, total, since=False)

    old_broken_links = BrokenLink.select("""
        since <= CURRENT_TIMESTAMP AT TIME ZONE 'UTC'
            - '1 day 12 hours'::interval
        AND since > CURRENT_TIMESTAMP AT TIME ZONE 'UTC' - '14 days'::interval
        """, orderBy=["recursionlevel", "parentname", "url"])

    rep += report("Old Favorites", old_broken_links, total, since=True)

    antique_broken_links = BrokenLink.select("""
        since <= CURRENT_TIMESTAMP AT TIME ZONE 'UTC' - '14 days'::interval
        """, orderBy=["since", "recursionlevel", "parentname", "url"])

    rep += report("Hall of Shame", antique_broken_links, total, since=True)

    if not options.email:
        # Print to stdout in system encoding - might raise UnicodeError on
        # some systems. Tough.
        print rep
    else:
        # Override this setting - we are only here if email explicitly
        # requested on the command line.
        config.zopeless.send_email = True
        simple_sendmail(
                "noreply@canonical.com", [options.email], options.subject,
                rep, {'Keywords': 'LinkChecker', 'X-Fnord': 'Fnord'}
                )

def report(title, links, total, since=True):

    out = StringIO()

    heading = "%s (%d/%d)" % (title, links.count(), total)
    print >> out, heading
    print >> out, "=" * len(heading)

    def print_row(title, value):
        print >> out, "%-6s: %s" % (title, str(value))

    for link in links:
        print_row("Parent", link.parentname)
        print_row("Link", link.url)
        print_row("Result", link.result)
        if since:
            print_row("Since", link.since.strftime('%A %d %B %Y'))
        print >> out
    print >> out

    return out.getvalue()


if __name__ == '__main__':
    parser = OptionParser("Usage: %prog [OPTIONS] [input.csv]")
    db_options(parser)
    logger_options(parser)

    parser.add_option(
            "-c", "--create", action="store_true", dest="create",
            default=False, help="Create the database tables"
            )

    parser.add_option(
            "-s", "--subject", dest="subject", help="Email using SUBJECT",
            metavar="SUBJECT", default="LinkChecker report"
            )

    parser.add_option(
            "-t", "--to", dest="email", help="Email to ADDRESS",
            metavar="ADDRESS", default=None
            )
    
    options, args = parser.parse_args()

    log = logger(options)

    if len(args) == 0 or args[0] == '-':
        log.debug("Reading from stdin")
        csvfile = sys.stdin
    else:
        csvfile = open(args[0], 'rb')

    ztm = initZopeless(implicitBegin=True)

    if options.create:
        # Create the table if it doesn't exist. Unfortunately, this is broken
        # so we only create the table if requested on the command line
        BrokenLink.createTable(ifNotExists=True)

    main(csvfile, log)
    ztm.commit()

