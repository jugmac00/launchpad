# Copyright 2010 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).


__metaclass__ = type

__all__ = [
    'SourcePackageRecipeBuildMailer',
    ]


from canonical.config import config
from canonical.launchpad.webapp import canonical_url
from canonical.launchpad.webapp.tales import DurationFormatterAPI
from lp.services.mail.basemailer import BaseMailer, RecipientReason


class SourcePackageRecipeBuildMailer(BaseMailer):

    @classmethod
    def forStatus(cls, build):
        """Create a mailer for notifying about build status.

        :param build: The build to notify about the state of.
        """
        requester = build.requester
        recipients = {requester: RecipientReason.forBuildRequester(requester)}
        return cls(
            '[recipe build #%(build_id)d] of ~%(recipe_owner)s %(recipe)s in'
            ' %(distroseries)s: %(status)s',
            'build-request.txt', recipients,
            config.canonical.noreply_from_address, build)

    def __init__(self, subject, body_template, recipients, from_address,
                 build):
        BaseMailer.__init__(
            self, subject, body_template, recipients, from_address,
            notification_type='recipe-build-status')
        self.build = build

    def _getHeaders(self, email):
        """See `BaseMailer`"""
        headers = super(
            SourcePackageRecipeBuildMailer, self)._getHeaders(email)
        headers.update({
            'X-Launchpad-Build-State': self.build.status.name,
            })
        return headers

    def _getTemplateParams(self, email):
        """See `BaseMailer`"""
        params = super(
            SourcePackageRecipeBuildMailer, self)._getTemplateParams(email)
        params.update({
            'status': self.build.status.title,
            'build_id': self.build.id,
            'distroseries': self.build.distroseries.name,
            'recipe': self.build.recipe.name,
            'recipe_owner': self.build.recipe.owner.name,
            'archive': self.build.archive.name,
            'archive_owner': self.build.archive.owner.name,
            'log_url': '',
            'component': self.build.current_component.name,
            'duration': '',
            'builder_url': '',
            'build_url': canonical_url(self.build),
        })
        if self.build.builder is not None:
            params['builder_url'] = canonical_url(self.build.builder)
        if self.build.duration is not None:
            duration_formatter = DurationFormatterAPI(self.build.duration)
            params['duration'] = duration_formatter.approximateduration()
        if self.build.log is not None:
            params['log_url'] = self.build.log.getURL()
        return params

    def _getFooter(self, params):
        """See `BaseMailer`"""
        return ('%(build_url)s\n'
                '%(reason)s\n' % params)
