# Copyright 2004 Canonical Ltd.  All rights reserved.

"""Browser views and traversal functions for products."""

__metaclass__ = type

import zope.security.interfaces
from zope.component import getUtility, getAdapter
from zope.event import notify
from zope.exceptions import NotFoundError
from zope.app.pagetemplate.viewpagetemplatefile import ViewPageTemplateFile
from zope.app.form import CustomWidgetFactory
from zope.app.form.browser import SequenceWidget, ObjectWidget
from zope.app.form.browser.add import AddView
from zope.app.event.objectevent import ObjectCreatedEvent, ObjectModifiedEvent

from sqlobject.sqlbuilder import AND, IN, ISNULL

from canonical.lp import dbschema
from canonical.lp.z3batching import Batch
from canonical.lp.batching import BatchNavigator
from canonical.database.sqlbase import quote

from canonical.launchpad.searchbuilder import any, NULL
from canonical.launchpad.vocabularies import ValidPersonVocabulary, \
     MilestoneVocabulary

from canonical.launchpad.database import Product, ProductSeriesSet, \
     BugFactory, ProductMilestoneSet, Milestone, Person
from canonical.launchpad.interfaces import IPerson, IProduct, IProductSet, \
     IPersonSet, IBugTaskSet, IMilestoneSet, IAging, ILaunchBag
from canonical.launchpad.browser.productrelease import newProductRelease
from canonical.launchpad import helpers
from canonical.launchpad.browser.addview import SQLObjectAddView
from canonical.launchpad.event.sqlobjectevent import SQLObjectCreatedEvent

# Traversal functions that help us look up something
# about a project or product
def traverseProduct(product, request, name):
    if name == '+series':
        return ProductSeriesSet(product = product)
    elif name == '+milestones':
        return ProductMilestoneSet(product = product)
    else:
        return product.getRelease(name)


# A View Class for Product
class ProductView:

    __used_for__ = IProduct

    summaryPortlet = ViewPageTemplateFile(
        '../templates/portlet-object-summary.pt')

    translationsPortlet = ViewPageTemplateFile(
        '../templates/portlet-product-translations.pt')

    latestBugPortlet = ViewPageTemplateFile(
        '../templates/portlet-latest-bugs.pt')

    relatedBountiesPortlet = ViewPageTemplateFile(
        '../templates/portlet-related-bounties.pt')

    branchesPortlet = ViewPageTemplateFile(
        '../templates/portlet-product-branches.pt')

    detailsPortlet = ViewPageTemplateFile(
        '../templates/portlet-product-details.pt')

    actionsPortlet = ViewPageTemplateFile(
        '../templates/portlet-product-actions.pt')

    projectPortlet = ViewPageTemplateFile(
        '../templates/portlet-product-project.pt')

    milestonePortlet = ViewPageTemplateFile(
        '../templates/portlet-product-milestones.pt')

    packagesPortlet = ViewPageTemplateFile(
        '../templates/portlet-product-packages.pt')

    def __init__(self, context, request):
        self.context = context
        self.product = context
        self.request = request
        self.form = request.form

    def edit(self):
        """
        Update the contents of a Product. This method is called by a
        tal:dummy element in a page template. It checks to see if a
        form has been submitted that has a specific element, and if
        so it continues to process the form, updating the fields of
        the database as it goes.
        """
        # check that we are processing the correct form, and that
        # it has been POST'ed
        form = self.form
        if form.get("Update") != "Update Product":
            return
        if self.request.method != "POST":
            return
        # Extract details from the form and update the Product
        self.context.displayname = form['displayname']
        self.context.title = form['title']
        self.context.shortdesc = form['shortdesc']
        self.context.description = form['description']
        self.context.homepageurl = form['homepageurl']
        notify(ObjectModifiedEvent(self.context))
        # now redirect to view the product
        self.request.response.redirect(self.request.URL[-1])

    def projproducts(self):
        """Return a list of other products from the same project as this
        product, excluding this product"""
        if self.context.project is None:
            return []
        return [p for p in self.context.project.products \
                    if p.id <> self.context.id]

    def newProductRelease(self):
        # default owner is the logged in user
        owner = IPerson(self.request.principal)
        #XXX: cprov 20050112
        # Avoid passing obscure arguments as self.form
        pr = newProductRelease(self.form, self.context, owner)

    def newseries(self):
        """Handle a request to create a new series for this product.
        The code needs to extract all the relevant form elements,
        then call the ProductSeries creation methods."""
        if not self.form.get("Register") == "Register Series":
            return
        if not self.request.method == "POST":
            return
        #XXX: cprov 20050112
        # Avoid passing obscure arguments as self.form
        # XXX sabdfl 16/04/05 we REALLY should not be passing this form to
        # the context object
        series = self.context.newseries(self.form)
        # now redirect to view the page
        self.request.response.redirect('+series/'+series.name)

    def latestBugTasks(self, quantity=5):
        """Return <quantity> latest bugs reported against this product."""
        bugtaskset = getUtility(IBugTaskSet)
        tasklist = bugtaskset.search(product = self.context, orderby = "-datecreated")
        return tasklist[:quantity]


class ProductBugsView:
    DEFAULT_STATUS = (
        dbschema.BugTaskStatus.NEW.value,
        dbschema.BugTaskStatus.ACCEPTED.value)

    def __init__(self, context, request):
        self.context = context
        self.request = request
        self.batch = Batch(
            list(self.bugtask_search()), int(request.get('batch_start', 0)))
        self.batchnav = BatchNavigator(self.batch, request)
        self.is_maintainer = helpers.is_maintainer(self.context)

    def hideGlobalSearchBox(self):
        """Should the global search box be hidden on the page?"""
        if not self.request.form.get("searchtext"):
            return True

    def bugtask_search(self):
        """Search for bug tasks, pulling the params out of the request."""
        params = {}
        searchtext = self.request.form.get("searchtext")
        if searchtext:
            params["searchtext"] = searchtext

        status = self.request.form.get("status")
        if status and status != 'all':
            if isinstance(status, (list, tuple)):
                params["status"] = any(*status)
            else:
                params["status"] = status
        elif not status:
            params["status"] = any(
                dbschema.BugTaskStatus.NEW, dbschema.BugTaskStatus.ACCEPTED)

        severity = self.request.form.get("severity")
        if severity and severity != 'all':
            if isinstance(severity, (list, tuple)):
                params["severity"] = any(*severity)
            else:
                params["severity"] = severity

        assignee = self.request.form.get("assignee")
        milestone = self.request.form.get("target")
        if assignee and assignee != 'all':
            if assignee == "unassigned":
                params["assignee"] = NULL
            else:
                personset = getUtility(IPersonSet)
                params["assignee"] = personset.getByName(assignee)

        if milestone:
            pass

        # Brad Bollenbach, 2005-02-02: Clean this up while integrating
        # new skin from mpt.
        if params.has_key("target"):
            params["milestone"] = params["target"]
            del params["target"]

        # make this search context-sensitive
        params["product"] = self.context

        bugtaskset = getUtility(IBugTaskSet)
        return bugtaskset.search(**params)

    def task_columns(self):
        """The columns to show in the bug task listing."""
        return [
            "select", "id", "title", "milestone", "status",
            "submittedby", "assignedto"
            ]

    def assign_to_milestones(self):
        """Assign bug tasks to the given milestone."""
        if helpers.is_maintainer(self.context):
            milestone_id = self.request.get('milestone')
            if milestone_id:
                milestoneset = getUtility(IMilestoneSet)
                try:
                    milestone = milestoneset.get(milestone_id)
                except NotFoundError:
                    # Should only occur if someone entered the milestone
                    # in the URL manually.
                    return
                taskids = self.request.get('task')
                if taskids:
                    if not isinstance(taskids, (list, tuple)):
                        taskids = [taskids]

                    bugtaskset = getUtility(IBugTaskSet)
                    tasks = [bugtaskset.get(taskid) for taskid in taskids]
                    for task in tasks:
                        # XXX: When spiv fixes so that proxied objects
                        #      can be assigned to a SQLBase '.id' can be
                        #      removed. -- Bjorn Tillenius, 2005-05-04
                        task.milestone = milestone.id

    # XXX: Brad Bollenbach, 2005-02-11: Replace this view method hack with a
    # TALES adapter, perhaps.
    def currentApproximateAge(self, bugtask):
        """Return a human readable string of the age of a bug task."""
        aging_bugtask = getAdapter(bugtask, IAging, '')
        return aging_bugtask.currentApproximateAge()

    def people(self):
        """Return the list of people in Launchpad."""
        # the vocabulary doesn't need context since the
        # ValidPerson is independent of it in LP
        return ValidPersonVocabulary(None)

    def milestones(self):
        """Return the list of milestones for this product."""
        # Produce an empty context
        class HackedContext:
            pass

        context = HackedContext()
        # Set context.product as required by Vocabulary
        context.product = self.context
        # Pass the designed context
        return MilestoneVocabulary(context)

    def statuses(self):
        """Return the list of bug task statuses."""
        return dbschema.BugTaskStatus.items


class ProductTranslationView:
    # XXX sabdfl 17/03/05 please merge this with ProductView.
    summaryPortlet = ViewPageTemplateFile(
        '../templates/portlet-object-summary.pt')

    branchesPortlet = ViewPageTemplateFile(
        '../templates/portlet-product-branches.pt')

    detailsPortlet = ViewPageTemplateFile(
        '../templates/portlet-product-details.pt')

    actionsPortlet = ViewPageTemplateFile(
        '../templates/portlet-product-actions.pt')

    projectPortlet = ViewPageTemplateFile(
        '../templates/portlet-product-project.pt')

    prefLangsPortlet = ViewPageTemplateFile(
        '../templates/portlet-pref-langs.pt')

    statusLegend = ViewPageTemplateFile(
        '../templates/portlet-rosetta-status-legend.pt')

    def __init__(self, context, request):
        self.context = context
        self.request = request
        self.form = self.request.form
        # List of languages the user is interested on based on their browser,
        # IP address and launchpad preferences.
        self.languages = helpers.request_languages(self.request)
        # Cache value for the return value of self.templates
        self._template_languages = None
        # List of the templates we have in this subset.
        self._templates = self.context.potemplates()
        self.status_message = None
        # Whether there is more than one PO template.
        self.has_multiple_templates = len(self._templates) > 1

    def projproducts(self):
        """Return a list of other products from the same project as this
        product, excluding this product"""
        if self.context.project is None:
            return []
        return [p for p in self.context.project.products \
                    if p.id <> self.context.id]

    def templates(self):
        if self._template_languages is None:
            self._template_languages = [
                helpers.TemplateLanguages(template, self.languages)
                for template in self._templates]

        return self._template_languages


class ProductFileBugView(SQLObjectAddView):

    __used_for__ = IProduct

    def __init__(self, context, request):
        self.request = request
        self.context = context
        self._nextURL = '.'
        SQLObjectAddView.__init__(self, context, request)

    def createAndAdd(self, data):
        # add the owner information for the bug
        owner = IPerson(self.request.principal, None)
        if not owner:
            raise zope.security.interfaces.Unauthorized(
                "Need an authenticated bug owner")
        kw = {}
        for key, value in data.items():
            kw[str(key)] = value
        kw['product'] = self.context
        # create the bug
        # XXX cprov 20050112
        # Try to avoid passing **kw, it is unreadable
        # Pass the keyword explicitly ...
        bug = BugFactory(**kw)
        notify(SQLObjectCreatedEvent(bug, self.request))
        return bug

    def nextURL(self):
        return self._nextURL


class ProductSetView:

    __used_for__ = IProductSet

    detailsPortlet = ViewPageTemplateFile(
        '../templates/portlet-productset-details.pt')

    def __init__(self, context, request):

        self.context = context
        self.request = request
        form = self.request.form
        self.soyuz = form.get('soyuz')
        self.rosetta = form.get('rosetta')
        self.malone = form.get('malone')
        self.bazaar = form.get('bazaar')
        self.text = form.get('text')
        self.searchrequested = False
        if (self.text is not None or
            self.bazaar is not None or
            self.malone is not None or
            self.rosetta is not None or
            self.soyuz is not None):
            self.searchrequested = True
        self.results = None
        self.gotmatches = 0


    def searchresults(self):
        """Use searchtext to find the list of Products that match
        and then present those as a list. Only do this the first
        time the method is called, otherwise return previous results.
        """
        if self.results is None:
            self.results = self.context.search(text=self.text,
                                               bazaar=self.bazaar,
                                               malone=self.malone,
                                               rosetta=self.rosetta,
                                               soyuz=self.soyuz)
        self.gotmatches = len(list(self.results))
        return self.results


class ProductSetAddView(AddView):

    __used_for__ = IProductSet

    def __init__(self, context, request):
        self.context = context
        self.request = request
        self._nextURL = '.'
        AddView.__init__(self, context, request)

    def createAndAdd(self, data):
        # add the owner information for the product
        owner = IPerson(self.request.principal, None)
        if not owner:
            raise zope.security.interfaces.Unauthorized(
                "Need an authenticated Launchpad owner")
        kw = {}
        for key, value in data.items():
            kw[str(key)] = value
        kw['owner'] = owner
        # grab a ProductSet utility
        product_util = getUtility(IProductSet)
        # create a brand new Product
        # XXX cprov 20050112
        # -> try to don't use collapsed dict as argument, use it expanded
        # XXX cprov 20050117
        # The required field are:
        #    def createProduct(owner, name, displayname, title, shortdesc,
        #                      description, project=None, homepageurl=None,
        #                      screenshotsurl=None, wikiurl=None,
        #                      downloadurl=None, freshmeatproject=None,
        #                      sourceforgeproject=None):
        # make sure you have those required keys in the kw dict
        product = product_util.createProduct(**kw)
        notify(ObjectCreatedEvent(product))
        self._nextURL = kw['name']
        return product

    def nextURL(self):
        return self._nextURL


