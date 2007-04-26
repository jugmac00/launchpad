# Copyright 2004-2005 Canonical Ltd.  All rights reserved.

"""Binary package in a distroarchrelease interfaces."""

__metaclass__ = type

__all__ = [
    'IDistroArchReleaseBinaryPackage',
    ]

from zope.interface import Interface, Attribute


class IDistroArchReleaseBinaryPackage(Interface):

    distroarchrelease = Attribute("The distribution architecture release.")
    binarypackagename = Attribute("The binary package name.")

    name = Attribute("The binary package name as text")
    displayname = Attribute("Display name for this package.")
    title = Attribute("Title for this package.")

    summary = Attribute("A guessed summary for this package. Either "
        "the currentrelease summary, or the cached one for all "
        "architectures.")

    description = Attribute("A description for this package, as for "
        "the summary above.")

    distribution = Attribute("The distribution of the package.")
    distrorelease = Attribute("The distrorelease of the package.")

    releases = Attribute("All of the distroarchrelease binary package "
        "releases that have been made for this package.")

    currentrelease = Attribute("""The latest published BinaryPackageRelease
        of a binary package with this name in the DistroArchRelease
        or None if no binary package with that name is
        published here.""")

    publishing_history = Attribute("Return a list of publishing "
        "records for this binary package in this distribution.")

    current_published = Attribute("is last BinaryPackagePublishing "
                                  "record that is in PUBLISHED status.")

    def __getitem__(version):
        """Return the DistroArchReleaseBinaryPackageRelease with the given
        version, or None if there has never been a release with that
        version, in this architecture release.
        """

    def changeOverride(new_component=None, new_section=None,
                       new_priority=None):
        """Change the component, section and/or priority.

        It is changed only if the argument is not None.
        """

    def supersede():
        """Supersede a DistroArchReleaseBinaryPackageRelease.

        Return the modified IBinaryPackagePublishingHistory object.
        """

    def copyTo(distrorelease, pocket):
        """Copy a DistroArchReleaseBinaryPackage to another location.

        Return the publishing record in the targeted location.
        """

