# Imports from zope
from zope.schema import Bool, Bytes, Choice, Datetime, Int, Text, \
                        TextLine, Password
from zope.interface import Interface, Attribute
from zope.i18nmessageid import MessageIDFactory
_ = MessageIDFactory('launchpad')

# Launchpad Interface import
from canonical.launchpad.interfaces.sourcepackage import \
     IPackageSet


#
# Interface provided by a BinaryPackage
#
class IBinaryPackage(Interface):
    id = Int(title=_('ID'), required=True)
    #sourcepackagerelease = Int(required=True)
    binarypackagename = Int(required=True)
    version = TextLine(required=True)
    shortdesc = Text(required=True)
    description = Text(required=True)
    build = Int(required=True)
    binpackageformat = Int(required=True)
    component = Int(required=True)
    section = Int(required=True)
    priority = Int(required=False)
    shlibdeps = Text(required=False)
    depends = Text(required=False)
    recommends = Text(required=False)
    suggests = Text(required=False)
    conflicts = Text(required=False)
    replaces = Text(required=False)
    provides = Text(required=False)
    essential = Bool(required=False)
    installedsize = Int(required=False)
    copyright = Text(required=False)
    licence = Text(required=False)

    title = TextLine(required=True, readonly=True)
    name = Attribute("Binary Package Name")
    pkgpriority = Attribute("Package Priority")
    status = Attribute("The BinaryPackageStatus Title")

    def current(distroRelease):
        """Get the current BinaryPackage in a distrorelease"""

    def lastversions():
        """Return the SUPERCEDED BinaryPackages in a DistroRelease
           that comes from the same SourcePackage"""

    def __getitem__(version):
        """Return the packagename that matches the given version"""
    
    
class IBinaryPackageName(Interface):
    id = Int(title=_('ID'), required=True)
    name = TextLine(title=_('Name'), required=True)
    binarypackages = Attribute('binarypackages')

    def nameSelector(sourcepackage=None, selected=None):
        """Return browser-ready HTML to select a Binary Package Name"""

class IBinaryPackageNameSet(Interface):

    def __getitem__():
        """Return the packagename that matches the given name text"""

    def query(name, distribution=None, distrorelease=None,
              distroarchrelease=None, text=None):
        """Return the binary package names for packages that match the given
        criteria."""

class IBinaryPackageBuild(Interface):
    """A binary package build, e.g apache-utils 2.0.48-4_i386"""
    # See the BinaryPackageBuild table
    
    version = Attribute("A version string")
    maintainer = Attribute("Maintainer")
    sourcePackageRelease = Attribute("An ISourcePackageRelease")
    sourcepackage = Attribute("An ISourcePackage")
    binaryPackage = Attribute("An ISourcePackageRelease")
    processor = Attribute("An ISourcePackageRelease")
    binpackageformat = Attribute("An ISourcePackageRelease")
    datebuilt = Attribute("An ISourcePackageRelease")

class IPackagePublishing(Interface):
    binarypackage = Attribute("BinaryPackage")
    distroarchrelease = Attribute("Distro Arch Relese")
    packages = Attribute("Set of Packages inside a DistroRelease")



class IBinaryPackageSet(Interface):
    """A set of binary packages"""    
    distrorelease = Attribute("DistroRelease")
    arch = Attribute("Arch")

    def findPackagesByName(pattern):
        """Search BinaryPackages matching pattern"""

    def __getitem__(name):
        """Getter"""    

    def __iter__():
        """Iterator"""    

class IBinaryPackageUtility(Interface):
    """A binary packages utility"""

    def getByNameInDistroRelease(distroreleaseID, name):
        """Get an BinaryPackage in a DistroRelease by its name"""

    def findByNameInDistroRelease(distroreleaseID, pattern):
        """Returns a set of binarypackages that matchs pattern
        inside a distrorelease"""

    def getDistroReleasePackages(distroreleaseID):
        """Get a set of BinaryPackages in a distrorelease"""
    
    def getByNameVersion(distroreleaseID, name, version):
        """Get a set of BinaryPackages in a DistroRelease by its name and version"""

    def getByArchtag(distroreleaseID, name, version, archtag):
        """Get a BinaryPackage in a DistroRelease by its name, version and archtag"""


#
# BinaryPackages related Applications Interface
#
class IDistroReleaseBinariesApp(Interface):
    """A Release Binary Tag """
    release = Attribute("Release")

    def __getitem__(name):
        """retrieve binarypackges by release"""

    def __iter__():
        """retrieve an iterator"""

    def findPackagesByName():
        """Find packages by name"""

class IDistroReleaseBinaryApp(Interface):    
    """A Binary Package Proxy """
    binarypackage = Attribute("BinaryPackage")
    lastversions = Attribute("Last Release Versions")
    currentversions = Attribute("Current Release Versions")
    release = Attribute("Distro Release")
    bugsCounter = Attribute("BinaryPackages bugs counter")
    
    def __getitem__(name):
        """Retrieve a package release by version."""

class IDistroReleaseBinaryReleaseApp(Interface):
    """A Binary Release Proxy """
    binarypackagerelease = Attribute("BinaryPackageRelease")
    version = Attribute("BinaryPackageRelease Version ?!?!")
    distrorelease = Attribute("The DistroRelease from where the binary's SourcePackageRelease came from")
    archs = Attribute("Builded archs")
    
    def __getitem__(name):
        """retrieve binarypackagesbuild by version"""


class IDistroReleaseBinaryReleaseBuildApp(Interface):
    binarypackagerelease = Attribute("Release")
    version = Attribute("Version")
    arch = Attribute("Arch")

    depends = Attribute("Package Dependencies")
    recommends = Attribute("Package Recommends")
    suggests = Attribute("Package Sugestions")
    conflicts = Attribute("Package Conflicts")
    replaces = Attribute("Package Replaces")
    provides = Attribute("Package Provides")

    pkgformat = Attribute("Package Format")





