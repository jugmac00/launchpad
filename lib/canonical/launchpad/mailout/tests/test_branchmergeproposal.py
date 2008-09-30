# Copyright 2008 Canonical Ltd.  All rights reserved.

"""Tests for BranchMergeProposal mailings"""

from unittest import TestLoader, TestCase

from zope.security.proxy import removeSecurityProxy

from canonical.testing import LaunchpadFunctionalLayer

from canonical.launchpad.components.branch import BranchMergeProposalDelta
from canonical.launchpad.database import CodeReviewVoteReference
from canonical.launchpad.event import SQLObjectModifiedEvent
from canonical.launchpad.ftests import login, login_person
from canonical.launchpad.interfaces import (
    BranchSubscriptionNotificationLevel, CodeReviewNotificationLevel)
from canonical.launchpad.mailout.branch import RecipientReason
from canonical.launchpad.mailout.branchmergeproposal import (
    BMPMailer, send_merge_proposal_modified_notifications)
from canonical.launchpad.tests.mail_helpers import pop_notifications
from canonical.launchpad.webapp import canonical_url
from canonical.launchpad.testing import (
    LaunchpadObjectFactory, TestCaseWithFactory)


class TestMergeProposalMailing(TestCase):
    """Test that reasonable mailings are generated"""

    layer = LaunchpadFunctionalLayer

    def setUp(self):
        TestCase.setUp(self)
        login('foo.bar@canonical.com')
        self.factory = LaunchpadObjectFactory()

    def makeProposalWithSubscriber(self):
        registrant = self.factory.makePerson(
            displayname='Baz Qux', email='baz.qux@example.com')
        bmp = self.factory.makeBranchMergeProposal(registrant=registrant)
        subscriber = self.factory.makePerson(displayname='Baz Quxx',
            email='baz.quxx@example.com')
        bmp.source_branch.subscribe(subscriber,
            BranchSubscriptionNotificationLevel.NOEMAIL, None,
            CodeReviewNotificationLevel.FULL)
        bmp.source_branch.title = 'foo'
        bmp.target_branch.title = 'bar'
        return bmp, subscriber

    def test_generateCreationEmail(self):
        """Ensure that the contents of the mail are as expected"""
        bmp, subscriber = self.makeProposalWithSubscriber()
        bmp.whiteboard = "I think this would be good."
        mailer = BMPMailer.forCreation(bmp, bmp.registrant)
        assert mailer.message_id is not None, 'Message-id should be set'
        mailer.message_id = '<foobar-example-com>'
        reason = mailer._recipients.getReason(
            subscriber.preferredemail.email)[0]
        bmp.root_message_id = None
        headers, subject, body = mailer.generateEmail(subscriber)
        self.assertEqual("""\
Baz Qux has proposed merging foo into bar.

Whiteboard:
I think this would be good.

--\x20
%s
%s
""" % (canonical_url(bmp), reason.getReason()), body)
        self.assertEqual('Proposed merge of foo into bar', subject)
        self.assertEqual(
            {'X-Launchpad-Branch': bmp.source_branch.unique_name,
             'X-Launchpad-Message-Rationale': 'Subscriber',
             'X-Launchpad-Project': bmp.source_branch.product.name,
             'Reply-To': bmp.address,
             'Message-Id': '<foobar-example-com>'},
             headers)
        self.assertEqual('Baz Qux <baz.qux@example.com>', mailer.from_address)
        mailer.sendAll()

    def test_RecordMessageId(self):
        """Ensure that the contents of the mail are as expected"""
        bmp, subscriber = self.makeProposalWithSubscriber()
        mailer = BMPMailer.forCreation(bmp, bmp.registrant)
        mailer.message_id = '<foobar-example-com>'
        headers, subject, body = mailer.generateEmail(subscriber)
        self.assertEqual('<foobar-example-com>', headers['Message-Id'])
        self.assertEqual('Baz Qux <baz.qux@example.com>', mailer.from_address)
        bmp.root_message_id = None
        pop_notifications()
        mailer.sendAll()
        for notification in pop_notifications():
            self.assertEqual('<foobar-example-com>',
                notification['Message-Id'])
        self.assertEqual('<foobar-example-com>', bmp.root_message_id)
        mailer.message_id = '<bazqux-example-com>'
        mailer.sendAll()
        self.assertEqual('<foobar-example-com>', bmp.root_message_id)

    def test_inReplyTo(self):
        """Ensure that messages are in reply to the root"""
        bmp, subscriber = self.makeProposalWithSubscriber()
        bmp.root_message_id = '<root-message-id>'
        mailer = BMPMailer.forCreation(bmp, bmp.registrant)
        headers, subject, body = mailer.generateEmail(subscriber)
        self.assertEqual('<root-message-id>', headers['In-Reply-To'])

    def test_queue(self):
        bmp, subscriber = self.makeProposalWithSubscriber()
        mailer = BMPMailer.forCreation(bmp, bmp.registrant)
        mailer.from_address = 'from@example.com'
        (job,) = [
            removeSecurityProxy(j) for j in mailer.queue([subscriber])]
        self.assertEqual(
            bmp.source_branch.unique_name, job.branch_url)
        self.assertEqual('Subscriber', job.rationale)
        self.assertEqual('from@example.com', job.from_address)
        self.assertEqual('Baz Quxx <baz.quxx@example.com>', job.to_address)
        self.assertEqual(
            mailer._getSubject('baz.quxx@example.com'), job.subject)
        self.assertEqual(
            mailer._getBody('baz.quxx@example.com'), job.body)
        self.assertEqual('', job.footer)
        self.assertEqual(bmp.source_branch.product.name,
                         job.branch_project_name)
        self.assertEqual(bmp.address, job.reply_to_address)

    def test_forModificationNoModification(self):
        """Ensure None is returned if no change has been made."""
        merge_proposal, person = self.makeProposalWithSubscriber()
        old_merge_proposal = BranchMergeProposalDelta.snapshot(merge_proposal)
        self.assertEqual(None, BMPMailer.forModification(
            old_merge_proposal, merge_proposal, merge_proposal.registrant))

    def makeMergeProposalMailerModification(self):
        """Fixture method providing a mailer for a modified merge proposal"""
        merge_proposal, subscriber = self.makeProposalWithSubscriber()
        old_merge_proposal = BranchMergeProposalDelta.snapshot(merge_proposal)
        merge_proposal.requestReview()
        merge_proposal.commit_message = 'new commit message'
        mailer = BMPMailer.forModification(
            old_merge_proposal, merge_proposal, merge_proposal.registrant)
        return mailer, subscriber

    def test_forModificationWithModificationDelta(self):
        """Ensure the right delta is filled out if there is a change."""
        mailer, subscriber = self.makeMergeProposalMailerModification()
        self.assertEqual('new commit message',
            mailer.delta.commit_message)

    def test_forModificationHasMsgId(self):
        """Ensure the right delta is filled out if there is a change."""
        mailer, subscriber = self.makeMergeProposalMailerModification()
        assert mailer.message_id is not None, 'message_id not set'

    def test_forModificationWithModificationTextDelta(self):
        """Ensure the right delta is filled out if there is a change."""
        mailer, subscriber = self.makeMergeProposalMailerModification()
        self.assertEqual(
            '    Status: Work in progress => Needs review\n\n'
            'Commit Message changed to:\n\nnew commit message',
            mailer.textDelta())

    def test_generateEmail(self):
        """Ensure that contents of modification mails are right."""
        mailer, subscriber = self.makeMergeProposalMailerModification()
        headers, subject, body = mailer.generateEmail(subscriber)
        self.assertEqual('Proposed merge of foo into bar updated', subject)
        url = canonical_url(mailer.merge_proposal)
        reason = mailer._recipients.getReason(
            subscriber.preferredemail.email)[0].getReason()
        self.assertEqual("""\
The proposal to merge foo into bar has been updated.

    Status: Work in progress => Needs review

Commit Message changed to:

new commit message
--\x20
%s
%s
""" % (url, reason), body)

    def test_send_merge_proposal_modified_notifications(self):
        """Should send emails when invoked with correct parameters."""
        merge_proposal, subscriber = self.makeProposalWithSubscriber()
        snapshot = BranchMergeProposalDelta.snapshot(merge_proposal)
        merge_proposal.commit_message = 'new message'
        event = SQLObjectModifiedEvent(merge_proposal, snapshot, None)
        pop_notifications()
        send_merge_proposal_modified_notifications(merge_proposal, event)
        emails = pop_notifications()
        self.assertEqual(3, len(emails),
                         'There should be three emails sent out.  One to the '
                         'explicit subscriber above, and one each to the '
                         'source branch owner and the target branch owner '
                         'who were implicitly subscribed to their branches.')

    def test_send_merge_proposal_modified_notifications_no_delta(self):
        """Should not send emails if no delta."""
        merge_proposal, subscriber = self.makeProposalWithSubscriber()
        snapshot = BranchMergeProposalDelta.snapshot(merge_proposal)
        event = SQLObjectModifiedEvent(merge_proposal, snapshot, None)
        pop_notifications()
        send_merge_proposal_modified_notifications(merge_proposal, event)
        emails = pop_notifications()
        self.assertEqual([], emails)

    def assertRecipientsMatches(self, recipients, mailer):
        """Assert that `mailer` will send to the people in `recipients`."""
        persons = zip(*(mailer._recipients.getRecipientPersons()))[1]
        self.assertEqual(set(recipients), set(persons))

    def makeReviewRequest(self):
        merge_proposal, subscriber_ = self.makeProposalWithSubscriber()
        candidate = self.factory.makePerson(
            displayname='Candidate', email='candidate@example.com')
        requester = self.factory.makePerson(
            displayname='Requester', email='requester@example.com')
        request = CodeReviewVoteReference(
            branch_merge_proposal=merge_proposal, reviewer=candidate,
            registrant=requester)
        return RecipientReason.forReviewer(request, candidate), requester

    def test_forReviewRequest(self):
        """Test creating a mailer for a review request."""
        request, requester = self.makeReviewRequest()
        mailer = BMPMailer.forReviewRequest(
            request, request.merge_proposal, requester)
        self.assertEqual(
            'Requester <requester@example.com>', mailer.from_address)
        self.assertRecipientsMatches([request.recipient], mailer)

    def test_forReviewRequestMessageId(self):
        """Test creating a mailer for a review request."""
        request, requester = self.makeReviewRequest()
        mailer = BMPMailer.forReviewRequest(
            request, request.merge_proposal, requester)
        assert mailer.message_id is not None, 'message_id not set'


class TestBranchMergeProposalRequestReview(TestCaseWithFactory):
    """Tests for `BranchMergeProposalRequestReviewView`."""

    layer = LaunchpadFunctionalLayer

    def setUp(self):
        TestCaseWithFactory.setUp(self)
        self.owner = self.factory.makePerson()
        login_person(self.owner)
        self.bmp = self.factory.makeBranchMergeProposal(registrant=self.owner)

    def makePersonWithHiddenEmail(self):
        """Make an arbitrary person with hidden email addresses."""
        person = self.factory.makePerson()
        login_person(person)
        person.hide_email_addresses = True
        login_person(self.owner)
        return person

    def test_requestReviewWithPrivateEmail(self):
        # We can request a review, even when one of the parties involved has a
        # private email address.
        candidate = self.makePersonWithHiddenEmail()
        # Request a review and prepare the mailer.
        vote_reference = self.bmp.nominateReviewer(
            candidate, self.owner, None)
        reason = RecipientReason.forReviewer(vote_reference, candidate)
        mailer = BMPMailer.forReviewRequest(reason, self.bmp, self.owner)
        # Send the mail.
        pop_notifications()
        mailer.sendAll()
        mails = pop_notifications()
        self.assertEqual(1, len(mails))
        candidate = removeSecurityProxy(candidate)
        expected_email = '%s <%s>' % (
            candidate.displayname, candidate.preferredemail.email)
        self.assertEqual(expected_email, mails[0]['To'])


def test_suite():
    return TestLoader().loadTestsFromName(__name__)
