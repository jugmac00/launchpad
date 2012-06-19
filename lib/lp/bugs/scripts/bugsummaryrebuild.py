# Copyright 2012 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

__metaclass__ = type

from lp.bugs.model.bugsummary import RawBugSummary
from lp.bugs.model.bugtask import (
    bug_target_from_key,
    BugTask,
    )
from lp.registry.interfaces.series import ISeriesMixin
from lp.registry.model.product import Product
from lp.registry.model.productseries import ProductSeries
from lp.registry.model.distribution import Distribution
from lp.registry.model.distroseries import DistroSeries
from lp.registry.model.sourcepackagename import SourcePackageName
from lp.services.database.lpstorm import IStore
from lp.services.looptuner import TunableLoop


def get_bugsummary_targets():
    """Get the current set of targets represented in BugSummary."""
    return set(IStore(RawBugSummary).find(
        (RawBugSummary.product_id, RawBugSummary.productseries_id,
         RawBugSummary.distribution_id, RawBugSummary.distroseries_id,
         RawBugSummary.sourcepackagename_id)).config(distinct=True))


def get_bugtask_targets():
    """Get the current set of targets represented in BugTask."""
    new_targets = set(IStore(BugTask).find(
        (BugTask.productID, BugTask.productseriesID,
         BugTask.distributionID, BugTask.distroseriesID,
         BugTask.sourcepackagenameID)).config(distinct=True))
    # BugSummary counts package tasks in the packageless totals, so
    # ensure that there's also a packageless total for each distro(series).
    new_targets.update(set(
        (p, ps, d, ds, None) for (p, ps, d, ds, spn) in new_targets))
    return new_targets


def load_target(pid, psid, did, dsid, spnid):
    store = IStore(Product)
    p = store.get(Product, pid)
    ps = store.get(ProductSeries, psid)
    d = store.get(Distribution, did)
    ds = store.get(DistroSeries, dsid)
    spn = store.get(SourcePackageName, spnid)
    return bug_target_from_key(p, ps, d, ds, spn)


def format_target(target):
    id = target.pillar.name
    series = (
        (ISeriesMixin.providedBy(target) and target)
        or getattr(target, 'distroseries', None)
        or getattr(target, 'productseries', None))
    if series:
        id += '/%s' % series.name
    spn = getattr(target, 'sourcepackagename', None)
    if spn:
        id += '/+source/%s' % spn.name
    return id


def get_bugsummary_rows(*args):
    results = IStore(RawBugSummary).find(
        (RawBugSummary.product_id, RawBugSummary.productseries_id,
         RawBugSummary.distribution_id, RawBugSummary.distroseries_id,
         RawBugSummary.sourcepackagename_id, RawBugSummary.milestone_id,
         RawBugSummary.status, RawBugSummary.importance, RawBugSummary.tag,
         RawBugSummary.viewed_by_id, RawBugSummary.has_patch,
         RawBugSummary.count),
        *args)
    return set(results)


class BugSummaryRebuildTunableLoop(TunableLoop):

    maximum_chunk_size = 100

    def __init__(self, log, abort_time=None):
        super(BugSummaryRebuildTunableLoop, self).__init__(log, abort_time)
        self.targets = list(
            get_bugsummary_targets().union(get_bugtask_targets()))
        self.offset = 0

    def isDone(self):
        return self.offset >= len(self.targets)

    def __call__(self, chunk_size):
        chunk_size = int(chunk_size)
        chunk = self.targets[self.offset:self.offset + chunk_size]

        for target_key in chunk:
            target = load_target(*target_key)
            self.log.info("Rebuilding %s" % format_target(target))
        self.offset += len(chunk)
