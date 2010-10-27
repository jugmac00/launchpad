# Copyright 2010 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""Fixtures related to configs.

XXX: Robert Collins 2010-10-20 bug=663454 this is in the wrong namespace.
"""

__metaclass__ = type

__all__ = [
    'ConfigFixture',
    'ConfigUseFixture',
    ]

import os.path
import shutil
from textwrap import dedent

from fixtures import Fixture

from canonical.config import config


class ConfigFixture(Fixture):
    """Create a unique launchpad config."""

    _extend_str = dedent("""\
        [meta]
        extends: ../%s/launchpad-lazr.conf
        
        """)

    def __init__(self, instance_name, copy_from_instance):
        """Create a ConfigFixture.

        :param instance_name: The name of the instance to create.
        :param copy_from_instance: An existing instance to clone.
        """
        self.instance_name = instance_name
        self.copy_from_instance = copy_from_instance

    def setUp(self):
        super(ConfigFixture, self).setUp()
        root = 'configs/' + self.instance_name
        os.mkdir(root)
        absroot = os.path.abspath(root)
        self.addCleanup(shutil.rmtree, absroot)
        source = 'configs/' + self.copy_from_instance
        for basename in os.listdir(source):
            if basename == 'launchpad-lazr.conf':
                with open(root + '/launchpad-lazr.conf', 'wb') as out:
                    out.write(self._extend_str % self.copy_from_instance)
                continue
            with open(source + '/' + basename, 'rb') as input:
                with open(root + '/' + basename, 'wb') as out:
                    out.write(input.read())


class ConfigUseFixture(Fixture):
    """Use a config and restore the current config after."""

    def __init__(self, instance_name):
        self.instance_name = instance_name

    def setUp(self):
        super(ConfigUseFixture, self).setUp()
        self.addCleanup(config.setInstance, config.instance_name)
        config.setInstance(self.instance_name)
