# Imports from zope
from zope.schema import Bool, Bytes, Choice, Datetime, Int, Text, TextLine
from zope.schema import Password
from zope.interface import Interface, Attribute
from zope.i18nmessageid import MessageIDFactory
_ = MessageIDFactory('launchpad')


class IPackages(Interface):
    """Root object for web app."""
    binary = Attribute("Binary packages")
    source = Attribute("Source packages")

    def __getitem__(name):
        """Retrieve a package set by name."""

class IPackageSet(Interface):
    """A set of packages"""
    def __getitem__(name):
        """Retrieve a package by name."""
    def __iter__():
        """Iterate over names"""

#
# Interface we expect a SourcePackage to provide.
#
class ISourcePackage(Interface):
    """A SourcePackage"""
    id = Int(title=_("ID"), required=True)
    name = TextLine(title=_("Name"), required=True)
    maintainer = Int(title=_("Maintainer"), required=True)
    title = TextLine(title=_("Title"), required=True)
    shortdesc = Text(title=_("Description"), required=True)
    description = Text(title=_("Description"), required=True)
    manifest = Int(title=_("Manifest"), required=False)
    distro = Int(title=_("Distribution"), required=False)
    sourcepackagename = Int(title=_("SourcePackage Name"), required=True)
    bugs = Attribute("bugs")
    product = Attribute("Product, or None")
    proposed = Attribute("A source package release with upload status of "
                         "PROPOSED, else None")


    ## XXX: cprov 20041110
    ## Big Big Mistake I suppose SourcePackageinDistro class (PG VIEW)
    ## uses the ISourcepackage interface, then we have many unimplemented
    ## attributes !!! we should have ISourcePackageinDistro and move following

    distrorelease = Int(title=_("DistroRelease"), required=False)

    def getBugSourcePackages(distrorelease):
        """Get SourcePackages in a DistroRelease with BugAssignement"""

    # XXX: What do the following methods and attributes do?
    #      These were missing from the interfaces, but being used
    #      in application code.
    #      -- Steve Alexander, Fri Dec 10 14:28:41 UTC 2004
    def bugsCounter():
        """XXX"""
    releases = Attribute("XXX")
    current = Attribute("XXX")
    lastversions = Attribute("XXX")


#
# Interface provied by a SourcePackageName. This is a tiny
# table that allows multiple SourcePackage entities to share
# a single name.
#
class ISourcePackageName(Interface):
    """Name of a SourcePackage"""
    id = Int(title=_("ID"), required=True)
    name = TextLine(title=_("Name"), required=True)


class ISourcePackageSet(Interface):
    """A set for ISourcePackage objects."""

    def __getitem__(key):
        """Get an ISourcePackage by name"""

    def __iter__():
        """Iterate through SourcePackages."""

    # XXX: WTF is self doing here?
    # -- Steve Alexander, Fri Dec 10 14:42:08 UTC 2004
    def withBugs(self):
        """Return a sequence of SourcePackage, that have bugs assigned to
        them. In future, we might pass qualifiers to further limit the list
        that is returned, such as a name filter, or a bug assignment status
        filter."""

    def getSourcePackages(distroreleaseID):
        """Returns a set of SourcePackage in a DistroRelease"""

    def findByName(distroreleaseID, pattern):
        """Returns a set o sourcepackage that matchs pattern
        inside a distrorelease"""

    def getByName(distroreleaseID, name):
        """Returns a SourcePackage by its name"""

    # XXX: WTF is self doing here?
    # -- Steve Alexander, Fri Dec 10 14:42:08 UTC 2004
    def getByPersonID(self, personID):
        """Get a set of SourcePackages maintained by a Person"""

    # XXX: What do the following methods and attributes do?
    #      These were missing from the interfaces, but being used
    #      in application code.
    #      -- Steve Alexander, Fri Dec 10 14:28:41 UTC 2004
    def getSourcePackageRelease(sourcepackageid, version):
        """XXX"""


class ISourcePackageRelease(Interface):
    """A source package release, e.g. apache-utils 2.0.48-3"""

    sourcepackage = Attribute("The source package this is a release for")
    creator = Attribute("Person that created this release")
    version = Attribute("A version string")
    dateuploaded = Attribute("Date of Upload")
    urgency = Attribute("Source Package Urgency")
    dscsigningkey = Attribute("DSC Signing Key")
    component = Attribute("Source Package Component")
    changelog = Attribute("Source Package Change Log")
    builddepends = Attribute(
        "A comma-separated list of packages on which this package"
        " depends to build")
    builddependsindep = Attribute(
        "Same as builddepends, but the list is of arch-independent packages")
    architecturehintlist = Attribute("XXX: Kinnison?")
    dsc = Attribute("The DSC file for this SourcePackageRelease")
    section = Attribute("Section this Source package Release belongs to")
    pkgurgency = Attribute("Source Package Urgency Translated using dbschema")
    binaries = Attribute(
        "Binary Packages generated by this SourcePackageRelease") 
    linkified_changelog = Attribute("Linkified Source Package Changelog")
    builds = Attribute("Builds for this sourcepackagerelease")

    def branches():
        """Return the list of branches in a source package release"""

    # XXX: What do the following methods and attributes do?
    #      These were missing from the interfaces, but being used
    #      in application code.
    #      -- Steve Alexander, Fri Dec 10 14:28:41 UTC 2004
    architecturesReleased = Attribute("XXX")

class ISourcePackageReleasePublishing(ISourcePackageRelease):
    """
    Interface for the SQL VSourcePackageReleasePublishing View, which
    aggregates data from sourcepackagerelease, sourcepackagepublishing,
    sourcepackagename, component and distrorelease.
    """
    # XXX: salgado: make all attributes readonly (including the ones
    # inherited from ISourcePackageRelease). Is this possible?
    publishingstatus = Attribute("The status of this publishing record")
    datepublished = Attribute("The date on which this record was published")
    name = Attribute("The SourcePackage name")
    shortdesc = Attribute("The SourcePackage short description")
    description = Attribute("The SourcePackage description")
    componentname = Attribute("The Component name")
    distrorelease = Attribute("The distro in which this package was released")
    maintainer = Attribute("The maintainer of this package")


class IbuilddepsSet(Interface):
    name = Attribute("Package name for a builddepends/builddependsindep")
    signal = Attribute("Dependence Signal e.g = >= <= <")
    version = Attribute("Package version for a builddepends/builddependsindep")

class ICurrentVersion(Interface):
    release = Attribute("The binary or source release object")
    currentversion = Attribute("Current version of A binary or source package")
    currentbuilds = Attribute(
        "The current builds for binary or source package")



#
# SourcePackage related Applications Interfaces
#

class IDistroSourcesApp(Interface):
    """A Distribution Source Tag """
    distribution = Attribute("Distribution")

    def __getitem__(name):
        """retrieve sourcepackges by release"""

    def __iter__():
        """retrieve an iterator"""
     

class IDistroReleaseSourcesApp(Interface):
    """A Release Sources Proxy """
    release = Attribute("Release")
    
    def __getitem__(name):
        """Retrieve a package by name."""

    def __iter__():
        """Iterate over names"""

    def findPackagesByName():
        """Find packages by name."""

    def sourcePackagesBatch():
        """Return a batch of source packages."""

    
class IDistroReleaseSourceApp(Interface):
    """A SourcePackage Proxy """
    release = Attribute("Current DistroRelease")
    sourcepackage = Attribute("SourcePackage")
    releases = Attribute("SourcePackageReleases")
    proposed = Attribute("Proposed source package release")
    lastversions = Attribute("Last Release Versions")
    currentversions = Attribute("Current Release Versions")
    bugsCounter = Attribute("A tuple of bug counters")
    archs = Attribute("A tuple of architectures")
    
    def __getitem__(name):
        """Retrieve a package release by version."""

class IDistroReleaseSourceReleaseApp(Interface):
    """A SourcePackageRelease Proxy """
    sourcepackagerelease = Attribute("SourcePackageRelease")
    archs = Attribute("Builded archs")
    distrorelease = Attribute(
        "The DistroRelease need to make links to bin packages")

    def __getitem__(name):
        """Retrieve a package release build by arch."""



