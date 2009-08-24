# Copyright 2009 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""Person-related translations view classes."""

__metaclass__ = type

__all__ = [
    'PersonTranslationView',
    'PersonTranslationRelicensingView',
]

from datetime import datetime, timedelta
import pytz
import urllib
from zope.app.form.browser import TextWidget
from zope.component import getUtility

from canonical.launchpad import _
from canonical.launchpad.webapp.interfaces import ILaunchBag
from canonical.cachedproperty import cachedproperty
from canonical.launchpad.webapp import (
    LaunchpadFormView, Link, action, canonical_url, custom_widget)
from canonical.launchpad.webapp.menu import NavigationMenu
from canonical.launchpad.webapp.batching import BatchNavigator
from canonical.launchpad.webapp.publisher import LaunchpadView
from canonical.widgets import LaunchpadRadioWidget
from lp.registry.interfaces.person import IPerson
from lp.registry.interfaces.sourcepackage import ISourcePackage
from lp.translations.browser.translationlinksaggregator import (
    TranslationLinksAggregator)
from lp.translations.interfaces.pofiletranslator import (
    IPOFileTranslatorSet)
from lp.translations.interfaces.translationrelicensingagreement import (
    ITranslationRelicensingAgreementEdit,
    TranslationRelicensingAgreementOptions)
from lp.translations.interfaces.translationsperson import (
    ITranslationsPerson)
from lp.translations.model.pofile import POFile
from lp.translations.model.productserieslanguage import ProductSeriesLanguage


class WorkListLinksAggregator(TranslationLinksAggregator):
    """Aggregate translation links for translation or review.

    Here, all files are actually `POFile`s, never `POTemplate`s.
    """

    def countStrings(self, pofile):
        """Count number of strings that need work."""
        raise NotImplementedError()

    def describe(self, target, link, covered_files):
        """See `TranslationLinksAggregator.describe`."""
        strings_count = sum(
            [self.countStrings(pofile) for pofile in covered_files])

        if strings_count == 1:
            strings_wording = "%d string"
        else:
            strings_wording = "%d strings"

        return {
            'target': target,
            'count': strings_count,
            'count_wording': strings_wording % strings_count,
            'is_product': not ISourcePackage.providedBy(target),
            'link': link,
        }


class ReviewLinksAggregator(WorkListLinksAggregator):
    """A `TranslationLinksAggregator` for translations to review."""

    # Link to unreviewed suggestions.
    pofile_link_suffix = '/+translate?show=new_suggestions'

    # Strings that need work are ones with unreviewed suggestions.
    def countStrings(self, pofile):
        """See `WorkListLinksAggregator.countStrings`."""
        return pofile.unreviewedCount()


class PersonTranslationsMenu(NavigationMenu):

    usedfor = IPerson
    facet = 'translations'
    links = ('overview', 'licensing', 'imports')

    def overview(self):
        text = 'Overview'
        return Link('', text)

    def imports(self):
        text = 'Import queue'
        return Link('+imports', text)

    def licensing(self):
        text = 'Translations licensing'
        enabled = (self.context == self.user)
        return Link('+licensing', text, enabled=enabled)


class PersonTranslationView(LaunchpadView):
    """View for translation-related Person pages."""

    _pofiletranslator_cache = None

    history_horizon = None

    @cachedproperty
    def batchnav(self):
        translations_person = ITranslationsPerson(self.context)
        batchnav = BatchNavigator(
            translations_person.translation_history, self.request)

        pofiletranslatorset = getUtility(IPOFileTranslatorSet)
        batch = batchnav.currentBatch()
        self._pofiletranslator_cache = (
            pofiletranslatorset.prefetchPOFileTranslatorRelations(batch))

        return batchnav

    @cachedproperty
    def translation_groups(self):
        """Return translation groups a person is a member of."""
        translations_person = ITranslationsPerson(self.context)
        return list(translations_person.translation_groups)

    @cachedproperty
    def translators(self):
        """Return translators a person is a member of."""
        translations_person = ITranslationsPerson(self.context)
        return list(translations_person.translators)

    @cachedproperty
    def person_filter_querystring(self):
        """Return person's name appropriate for including in links."""
        return urllib.urlencode({'person': self.context.name})

    @property
    def person_is_reviewer(self):
        """Is this person in a translation group?"""
        return len(self.translation_groups) != 0

    @property
    def person_is_translator(self):
        """Is this person active in translations?"""
        return self.context.hasKarma('translations')

    @property
    def person_includes_me(self):
        """Is the current user (a member of) this person?"""
        user = getUtility(ILaunchBag).user
        if user is None:
            return False
        else:
            return user.inTeam(self.context)

    def should_display_message(self, translationmessage):
        """Should a certain `TranslationMessage` be displayed.

        Return False if user is not logged in and message may contain
        sensitive data such as email addresses.

        Otherwise, return True.
        """
        if self.user:
            return True
        return not (
            translationmessage.potmsgset.hide_translations_from_anonymous)

    def _setHistoryHorizon(self):
        """If not already set, set `self.history_horizon`."""
        if self.history_horizon is None:
            now = datetime.now(pytz.timezone('UTC'))
            self.history_horizon = now - timedelta(90, 0, 0)

    def _getTargetsForReview(self, max_fetch=None):
        """Query and aggregate the top targets for review.

        :param max_fetch: Maximum number of `POFile`s to fetch while
            looking for these.
        :return: a list of at most `max_fetch` translation targets.
            Multiple `POFile`s may be aggregated together into a single
            target.
        """
        self._setHistoryHorizon()
        person = ITranslationsPerson(self.context)
        pofiles = person.getReviewableTranslationFiles(
            no_older_than=self.history_horizon)

        if max_fetch is not None:
            pofiles = pofiles[:max_fetch]

        return ReviewLinksAggregator().aggregate(pofiles)

    def _suggestTargetsForReview(self, max_fetch):
        """Find random translation targets for review.

        :param max_fetch: Maximum number of `POFile`s to fetch while
            looking for these.
        :return: a list of at most `max_fetch` translation targets.
            Multiple `POFile`s may be aggregated together into a single
            target.
        """
        self._setHistoryHorizon()
        person = ITranslationsPerson(self.context)
        pofiles = person.suggestReviewableTranslationFiles(
            no_older_than=self.history_horizon)[:max_fetch]

        return ReviewLinksAggregator().aggregate(pofiles)

    @cachedproperty
    def all_projects_and_packages_to_review(self):
        """Top projects and packages for this person to review."""
        return self._getTargetsForReview()

    @property
    def top_projects_and_packages_to_review(self):
        """Suggest translations for this person to review."""
        self._setHistoryHorizon()

        # Maximum number of projects/packages to list that this person
        # has recently worked on.
        max_known_targets = 9
        # Length of overall list to display.
        list_length = 10

        # Start out with the translations that the person has recently
        # worked on.  Aggregation may reduce the number we get, so ask
        # the database for a few extra.
        fetch = 5 * max_known_targets
        recent = self._getTargetsForReview(fetch)[:max_known_targets]

        # Fill out the list with other translations that the person
        # could also be reviewing.
        empty_slots = list_length - len(recent)
        fetch = 5 * empty_slots
        random_suggestions = self._suggestTargetsForReview(fetch)
        random_suggestions = random_suggestions[:empty_slots]

        return recent + random_suggestions

    @cachedproperty
    def num_projects_and_packages_to_review(self):
        """How many translations do we suggest for reviewing?"""
        return len(self.all_projects_and_packages_to_review)


class PersonTranslationRelicensingView(LaunchpadFormView):
    """View for Person's translation relicensing page."""
    schema = ITranslationRelicensingAgreementEdit
    field_names = ['allow_relicensing', 'back_to']
    custom_widget(
        'allow_relicensing', LaunchpadRadioWidget, orientation='vertical')
    custom_widget('back_to', TextWidget, visible=False)

    @property
    def initial_values(self):
        """Set the default value for the relicensing radio buttons."""
        translations_person = ITranslationsPerson(self.context)
        # If the person has previously made a choice, we default to that.
        # Otherwise, we default to BSD, because that's what we'd prefer.
        if translations_person.translations_relicensing_agreement == False:
            default = TranslationRelicensingAgreementOptions.REMOVE
        else:
            default = TranslationRelicensingAgreementOptions.BSD
        return {
            "allow_relicensing": default,
            "back_to": self.request.get('back_to'),
            }

    @property
    def relicensing_url(self):
        """Return an URL for this view."""
        return canonical_url(self.context, view_name='+licensing')

    def getSafeRedirectURL(self, url):
        """Successful form submission should send to this URL."""
        if url and url.startswith(self.request.getApplicationURL()):
            return url
        else:
            return canonical_url(self.context)

    @action(_("Confirm"), name="submit")
    def submit_action(self, action, data):
        """Store person's decision about translations relicensing.

        Decision is stored through
        `ITranslationsPerson.translations_relicensing_agreement`
        which uses TranslationRelicensingAgreement table.
        """
        translations_person = ITranslationsPerson(self.context)
        allow_relicensing = data['allow_relicensing']
        if allow_relicensing == TranslationRelicensingAgreementOptions.BSD:
            translations_person.translations_relicensing_agreement = True
            self.request.response.addInfoNotification(_(
                "Thank you for BSD-licensing your translations."))
        elif (allow_relicensing ==
            TranslationRelicensingAgreementOptions.REMOVE):
            translations_person.translations_relicensing_agreement = False
            self.request.response.addInfoNotification(_(
                "We respect your choice. "
                "Your translations will be removed once we complete the "
                "switch to the BSD license. "
                "Thanks for trying out Launchpad Translations."))
        else:
            raise AssertionError(
                "Unknown allow_relicensing value: %r" % allow_relicensing)
        self.next_url = self.getSafeRedirectURL(data['back_to'])

