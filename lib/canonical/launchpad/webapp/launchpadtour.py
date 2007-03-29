# Copyright 2007 Canonical Ltd.  All rights reserved.

"""Base view for writing application tour."""

__metaclass__ = type

__all__ = [
    'LaunchpadTourView',
    ]

# use cElementTree if it is available ...
try:
    import xml.elementtree.cElementTree as ET
except ImportError:
    try:
        import cElementTree as ET
    except ImportError:
        import elementtree.ElementTree as ET

from zope.app.pagetemplate import ViewPageTemplateFile

from zope.interface import implements

from zope.publisher.interfaces import NotFound
from zope.publisher.interfaces.browser import IBrowserPublisher

from canonical.cachedproperty import cachedproperty

from canonical.launchpad.interfaces import UnexpectedFormData
from canonical.launchpad.webapp.publisher import LaunchpadView
from canonical.launchpad.webapp.vhosts import allvhosts


def get_node_text(node, default=None):
    """Return the text content of an XML node.

    If the element is missing, returns the default value."""

    if node is not None:
        return node.text
    else:
        return default


def get_node_html_text(node):
    """Return the content of a node as an HTML string.

    The node subelements are considered XHTML elements.
    """
    content = []
    if node.text:
        content.append(node.text)
    for subnode in node:
        content.append(ET.tostring(subnode))
    if node.tail:
        content.append(node.tail)
    return "".join(content)


class LaunchpadTourView(LaunchpadView):
    """A view that serves an appplication tour.

    The tour is defined in an XML file describing each screen in the tour
    with callouts.
    """
    implements(IBrowserPublisher)

    template = ViewPageTemplateFile("../templates/marketing-tour.pt")

    def __init__(self, context, request, tour):
        """Create a tour view.

        :param context: The view context.
        :param request: The view request.
        :param tour: Path the XML file containing the tour definition.
        """
        self.request = request
        self.context = context

        self._parseTourXML(tour)

    def _parseTourXML(self, tour_xml):
        """Parse the tour structure described in the XML file."""
        root = ET.parse(tour_xml).getroot()

        self.title = get_node_text(root.find('title'))
        self._next_tour_vhost = root.get('next', None)
        self._screens = [
            self._createScreen(node) for node in root.findall('screen')]

    def _createScreen(self, node):
        """Return a dict containing the screen attributes."""
        screen = {}
        screen['title'] = get_node_text(node.find('title'))
        screen['summary'] = get_node_text(node.find('summary'))
        screen['screenshot'] = get_node_text(node.find('screenshot'))
        screen['callouts'] = [
            self._createCallout(callout)
            for callout in node.findall('callout')]
        return screen

    def _createCallout(self, node):
        """Return a dict containing the callout attributes."""
        callout = {}
        callout['text'] = get_node_html_text(node)
        try:
            callout['top'] = int(node.get('top', 0))
        except ValueError:
            callout['top'] = 0
        try:
            callout['left'] = int(node.get('left', 0))
        except ValueError:
            callout['left'] = 0
        return callout

    @property
    def pagetitle(self):
        """Return the page title."""
        return "%s Tour: %s" % (
            self.title, self.screen_titles[self.current_screen_index])

    @property
    def screen_titles(self):
        """Return the list of screen titles."""
        return [screen['title'] for screen in self._screens]

    @property
    def current_screen(self):
        """Return the currently selected screen."""
        return self._screens[self.current_screen_index]

    @property
    def next_screen_index(self):
        """Return the next screen index or None if this is the last screen."""
        if self.current_screen_index + 1 >= len(self._screens):
            return None
        return self.current_screen_index + 1

    @property
    def next_tour_url(self):
        """Return the URL to the next tour."""
        if self._next_tour_vhost in allvhosts.configs:
            return allvhosts.configs[self._next_tour_vhost].rooturl + '+tour'
        else:
            return None

    def initialize(self):
        """Find the current screen from the request."""
        index = self.request.form.get('screen', 0)
        try:
            index = int(index)
        except ValueError:
            raise UnexpectedFormData("Invalid screen reference: %s" % index)
        if index >= len(self._screens):
            raise UnexpectedFormData("No such screen: %s" % index)
        self.current_screen_index = index

    def publishTraverse(self, request, name):
        """See IBrowserPublisher."""
        raise NotFound(self, name, request)

    def browserDefault(self, request):
        """See IBrowserPublisher."""
        return self, ()

