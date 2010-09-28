# Copyright 2009 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""Utilities for the update-bugzilla-remote-components cronscript"""

__metaclass__ = type
__all__ = [
    'BugzillaRemoteComponentFinder',
    'LaunchpadBugTracker',
    ]

import re
from StringIO import StringIO

import urllib
from urllib2 import (
        HTTPError,
        urlopen,
        )
from BeautifulSoup import BeautifulSoup


class BugzillaRemoteComponentFinder:

    re_products_select = re.compile(r'<select name="product".*onchange="doOnSelectProduct\(2\);">(.*?)</select>', re.DOTALL)
    re_product = re.compile(r'<option value="(.*)">(.*)</option>')
    re_cpts = re.compile(r'cpts\[(\d+)\] = \[(.*)\]')
    re_vers = re.compile(r'vers\[(\d+)\] = \[(.*)\]')

    def __init__(self, bzurl):
        self.products = {}

        # TODO:  Hack!!  This should be fixed in sampledata
        if (bzurl == "http://bugzilla.gnome.org/bugs" or
            bzurl == "http://bugzilla.gnome.org/"):
            bzurl = "http://bugzilla.gnome.org"
        elif (bzurl == "https://bugzilla.mozilla.org/"):
            bzurl = " https://bugzilla.mozilla.org"

        self.url = "%s/query.cgi?format=advanced" %(bzurl)

    def _getPage(self, url):
        return urlopen(url).read()

    def dictFromCSV(self, line):
        items_dict = {}
        for item in line.split(","):
            item = item.strip()
            item = item.replace("'", "")
            item = item.replace("\\", "")
            items_dict[item] = {
                'name': item,
                }
        return items_dict

    def retrieveProducts(self):
        try:
            body = self._getPage(self.url)
            soup = BeautifulSoup(body)
        except HTTPError, error:
            #self.logger.error("Error fetching %s: %s" % (url, error))
            return None

        # Load products into a list since Bugzilla references them by index number
        products = []
        for product in soup.find(
            name='select',
            onchange="doOnSelectProduct(2);").contents:
            if product.string != "\n":
                products.append({
                    'name': product.string,
                    'components': {},
                    'versions': None
                    })

        for script_text in soup.findAll(name="script"):
            if script_text is None or script_text.string is None:
                continue
            for line in script_text.string.split(";"):
                m = self.re_cpts.search(line)
                if m:
                    num = int(m.group(1))
                    products[num]['components'] = self.dictFromCSV(m.group(2))

                m = self.re_vers.search(line)
                if m:
                    num = int(m.group(1))
                    products[num]['versions'] = self.dictFromCSV(m.group(2))

        # Re-map list into dict for easier lookups
        for product in products:
            product_name = product['name']
            self.products[product_name] = product


# TODO: Perhaps this can be replaced by the BugTracker model class?
class LaunchpadBugTracker:
    def __init__(self, bugtracker_name):
        self.name = bugtracker_name
        self.products = {}

    def getComponentGroup(self, bz_product_name):
        # TODO: Look to see if the Bugzilla product name is registered with
        #       a Launchpad product, and if so, return it
        return None

    def retrieveProducts(self):
        # TODO: Retrieve the bugtracker object from launchpad

        launchpad_components = {
            'libglx': {
                'name': 'libglx',
                'is_visible': True,
                'is_custom': False,
                },
            'DRM/ObsoleteDriver': {
                'name': 'DRM/ObsoleteDriver',
                'is_visible': True,
                'is_custom': False,
                },
            'DRM/other': {
                'name': 'DRM/other',
                'is_visible': False,
                'is_custom': False,
                },
            'DRM/fglrx': {
                'name': 'DRM/fglrx',
                'is_visible': True,
                'is_custom': True,
                },
            'deleted-custom-component': {
                'name': 'deleted-custom-component',
                'is_visible': False,
                'is_custom': True,
                }
            }

        self.products['DRI'] = {
            'name': 'DRI',
            'components': launchpad_components,
            }

    def components(self, product_name=None):
        if not product_name:
            product_name = 'default'

        if not product_name in self.products:
            return {}

        product = self.products[product_name]

        return product['components']


