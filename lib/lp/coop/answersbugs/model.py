# Copyright 2009-2010 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""SQLBase implementation of IQuestionBug."""

__metaclass__ = type

__all__ = ['QuestionBug']

from sqlobject import ForeignKey

from lp.services.database.constants import UTC_NOW
from lp.services.database.datetimecol import UtcDateTimeCol
from lp.services.database.sqlbase import SQLBase


class QuestionBug(SQLBase):
    """A link between a question and a bug."""

    _table = 'QuestionBug'

    question = ForeignKey(
        dbName='question', foreignKey='Question', notNull=True)
    bug = ForeignKey(dbName='bug', foreignKey='Bug', notNull=True)
    date_created = UtcDateTimeCol(notNull=True, default=UTC_NOW)
