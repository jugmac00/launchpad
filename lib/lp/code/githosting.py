# Copyright 2015 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""Communication with the Git hosting service."""

__metaclass__ = type
__all__ = [
    'GitHostingClient',
    ]

import json

from bzrlib import urlutils
import requests

from lp.code.errors import (
    GitRepositoryCreationFault,
    GitRepositoryRefScanFault,
    )


class GitHostingClient:
    """A client for the internal API provided by the Git hosting system."""

    def __init__(self, endpoint):
        self.endpoint = endpoint

    def _makeSession(self):
        session = requests.Session()
        session.trust_env = False
        return session

    @property
    def timeout(self):
        # XXX cjwatson 2015-03-01: The hardcoded timeout at least means that
        # we don't lock tables indefinitely if the hosting service falls
        # over, but is there some more robust way to do this?
        return 5.0

    def create(self, path):
        try:
            # XXX cjwatson 2015-03-01: Once we're on requests >= 2.4.2, we
            # should just use post(json=) and drop the explicit Content-Type
            # header.
            response = self._makeSession().post(
                urlutils.join(self.endpoint, "repo"),
                headers={"Content-Type": "application/json"},
                data=json.dumps({"repo_path": path, "bare_repo": True}),
                timeout=self.timeout)
        except Exception as e:
            raise GitRepositoryCreationFault(
                "Failed to create Git repository: %s" % unicode(e))
        if response.status_code != 200:
            raise GitRepositoryCreationFault(
                "Failed to create Git repository: %s" % response.text)

    def get_refs(self, path):
        try:
            response = self._makeSession().get(
                urlutils.join(self.endpoint, "repo", path, "refs"),
                timeout=self.timeout)
        except Exception as e:
            raise GitRepositoryRefScanFault(
                "Failed to get refs from Git repository: %s" % unicode(e))
        if response.status_code != 200:
            raise GitRepositoryRefScanFault(
                "Failed to get refs from Git repository: %s" % response.text)
        try:
            return response.json()
        except ValueError as e:
            raise GitRepositoryRefScanFault(
                "Failed to decode ref-scan response: %s" % unicode(e))
