# Copyright 2004-2005 Canonical Ltd.  All rights reserved.

"""Project-related interfaces for Launchpad."""

__metaclass__ = type

__all__ = [
    'IProject',
    'IProjectSet',
    'IProjectBugTracker',
    'IProjectBugTrackerSet',
    ]

from canonical.launchpad import _
from canonical.launchpad.fields import ContentNameField, Summary, Title 
from canonical.launchpad.validators.name import name_validator 
from canonical.launchpad.interfaces.launchpad import IHasOwner
from canonical.launchpad.interfaces.bugtarget import IBugTarget
from canonical.launchpad.interfaces.specificationtarget import (
    IHasSpecifications)
from canonical.launchpad.interfaces.validation import valid_webref
from zope.component import getUtility
from zope.schema import Bool, Choice, Int, Text, TextLine
from zope.interface import Interface, Attribute


class ProjectNameField(ContentNameField):

    errormessage = _("%s is already in use by another project.")

    @property
    def _content_iface(self):
        return IProject

    def _getByName(self, name):
        return getUtility(IProjectSet).getByName(name)


class IProject(IHasOwner, IBugTarget, IHasSpecifications):
    """A Project."""

    id = Int(title=_('ID'), readonly=True)

    owner = Choice(
        title=_('Owner'),
        required=True,
        vocabulary='ValidOwner',
        description=_("""Project owner, it can either a valid
            Person or Team inside Launchpad context."""))

    name = ProjectNameField(
        title=_('Name'),
        required=True,
        description=_("""A unique name, used in URLs, identifying the project.
            All lowercase, no special characters.
            Examples: apache, mozilla, gimp."""),
        constraint=name_validator)

    displayname = TextLine(
        title=_('Display Name'),
        description=_("""Appropriately capitalised,
            and typically ending in "Project".
            Examples: the Apache Project, the Mozilla Project,
            the Gimp Project."""))

    title = Title(
        title=_('Title'),
        description=_("""The full name of the project,
            which can contain spaces, special characters etc."""))

    summary = Summary(
        title=_('Project Summary'),
        description=_("""A brief (one-paragraph) summary of the project."""))

    description = Text(
        title=_('Description'),
        description=_("""A detailed description of the project,
            including details like when it was founded, 
            how many contributors there are,
            and how it is organised and coordinated."""))

    datecreated = TextLine(
        title=_('Date Created'),
        description=_("""The date this project was created in Launchpad."""))

    driver = Choice(
        title=_("Driver"),
        description=_(
            "This is a project-wide appointment, think carefully here! "
            "This person or team will be able to set feature goals and "
            "approve bug targeting and backporting for ANY series in "
            "ANY product in this project. You can also appoint drivers "
            "at the level of a specific product or series. So you may "
            "just want to leave this space blank, and instead let the "
            "individual products and series have drivers."),
        required=False, vocabulary='ValidPersonOrTeam')

    homepageurl = TextLine(
        title=_('Homepage URL'),
        required=False,
        constraint=valid_webref,
        description=_("""The project home page. Please include the http://"""))

    wikiurl = TextLine(
        title=_('Wiki URL'),
        required=False,
        constraint=valid_webref,
        description=_("""The URL of this project's wiki, if it has one.
            Please include the http://"""))

    lastdoap = TextLine(
        title=_('Last-parsed RDF fragment'),
        description=_("""The last RDF fragment for this
           entity that we received and parsed, or
           generated."""),
        required=False)

    sourceforgeproject = TextLine(
        title=_("SourceForge Project Name"),
        description=_("""The SourceForge project name for this project,
            if it is in sourceforge."""),
        required=False)

    freshmeatproject = TextLine(
        title=_("Freshmeat Project Name"),
        description=_("""The Freshmeat project name for this project,
            if it is in freshmeat."""),
        required=False)

    translationgroup = Choice(
        title = _("Translation group"),
        description = _("The translation group for this project. This group "
            "is made up of a set of translators for all the languages "
            "approved by the group manager. These translators then have "
            "permission to edit the groups translation files, based on the "
            "permission system selected below."),
        required=False,
        vocabulary='TranslationGroup')

    translationpermission = Choice(
        title=_("Translation Permission System"),
        description=_("The permissions this group requires for "
            "translators. If 'Open', then anybody can edit translations "
            "in any language. If 'Reviewed', then anybody can make "
            "suggestions but only the designated translators can edit "
            "or confirm translations. And if 'Closed' then only the "
            "designated translation group will be able to touch the "
            "translation files at all."),
        required=True,
        vocabulary='TranslationPermission')

    active = Bool(title=_('Active'), required=False,
        description=_("Whether or not this project is considered active."))

    reviewed = Bool(title=_('Reviewed'), required=False,
        description=_("Whether or not this project has been reviewed."))

    bounties = Attribute(_("The bounties that are related to this project."))

    def bugtrackers():
        """Return the BugTrackers for this Project."""

    def products():
        """Return Products for this Project."""

    def getProduct(name):
        """Get a product with name `name`."""

    def shortDescription(aDesc=None):
        """return the projects summary, setting it if aDesc is provided"""

    def product(name):
        """Return the product belonging to this project with the given
        name."""

    def ensureRelatedBounty(bounty):
        """Ensure that the bounty is linked to this project. Return None.
        """


# Interfaces for set

class IProjectSet(Interface):
    """The collection of projects."""

    title = Attribute('Title')

    def __iter__():
        """Return an iterator over all the projects."""

    def __getitem__(name):
        """Get a project by its name."""

    def get(projectid):
        """Get a project by its id.

        If the project can't be found a zope.exceptions.NotFoundError will be
        raised.
        """

    def getByName(name, default=None, ignore_inactive=False):
        """Return the project with the given name, ignoring inactive projects
        if ignore_inactive is True.
        
        Return the default value if there is no such project.
        """

    def new(name, title, displayname, summary, description, owner, url):
        """Create and return a project with the given arguments."""

    def count_all():
        """Return the total number of projects registered in Launchpad."""

    def search(text=None, soyuz=None,
                     rosetta=None, malone=None,
                     bazaar=None,
                     search_products=True):
        """Search through the Registry database for projects that match the
        query terms. text is a piece of text in the title / summary /
        description fields of project (and possibly product). soyuz,
        bazaar, malone etc are hints as to whether the search should
        be limited to projects that are active in those Launchpad
        applications."""

    def forReview():
        """Return a list of Projects which need review, or which have
        products that needs review."""

    def forSyncReview():
        """Return a list of projects that have productseries ready to
        import which need review."""

class IProjectBugTracker(Interface):
    id = Int(title=_('ID'))
    project = Int(title=_('Owner'))
    bugtracker = Int(title=_('Bug Tracker'))

class IProjectBugTrackerSet(Interface):
    def new(project, bugtracker):
        """Create a new project bug tracker."""

