# Copyright 2009 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).
#
# Derived from make_master.py by Oran Looney.
# http://oranlooney.com/make-css-sprites-python-image-library/

"""Library to create sprites."""

__metaclass__ = type

__all__ = [
    'SpriteUtil',
    ]

from __future__ import with_statement
import os
import sys
import re
import cssutils
import Image

MARGIN = 18

class SpriteUtil:
    def __init__(self):
        self.sprites = None
        self.combined_image = None
        self.positions = None
        self.css_object = None

    def loadCSSTemplate(css_file, group_name):
        smartsprites_exp = re.compile(
            r'/\*+([^*]*sprite-ref: [^*]*)\*/')
        self.css_object = cssutils.parseFile(css_file)
        sprites = []
        for rule in self.css_object:
            match = smartsprites_exp.search(rule.cssText)
            if match is not None:
                smartsprites_info = match.group(1)
                for parameter in smartsprites_info.split(';'):
                    if parameter.strip() != '':
                        name, value = parameter.split(':')
                        name = name.strip()
                        value = value.strip()
                        if value == group_name:
                            # Remove url() from string.
                            filename = rule.style.backgroundImage[4:-1]
                            sprites.append(dict(filename=filename, rule=rule))
        self.sprites = sprites

    def combineImages(self, css_file):
        self.loadCSSTemplate(css_file)
        for sprite in self.sprites:
            css_dir, _css_file = os.path.split(TEMPLATE_CSS_FILE)
            filename = os.path.join(css_dir, sprite['filename'])
            sprite['image'] = Image.open(filename)

        if len(self.sprites) == 0:
            raise AssertionError("No images found.")

        max_width = 0
        total_height = 0
        for sprite in self.sprites:
            width, height = sprite['image'].size
            max_width = max(width, max_width)
            total_height += height

        master_width = max_width
        # Separate each image with lots of whitespace.
        master_height = total_height + (MARGIN * len(self.sprites))
        transparent = (0,0,0,0)
        master = Image.new(
            mode='RGBA',
            size=(master_width, master_height),
            color=transparent)

        y = 0
        positions = {}
        for index, sprite in enumerate(self.sprites):
            position = (0, y))
            master.paste(sprite['image'], position)
            positions[sprite['filename']] = position
            y += sprite['image'].size[1] + MARGIN

        self.positions = positions
        self.combined_image = master

    def savePNG(self, filename):
        self.combined_image.save(filename, format='png')

    def savePositioning(self, filename):
        with open(filename, 'w') as fp:
            for sprite in sprites:
                rule = sprite['rule']
                fp.write('%s=%s\n' % (sprite['filename'], sprite['position']))

    def loadPositioning(self, filename):
        for line in open(filename):
            filename, position = line.strip().split('=')
            positions[filename] = position
        self.locations = locations

    def saveConvertedCSS(self, filename):
        for sprite in self.sprites:
            rule = sprite['rule']
            rule.style.backgroundImage = 'url(master.%s)' % format
            position = self.positions[sprite['filename']
            rule.style.backgroundPosition = '0px %dpx' % position

        open(filename, 'w').write(self.css_object.cssText)
