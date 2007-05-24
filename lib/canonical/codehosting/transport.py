# Copyright 2004-2007 Canonical Ltd.  All rights reserved.

"""Bazaar transport for the Launchpad code hosting file system."""

__metaclass__ = type
__all__ = ['LaunchpadServer']

from bzrlib.transport import (
    Server,
    )


def branch_id_to_path(branch_id):
    h = "%08x" % int(branch_id)
    return '%s/%s/%s/%s' % (h[:2], h[2:4], h[4:6], h[6:])


def split(string, splitter, num_fields):
    tokens = string.split(splitter, num_fields - 1)
    tokens.extend([''] * max(0, num_fields - len(tokens)))
    return tokens


class LaunchpadServer(Server):
    def __init__(self, authserver, user_id):
        self.authserver = authserver
        self.user_id = user_id
        self._branches = dict(self._iter_branches())

    def _iter_branches(self):
        for team_dict in self.authserver.getUser(self.user_id)['teams']:
            products = self.authserver.getBranchesForUser(team_dict['id'])
            for product_id, product_name, branches in products:
                for branch_id, branch_name in branches:
                    yield (team_dict['name'], product_name, branch_name), branch_id

    def translate_relpath(self, relpath):
        user, product, branch, path = split(relpath, '/', 4)
        assert user[0] == '~', "Temporary assertion"
        user = user[1:]
        branch_id = self._branches[(user, product, branch)]
        return '/'.join([branch_id_to_path(branch_id), path])
