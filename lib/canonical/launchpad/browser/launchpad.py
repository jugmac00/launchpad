# Copyright 2009 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""Browser code for the launchpad application."""

__metaclass__ = type
__all__ = [
    'AppFrontPageSearchView',
    'ApplicationButtons',
    'BrowserWindowDimensions',
    'DoesNotExistView',
    'Hierarchy',
    'IcingContribFolder',
    'IcingFolder',
    'LaunchpadImageFolder',
    'LaunchpadRootNavigation',
    'LinkView',
    'LoginStatus',
    'MaintenanceMessage',
    'MenuBox',
    'NavigationMenuTabs',
    'SoftTimeoutView',
    'StructuralHeaderPresentation',
    'StructuralObjectPresentation',
    'get_launchpad_views',
    ]


import cgi
import operator
import os
import re
import time
import urllib
from datetime import timedelta, datetime

from zope.app import zapi
from zope.datetime import parseDatetimetz, tzinfo, DateTimeError
from zope.component import getUtility, queryAdapter
from zope.interface import implements
from zope.publisher.interfaces import NotFound
from zope.publisher.interfaces.browser import IBrowserPublisher
from zope.publisher.interfaces.xmlrpc import IXMLRPCRequest
from zope.security.interfaces import Unauthorized
from zope.traversing.interfaces import ITraversable

from canonical.cachedproperty import cachedproperty
from canonical.config import config
from canonical.lazr import ExportedFolder, ExportedImageFolder
from canonical.launchpad.helpers import intOrZero
from canonical.launchpad.layers import WebServiceLayer

from lp.registry.interfaces.announcement import IAnnouncementSet
from lp.soyuz.interfaces.binarypackagename import (
    IBinaryPackageNameSet)
from lp.code.interfaces.branch import IBranchSet
from lp.code.interfaces.branchlookup import IBranchLookup
from lp.code.interfaces.branchnamespace import InvalidNamespace
from lp.code.interfaces.linkedbranch import (
    CannotHaveLinkedBranch, NoLinkedBranch)
from lp.bugs.interfaces.bug import IBugSet
from lp.soyuz.interfaces.builder import IBuilderSet
from lp.soyuz.interfaces.packageset import IPackagesetSet
from lp.code.interfaces.codeimport import ICodeImportSet
from lp.registry.interfaces.codeofconduct import ICodeOfConductSet
from lp.registry.interfaces.distribution import IDistributionSet
from lp.registry.interfaces.karma import IKarmaActionSet
from canonical.launchpad.interfaces.hwdb import IHWDBApplication
from lp.services.worlddata.interfaces.language import ILanguageSet
from canonical.launchpad.interfaces.launchpad import (
    IAppFrontPageSearchForm, IBazaarApplication, ILaunchpadCelebrities,
    IRosettaApplication, IStructuralHeaderPresentation,
    IStructuralObjectPresentation)
from canonical.launchpad.interfaces.launchpadstatistic import (
    ILaunchpadStatisticSet)
from canonical.launchpad.interfaces.logintoken import ILoginTokenSet
from lp.registry.interfaces.mailinglist import IMailingListSet
from lp.bugs.interfaces.malone import IMaloneApplication
from lp.registry.interfaces.mentoringoffer import IMentoringOfferSet
from lp.services.openid.interfaces.openidrpconfig import IOpenIDRPConfigSet
from lp.registry.interfaces.person import IPersonSet
from lp.registry.interfaces.pillar import IPillarNameSet
from lp.registry.interfaces.product import (
    InvalidProductName, IProductSet)
from lp.registry.interfaces.project import IProjectSet
from lp.registry.interfaces.sourcepackagename import (
    ISourcePackageNameSet)
from lp.blueprints.interfaces.specification import ISpecificationSet
from lp.blueprints.interfaces.sprint import ISprintSet
from lp.translations.interfaces.translationgroup import (
    ITranslationGroupSet)
from lp.translations.interfaces.translationimportqueue import (
    ITranslationImportQueue)

from canonical.launchpad.webapp import (
    LaunchpadFormView, LaunchpadView, Link, Navigation,
    StandardLaunchpadFacets, canonical_name, canonical_url, custom_widget,
    stepto)
from canonical.launchpad.webapp.breadcrumb import Breadcrumb
from canonical.launchpad.webapp.interfaces import (
    IBreadcrumb, ILaunchBag, ILaunchpadRoot, INavigationMenu,
    NotFoundError, POSTToNonCanonicalURL)
from canonical.launchpad.webapp.publisher import RedirectionView
from canonical.launchpad.webapp.authorization import check_permission
from lazr.uri import URI
from canonical.launchpad.webapp.tales import PageTemplateContextsAPI
from canonical.launchpad.webapp.url import urlappend
from canonical.launchpad.webapp.vhosts import allvhosts
from canonical.widgets.project import ProjectScopeWidget


# XXX SteveAlexander 2005-09-22: this is imported here because there is no
#     general timedelta to duration format adapter available.  This should
#     be factored out into a generally available adapter for both this
#     code and for TALES namespace code to use.
#     Same for MenuAPI.
from canonical.launchpad.webapp.tales import DurationFormatterAPI, MenuAPI

from lp.answers.interfaces.questioncollection import IQuestionSet


class MenuBox(LaunchpadView):
    """View class that helps its template render the actions menu box.

    Nothing at all is rendered if there are no contextmenu items and also
    no applicationmenu items.

    If there is at least one item, the template is rendered.

    The context may be another view, or a content object.
    """

    def initialize(self):
        menuapi = MenuAPI(self.context)
        # We are only interested on enabled links in non development mode.
        self.contextmenuitems = sorted([
            link for link in menuapi.context.values()
            if link.enabled or config.devmode],
            key=operator.attrgetter('sort_key'))
        facet = menuapi.selectedfacetname()
        if facet != 'unknown':
            # XXX sinzui 2008-06-23 bug=242453:
            # Why are we getting unknown? Bounties are borked. We need
            # to end the facet hacks to get a clear state for the menus.
            application_links = getattr(menuapi, facet).values()
        else:
            application_links = []
        self.applicationmenuitems = sorted([
            link for link in application_links
            if link.enabled or config.devmode],
            key=operator.attrgetter('sort_key'))

    def render(self):
        if (not self.contextmenuitems and not self.applicationmenuitems):
            return u''
        else:
            return self.template()


class NavigationMenuTabs(LaunchpadView):
    """View class that helps its template render the navigation menu tabs.

    Nothing at all is rendered if there are no navigation menu items.
    """

    def initialize(self):
        menuapi = MenuAPI(self.context)
        self.links = sorted([
            link for link in menuapi.navigation.values()
            if (link.enabled or config.devmode)],
            key=operator.attrgetter('sort_key'))
        self.title = None
        if len(self.links) > 0:
            facet = menuapi.selectedfacetname()
            menu = queryAdapter(self.context, INavigationMenu, name=facet)
            if menu is not None:
                self.title = menu.title
        self.enabled_links = [link for link in self.links if link.enabled]

    def render(self):
        if not self.links:
            return ''
        else:
            return self.template()


class LinkView(LaunchpadView):
    """View class that helps its template render a menu link.

    The link is not rendered if it's not enabled and we are not in development
    mode.
    """
    MODIFY_ICONS = ('edit', 'remove', 'trash-icon')

    @property
    def sprite_class(self):
        """Return the class used to display the link's icon."""
        if self.context.icon in self.MODIFY_ICONS:
            # The 3.0 UI design says these are displayed like other icons
            # But they do not have the same use so we want to keep this rule
            # separate.
            return 'sprite modify'
        else:
            return 'sprite'

    def render(self):
        """Render the menu link if it's enabled or we're in dev mode."""
        if self.context.enabled or config.devmode:
            # XXX: Tom Berger 2008-04-16 bug=218706:
            # We strip the result of the template rendering
            # since ZPT seems to always insert a line break
            # at the end of an embedded template.
            return self.template().strip()
        else:
            return ''


class Hierarchy(LaunchpadView):
    """The hierarchy part of the location bar on each page."""

    @property
    def objects(self):
        """The objects for which we want breadcrumbs."""
        return self.request.traversed_objects

    @cachedproperty
    def items(self):
        """Return a list of `IBreadcrumb` objects visible in the hierarchy.

        The list starts with the breadcrumb closest to the hierarchy root.
        """
        breadcrumbs = []
        for obj in self.objects:
            breadcrumb = queryAdapter(obj, IBreadcrumb)
            if breadcrumb is not None:
                breadcrumbs.append(breadcrumb)

        host = URI(self.request.getURL()).host
        mainhost = allvhosts.configs['mainsite'].hostname
        if len(breadcrumbs) != 0 and host != mainhost:
            # We have breadcrumbs and we're not on the mainsite, so we'll
            # sneak an extra breadcrumb for the vhost we're on.
            vhost = host.split('.')[0]

            # Iterate over the context of our breadcrumbs in reverse order and
            # for the first one we find an adapter named after the vhost we're
            # on, generate an extra breadcrumb and insert it in our list.
            for idx, breadcrumb in reversed(list(enumerate(breadcrumbs))):
                extra_breadcrumb = queryAdapter(
                    breadcrumb.context, IBreadcrumb, name=vhost)
                if extra_breadcrumb is not None:
                    breadcrumbs.insert(idx + 1, extra_breadcrumb)
                    break
        if len(breadcrumbs) > 0:
            page_crumb = self.makeBreadcrumbForRequestedPage()
            if page_crumb:
                breadcrumbs.append(page_crumb)
        return breadcrumbs

    def makeBreadcrumbForRequestedPage(self):
        """Return an `IBreadcrumb` for the requested page.

        The `IBreadcrumb` for the requested page is created using the current
        URL and the page's name (i.e. the last path segment of the URL).

        If the requested page (as specified in self.request) is the default
        one for our parent view's context, return None.
        """
        url = self.request.getURL()
        from zope.security.proxy import removeSecurityProxy
        view = removeSecurityProxy(self.request.traversed_objects[-1])
        obj = self.request.traversed_objects[-2]
        default_view_name = zapi.getDefaultViewName(obj, self.request)
        if view.__name__ != default_view_name:
            title = getattr(view, 'page_title', None)
            if title is None:
                title = getattr(view, 'label', None)
            if title is None:
                template = getattr(view, 'template', None)
                if template is None:
                    template = view.index
                template_api = PageTemplateContextsAPI(
                    dict(context=obj, template=template, view=view))
                title = template_api.pagetitle()
            if len(title) > 30:
                title = "%s..." % title[:30]
            breadcrumb = Breadcrumb(None)
            breadcrumb._url = url
            breadcrumb.text = title
            return breadcrumb
        else:
            return None

    @property
    def display_breadcrumbs(self):
        """Return whether the breadcrumbs should be displayed."""
        # If there is only one breadcrumb then it does not make sense
        # to display it as it will simply repeat the context.title.
        return len(self.items) > 1


class MaintenanceMessage:
    """Display a maintenance message if the control file is present and
    it contains a valid iso format time.

    The maintenance message shows the approximate time before launchpad will
    be taken offline for maintenance.

    The control file is +maintenancetime.txt in the launchpad root.

    If there is no maintenance message, an empty string is returned.

    If the maintenance time is too far in the future, then an empty string
    is returned.

    If the maintenance time is in the past, then the maintenance message says
    that Launchpad will go offline "very very soon".

    If the text in the maintenance message is poorly formatted, then an
    empty string is returned, and a warning should be logged.
    """

    timelefttext = None

    notmuchtime = timedelta(seconds=30)
    toomuchtime = timedelta(seconds=1800)  # 30 minutes

    def __call__(self):
        if os.path.exists('+maintenancetime.txt'):
            message = file('+maintenancetime.txt').read()
            try:
                maintenancetime = parseDatetimetz(message)
            except DateTimeError:
                # XXX SteveAlexander 2005-09-22: log a warning here.
                return ''
            nowtz = datetime.utcnow().replace(tzinfo=tzinfo(0))
            timeleft = maintenancetime - nowtz
            if timeleft > self.toomuchtime:
                return ''
            elif timeleft < self.notmuchtime:
                self.timelefttext = 'very very soon'
            else:
                self.timelefttext = 'in %s' % (
                    DurationFormatterAPI(timeleft).approximateduration())
            return self.index()
        return ''


class LaunchpadRootFacets(StandardLaunchpadFacets):

    usedfor = ILaunchpadRoot

    enable_only = ['overview', 'bugs', 'answers', 'specifications',
                   'translations', 'branches']

    def overview(self):
        target = ''
        text = 'Launchpad Home'
        return Link(target, text)

    def translations(self):
        target = ''
        text = 'Translations'
        return Link(target, text)

    def bugs(self):
        target = ''
        text = 'Bugs'
        return Link(target, text)

    def answers(self):
        target = ''
        text = 'Answers'
        summary = 'Launchpad Answer Tracker'
        return Link(target, text, summary)

    def specifications(self):
        target = ''
        text = 'Blueprints'
        summary = 'Launchpad feature specification tracker.'
        return Link(target, text, summary)

    def branches(self):
        target = ''
        text = 'Code'
        summary = 'The Code Bazaar'
        return Link(target, text, summary)


class LoginStatus:

    def __init__(self, context, request):
        self.context = context
        self.request = request
        self.user = getUtility(ILaunchBag).user

    @property
    def login_shown(self):
        return (self.user is None and
                '+login' not in self.request['PATH_INFO'])

    @property
    def logged_in(self):
        return self.user is not None

    @property
    def login_url(self):
        query_string = self.request.get('QUERY_STRING', '')

        # If we have a query string, remove some things we don't want, and
        # keep it around.
        if query_string:
            query_dict = cgi.parse_qs(query_string, keep_blank_values=True)
            query_dict.pop('loggingout', None)
            query_string = urllib.urlencode(
                sorted(query_dict.items()), doseq=True)
            # If we still have a query_string after things we don't want
            # have been removed, add it onto the url.
            if query_string:
                query_string = '?' + query_string

        # The approach we're taking is to combine the application url with
        # the path_info, taking out path steps that are to do with virtual
        # hosting.  This is not exactly correct, as the application url
        # can have other path steps in it.  We're not using the feature of
        # having other path steps in the application url, so this will work
        # for us, assuming we don't need that in the future.

        # The application_url is typically like 'http://thing:port'. No
        # trailing slash.
        application_url = self.request.getApplicationURL()

        # We're going to use PATH_INFO to remove any spurious '+index' at the
        # end of the URL.  But, PATH_INFO will contain virtual hosting
        # configuration, if there is any.
        path_info = self.request['PATH_INFO']

        # Remove any virtual hosting segments.
        path_steps = []
        in_virtual_hosting_section = False
        for step in path_info.split('/'):
            if step.startswith('++vh++'):
                in_virtual_hosting_section = True
                continue
            if step == '++':
                in_virtual_hosting_section = False
                continue
            if not in_virtual_hosting_section:
                path_steps.append(step)
        path = '/'.join(path_steps)

        # Make the URL stop at the end of path_info so that we don't get
        # spurious '+index' at the end.
        full_url = '%s%s' % (application_url, path)
        if full_url.endswith('/'):
            full_url = full_url[:-1]
        logout_url_end = '/+logout'
        if full_url.endswith(logout_url_end):
            full_url = full_url[:-len(logout_url_end)]
        return '%s/+login%s' % (full_url, query_string)


class LaunchpadRootNavigation(Navigation):

    usedfor = ILaunchpadRoot

    @stepto('support')
    def redirect_support(self):
        """Redirect /support to Answers root site."""
        target_url = canonical_url(
            getUtility(ILaunchpadRoot), rootsite='answers')
        return self.redirectSubTree(target_url + 'questions', status=301)

    @stepto('legal')
    def redirect_legal(self):
        """Redirect /legal to help.launchpad.net/Legal site."""
        return self.redirectSubTree(
            'https://help.launchpad.net/Legal', status=301)

    @stepto('faq')
    def redirect_faq(self):
        """Redirect /faq to launchpad-project/+faqs."""
        return self.redirectSubTree(
            'https://answers.launchpad.net/launchpad-project/+faqs',
            status=301)

    @stepto('feedback')
    def redirect_feedback(self):
        """Redirect /feedback to help.launchpad.net/Feedback site."""
        return self.redirectSubTree(
            'https://help.launchpad.net/Feedback', status=301)

    @stepto('+branch')
    def redirect_branch(self):
        """Redirect /+branch/<foo> to the branch named 'foo'.

        'foo' can be the unique name of the branch, or any of the aliases for
        the branch.
        """
        path = '/'.join(self.request.stepstogo)
        try:
            branch_data = getUtility(IBranchLookup).getByLPPath(path)
        except (CannotHaveLinkedBranch, NoLinkedBranch, InvalidNamespace,
                InvalidProductName):
            raise NotFoundError
        branch, trailing = branch_data
        if branch is None:
            raise NotFoundError
        url = canonical_url(branch)
        if trailing is not None:
            url = urlappend(url, trailing)
        return self.redirectSubTree(url)

    @stepto('+builds')
    def redirect_buildfarm(self):
        """Redirect old /+builds requests to new URL, /builders."""
        new_url = '/builders'
        return self.redirectSubTree(
            urlappend(new_url, '/'.join(self.request.stepstogo)))

    # XXX cprov 2009-03-19 bug=345877: path segments starting with '+'
    # should never correspond to a valid traversal, they confuse the
    # hierarchical navigation model.
    stepto_utilities = {
        '+announcements': IAnnouncementSet,
        'binarypackagenames': IBinaryPackageNameSet,
        'branches': IBranchSet,
        'bugs': IMaloneApplication,
        'builders': IBuilderSet,
        '+code': IBazaarApplication,
        '+code-imports': ICodeImportSet,
        'codeofconduct': ICodeOfConductSet,
        'distros': IDistributionSet,
        '+hwdb': IHWDBApplication,
        'karmaaction': IKarmaActionSet,
        '+imports': ITranslationImportQueue,
        '+languages': ILanguageSet,
        '+mailinglists': IMailingListSet,
        '+mentoring': IMentoringOfferSet,
        'package-sets': IPackagesetSet,
        'people': IPersonSet,
        'pillars': IPillarNameSet,
        'projects': IProductSet,
        'projectgroups': IProjectSet,
        'sourcepackagenames': ISourcePackageNameSet,
        'specs': ISpecificationSet,
        'sprints': ISprintSet,
        '+statistics': ILaunchpadStatisticSet,
        'token': ILoginTokenSet,
        '+groups': ITranslationGroupSet,
        'translations': IRosettaApplication,
        'questions': IQuestionSet,
        '+rpconfig': IOpenIDRPConfigSet,
        # These three have been renamed, and no redirects done, as the old
        # urls now point to the product pages.
        #'bazaar': IBazaarApplication,
        #'malone': IMaloneApplication,
        #'rosetta': IRosettaApplication,
        }

    @stepto('products')
    def products(self):
        return self.redirectSubTree(
            canonical_url(getUtility(IProductSet)), status=301)

    def traverse(self, name):
        if name in self.stepto_utilities:
            return getUtility(self.stepto_utilities[name])

        # Allow traversal to ~foo for People
        if name.startswith('~'):
            # account for common typing mistakes
            if canonical_name(name) != name:
                if self.request.method == 'POST':
                    raise POSTToNonCanonicalURL
                return self.redirectSubTree(
                    canonical_url(self.context) + canonical_name(name),
                    status=301)
            else:
                person = getUtility(IPersonSet).getByName(name[1:])
                # Check to see if this is a team, and if so, whether the
                # logged in user is allowed to view the team, by virtue of
                # team membership or Launchpad administration.
                if (person is None or
                    not person.is_team or
                    check_permission('launchpad.View', person)):
                    return person
                raise NotFound(self.context, name)

        # Dapper and Edgy shipped with https://launchpad.net/bazaar hard coded
        # into the Bazaar Launchpad plugin (part of Bazaar core). So in theory
        # we need to support this URL until 2011 (although I suspect the API
        # will break much sooner than that) or updates sent to
        # {dapper,edgy}-updates. Probably all irrelevant, as I suspect the
        # number of people using the plugin in edgy and dapper is 0.
        if name == 'bazaar' and IXMLRPCRequest.providedBy(self.request):
            return getUtility(IBazaarApplication)

        # account for common typing mistakes
        if canonical_name(name) != name:
            if self.request.method == 'POST':
                raise POSTToNonCanonicalURL
            return self.redirectSubTree(
                (canonical_url(self.context, request=self.request) +
                 canonical_name(name)),
                status=301)

        pillar = getUtility(IPillarNameSet).getByName(
            name, ignore_inactive=False)
        if pillar is not None and check_permission('launchpad.View', pillar):
            if pillar.name != name:
                # This pillar was accessed through one of its aliases, so we
                # must redirect to its canonical URL.
                return self.redirectSubTree(canonical_url(pillar), status=301)
            return pillar
        return None

    def _getBetaRedirectionView(self):
        # If the inhibit_beta_redirect cookie is set, don't redirect.
        if self.request.cookies.get('inhibit_beta_redirect', '0') == '1':
            return None

        # If we are looking at the front page, don't redirect.
        if self.request['PATH_INFO'] == '/':
            return None

        # If this is a HTTP POST, we don't want to issue a redirect.
        # Doing so would go against the HTTP standard.
        if self.request.method == 'POST':
            return None

        # If this is a web service request, don't redirect.
        if WebServiceLayer.providedBy(self.request):
            return None

        mainsite_host = config.vhost.mainsite.hostname

        # If the hostname for our URL isn't under the main site
        # (e.g. shipit.ubuntu.com), don't redirect.
        uri = URI(self.request.getURL())
        if not uri.host.endswith(mainsite_host):
            return None

        beta_host = config.launchpad.beta_testers_redirection_host
        user = getUtility(ILaunchBag).user
        # Test to see if the user is None before attempting to get the
        # launchpad_beta_testers celebrity.  In the odd test where the
        # database is empty the series of tests will work.
        if user is None:
            user_is_beta_tester = False
        else:
            beta_testers = (
                getUtility(ILaunchpadCelebrities).launchpad_beta_testers)
            if user.inTeam(beta_testers):
                user_is_beta_tester = True
            else:
                user_is_beta_tester = False

        # If the request is for a bug then redirect straight to that bug.
        bug_match = re.match("/bugs/(\d+)$", self.request['PATH_INFO'])
        if bug_match:
            bug_number = bug_match.group(1)
            bug_set = getUtility(IBugSet)
            try:
                bug = bug_set.get(bug_number)
            except NotFoundError, e:
                raise NotFound(self.context, bug_number)
            if not check_permission("launchpad.View", bug):
                raise Unauthorized("Bug %s is private" % bug_number)
            uri = URI(canonical_url(bug.default_bugtask))
            if beta_host is not None and user_is_beta_tester:
                # Alter the host name to point at the beta target.
                new_host = uri.host[:-len(mainsite_host)] + beta_host
                uri = uri.replace(host=new_host)
        else:
            # If no redirection host is set or the user is not a beta tester,
            # don't redirect.
            if beta_host is None or not user_is_beta_tester:
                return None
            # Alter the host name to point at the beta target.
            new_host = uri.host[:-len(mainsite_host)] + beta_host
            uri = uri.replace(host=new_host)
            # Complete the URL from the environment.
            uri = uri.replace(path=self.request['PATH_INFO'])
            query_string = self.request.get('QUERY_STRING')
            if query_string:
                uri = uri.replace(query=query_string)

        # Empty the traversal stack, since we're redirecting.
        self.request.setTraversalStack([])

        # And perform a temporary redirect.
        return RedirectionView(str(uri), self.request, status=303)

    def publishTraverse(self, request, name):
        beta_redirection_view = self._getBetaRedirectionView()
        if beta_redirection_view is not None:
            return beta_redirection_view
        return Navigation.publishTraverse(self, request, name)


class SoftTimeoutView(LaunchpadView):

    def __call__(self):
        """Generate a soft timeout by sleeping enough time."""
        start_time = time.time()
        celebrities = getUtility(ILaunchpadCelebrities)
        if (self.user is None or
            not self.user.inTeam(celebrities.launchpad_developers)):
            raise Unauthorized

        self.request.response.setHeader('content-type', 'text/plain')
        soft_timeout = intOrZero(config.database.soft_request_timeout)
        if soft_timeout == 0:
            return 'No soft timeout threshold is set.'

        time.sleep(soft_timeout/1000.0)
        time_to_generate_page = (time.time() - start_time) * 1000
        # In case we didn't sleep enogh time, sleep a while longer to
        # pass the soft timeout threshold.
        while time_to_generate_page < soft_timeout:
            time.sleep(0.1)
            time_to_generate_page = (time.time() - start_time) * 1000
        return (
            'Soft timeout threshold is set to %s ms. This page took'
            ' %s ms to render.' % (soft_timeout, time_to_generate_page))


class ObjectForTemplate:

    def __init__(self, **kw):
        for name, value in kw.items():
            setattr(self, name, value)


class IcingFolder(ExportedFolder):
    """Export the Launchpad icing."""

    export_subdirectories = True

    folder = os.path.join(
        os.path.dirname(os.path.realpath(__file__)), '../icing/')


class LaunchpadImageFolder(ExportedImageFolder):
    """Export the Launchpad images - supporting retrieval without extension.
    """

    folder = os.path.join(
        os.path.dirname(os.path.realpath(__file__)), '../images/')


class IcingContribFolder(ExportedFolder):
    """Export the contrib icing."""

    export_subdirectories = True

    folder = os.path.join(
        os.path.dirname(os.path.realpath(__file__)), '../icing-contrib/')


class LaunchpadTourFolder(ExportedFolder):
    """Export a launchpad tour folder.

    This exported folder supports traversing to subfolders.
    """

    folder = os.path.join(
        os.path.dirname(os.path.realpath(__file__)), '../tour/')

    export_subdirectories = True

    def publishTraverse(self, request, name):
        """Hide the source directory.

        The source directory contains source material that we don't want
        published over the web.
        """
        if name == 'source':
            raise NotFound(request, name)
        return super(LaunchpadTourFolder, self).publishTraverse(request, name)

    def browserDefault(self, request):
        """Redirect to index.html if the directory itself is requested."""
        if len(self.names) == 0:
            return RedirectionView(
                "%s+tour/index" % canonical_url(self.context),
                self.request, status=302), ()
        else:
            return self, ()


class LaunchpadAPIDocFolder(ExportedFolder):
    """Export the API documentation."""

    folder = os.path.join(
        os.path.dirname(os.path.realpath(__file__)), '../apidoc/')

    def browserDefault(self, request):
        """Traverse to index.html if the directory itself is requested."""
        if len(self.names) == 0:
            return self, ('index.html', )
        else:
            return self, ()


class StructuralHeaderPresentation:
    """Base class for StructuralHeaderPresentation adapters."""

    implements(IStructuralHeaderPresentation)

    def __init__(self, context):
        self.context = context

    def getIntroHeading(self):
        return None

    def getMainHeading(self):
        raise NotImplementedError()


class StructuralObjectPresentation(StructuralHeaderPresentation):
    """Base class for StructuralObjectPresentation adapters."""

    implements(IStructuralObjectPresentation)

    def listChildren(self, num):
        return []

    def countChildren(self):
        raise NotImplementedError()

    def listAltChildren(self, num):
        return None

    def countAltChildren(self):
        raise NotImplementedError()


class Button:

    def __init__(self, **kw):
        assert len(kw) == 1
        self.name = kw.keys()[0]
        self.text = kw.values()[0]
        self.replacement_dict = self.makeReplacementDict()

    def makeReplacementDict(self):
        return dict(
            url=allvhosts.configs[self.name].rooturl,
            buttonname=self.name,
            text=self.text)

    def renderActive(self):
        return (
            '<a href="%(url)s">\n'
            '  <img'
            '    width="64"'
            '    height="64"'
            '    alt="%(buttonname)s"'
            '    src="/+icing/app-%(buttonname)s-sml-active.gif"'
            '    title="%(text)s"'
            '  />\n'
            '</a>\n' % self.replacement_dict)

    def renderInactive(self):
        return (
            '<a href="%(url)s">\n'
            '  <img'
            '    width="64"'
            '    height="64"'
            '    alt="%(buttonname)s"'
            '    src="/+icing/app-%(buttonname)s-sml.gif"'
            '    title="%(text)s"'
            '  />\n'
            '</a>\n' % self.replacement_dict)

    def renderFrontPage(self):
        return (
            '<a href="%(url)s">\n'
            '  <img'
            '    width="146"'
            '    height="146"'
            '    alt="%(buttonname)s"'
            '    src="/+icing/app-%(buttonname)s.gif"'
            '    title="%(text)s"'
            '  />\n'
            '</a>\n' % self.replacement_dict)

    def renderButton(self, is_active, is_front_page):
        if (is_front_page):
            return self.renderFrontPage()
        elif is_active:
            return self.renderActive()
        else:
            return self.renderInactive()


class PeopleButton(Button):

    def makeReplacementDict(self):
        return dict(
            url='%speople/' % allvhosts.configs['mainsite'].rooturl,
            buttonname=self.name,
            text=self.text)


class ApplicationButtons(LaunchpadView):
    """Those buttons that you get on the index pages."""

    implements(ITraversable)

    def __init__(self, context, request):
        LaunchpadView.__init__(self, context, request)
        self.name = None

    buttons = [
        PeopleButton(people="Join thousands of people and teams collaborating"
            " in software development."),
        Button(code="Publish your code for people to merge and branch from."),
        Button(bugs="Share bug reports and fixes."),
        Button(blueprints="Track blueprints through approval and "
            "implementation."),
        Button(translations="Localize software into your favorite language."),
        Button(answers="Ask and answer questions about software.")
        ]

    def render(self):
        L = []
        for button in self.buttons:
            if self.name:
                is_active = button.name == self.name
            else:
                is_active = True
            is_front_page = self.name == 'main'
            L.append(button.renderButton(is_active, is_front_page))
        return u'\n'.join(L)

    def traverse(self, name, furtherPath):
        self.name = name
        if furtherPath:
            raise AssertionError(
                'Max of one path item after +applicationbuttons')
        return self


class AppFrontPageSearchView(LaunchpadFormView):

    schema = IAppFrontPageSearchForm
    custom_widget('scope', ProjectScopeWidget)

    @property
    def scope_css_class(self):
        """The CSS class for used in the scope widget."""
        if self.scope_error:
            return 'error'
        else:
            return None

    @property
    def scope_error(self):
        """The error message for the scope widget."""
        return self.getFieldError('scope')


class BrowserWindowDimensions(LaunchpadView):
    """Allow capture of browser window dimensions."""

    def render(self):
        return u'Thanks.'


def get_launchpad_views(cookies):
    """The state of optional page elements the user may choose to view.

    :param cookies: The request.cookies object that contains launchpad_views.
    :return: A dict of all the view states.
    """
    views = {
        'small_maps': True,
        }
    cookie = cookies.get('launchpad_views', '')
    if len(cookie) > 0:
        pairs = cookie.split('&')
        for pair in pairs:
            parts = pair.split('=')
            if len(parts) != 2:
                # The cookie is malformed, possibly hacked.
                continue
            key, value = parts
            if not key in views:
                # The cookie may be hacked.
                continue
            # 'false' is the value that the browser script sets to disable a
            # part of a page. Any other value is considered to be 'true'.
            views[key] = value != 'false'
    return views


class DoesNotExistView:
    """A view that simply raises NotFound when rendered.

    Useful to register as a view that shouldn't appear on a particular
    virtual host.
    """
    implements(IBrowserPublisher)

    def __init__(self, context, request):
        self.context = context

    def publishTraverse(self, request, name):
        """See `IBrowserPublisher`."""
        return self

    def browserDefault(self, request):
        """See `IBrowserPublisher`."""
        return self, ()

    def __call__(self):
        raise NotFound(self.context, self.__name__)
