# Copyright 2004-2007 Canonical Ltd.  All rights reserved.
# pylint: disable-msg=E0611,W0212

"""SQLBase implementation of IQuestionMessage."""

__metaclass__ = type

__all__ = [
    'QuestionMessage',
    ]

from zope.interface import implements

from sqlobject import ForeignKey

from canonical.database.sqlbase import SQLBase
from canonical.database.enumcol import EnumCol

from canonical.launchpad.interfaces import (
    IMessage, IQuestionMessage, QuestionAction, QuestionStatus)

from lazr.delegates import delegates


class QuestionMessage(SQLBase):
    """A table linking questions and messages."""

    implements(IQuestionMessage)

    delegates(IMessage, context='message')

    _table = 'QuestionMessage'

    question = ForeignKey(
        dbName='question', foreignKey='Question', notNull=True)
    message = ForeignKey(dbName='message', foreignKey='Message', notNull=True)

    action = EnumCol(
        schema=QuestionAction, notNull=True, default=QuestionAction.COMMENT)

    new_status = EnumCol(
        schema=QuestionStatus, notNull=True, default=QuestionStatus.OPEN)

    def __iter__(self):
        """See IMessage."""
        # Delegates do not proxy __ methods, because of the name mangling.
        return iter(self.chunks)
