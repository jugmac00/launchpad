# Copyright 2015 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""Communication with the Git hosting service."""

__metaclass__ = type
__all__ = [
    'GitHostingClient',
    ]

import json
from urlparse import urljoin

import requests

from lp.code.errors import (
    GitRepositoryCreationFault,
    GitRepositoryDeletionFault,
    GitRepositoryScanFault,
    )


class GitHostingClient:
    """A client for the internal API provided by the Git hosting system."""

    def __init__(self, endpoint):
        self.endpoint = endpoint

    def _makeSession(self):
        session = requests.Session()
        session.trust_env = False
        return session

    def _request(self, method, path, json_data=None, **kwargs):
        session = self._makeSession()
        if json_data is not None:
            # XXX cjwatson 2015-03-01: Once we're on requests >= 2.4.2, we
            # should just pass json through directly and drop the explicit
            # Content-Type header.
            kwargs.setdefault("headers", {})["Content-Type"] = (
                "application/json")
            kwargs["data"] = json.dumps(json_data)
        response = getattr(session, method)(
            urljoin(self.endpoint, path), **kwargs)
        if response.status_code != 200:
            raise Exception(response.text)
        return response.json()

    def _get(self, path, **kwargs):
        return self._request("get", path, **kwargs)

    def _post(self, path, **kwargs):
        return self._request("post", path, **kwargs)

    def _delete(self, path, **kwargs):
        return self._request("delete", path, **kwargs)

    @property
    def timeout(self):
        # XXX cjwatson 2015-03-01: The hardcoded timeout at least means that
        # we don't lock tables indefinitely if the hosting service falls
        # over, but is there some more robust way to do this?
        return 5.0

    def create(self, path, clone_from=None):
        try:
            if clone_from:
                request = {"repo_path": path, "clone_from": clone_from}
            else:
                request = {"repo_path": path}
            self._post("/repo", json_data=request, timeout=self.timeout)
        except Exception as e:
            raise GitRepositoryCreationFault(
                "Failed to create Git repository: %s" % unicode(e))

    def getRefs(self, path):
        try:
            return self._get("/repo/%s/refs" % path, timeout=self.timeout)
        except Exception as e:
            raise GitRepositoryScanFault(
                "Failed to get refs from Git repository: %s" % unicode(e))

    def getCommits(self, path, commit_oids, logger=None):
        commit_oids = list(commit_oids)
        try:
            if logger is not None:
                logger.info("Requesting commit details for %s" % commit_oids)
            return self._post(
                "/repo/%s/commits" % path,
                json_data={"commits": commit_oids}, timeout=self.timeout)
        except Exception as e:
            raise GitRepositoryScanFault(
                "Failed to get commit details from Git repository: %s" %
                unicode(e))

    def getMergeDiff(self, path, base, head, logger=None):
        """Get the merge preview diff between two commits.

        :return: A dict mapping 'commits' to a list of commits between
            'base' and 'head' (formatted as with `getCommits`), 'patch' to
            the text of the diff between 'base' and 'head', and 'conflicts'
            to a list of conflicted paths.
        """
        try:
            if logger is not None:
                logger.info(
                    "Requesting merge diff for %s from %s to %s" % (
                        path, base, head))
            return self._get(
                "/repo/%s/compare-merge/%s:%s" % (path, base, head),
                timeout=self.timeout)
        except Exception as e:
            raise GitRepositoryScanFault(
                "Failed to get merge diff from Git repository: %s" %
                unicode(e))

    def delete(self, path, logger=None):
        """Delete a repository."""
        try:
            if logger is not None:
                logger.info("Deleting repository %s" % path)
            return self._delete("/repo/%s" % path)
        except Exception as e:
            raise GitRepositoryDeletionFault(
                "Failed to delete Git repository: %s" % unicode(e))
