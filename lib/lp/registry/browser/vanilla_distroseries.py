# Copyright 2025 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""Vanilla view classes related to `IDistroSeries`."""

__all__ = [
    "VanillaDistroSeriesView",
]


from datetime import datetime, timedelta, timezone

from lp.bugs.browser.bugtask import BugTaskImportance, BugTaskStatus
from lp.bugs.interfaces.bugtasksearch import BugTaskSearchParams
from lp.buildmaster.enums import BuildStatus
from lp.layers import VanillaLayer, setAdditionalLayer
from lp.registry.browser import MilestoneOverlayMixin
from lp.registry.browser.distroseries import DerivedDistroSeriesMixin
from lp.registry.interfaces.series import SeriesStatus
from lp.registry.model.milestone import milestone_sort_key
from lp.services.database.interfaces import IStore
from lp.services.webapp.publisher import LaunchpadView
from lp.soyuz.model.binarypackagebuild import BinaryPackageBuild


class VanillaDistroSeriesView(
    LaunchpadView, MilestoneOverlayMixin, DerivedDistroSeriesMixin
):
    """View for the vanilla distroseries page."""

    def __init__(self, context, request):
        super().__init__(context, request)

    def initialize(self):
        super().initialize()
        setAdditionalLayer(self.request, VanillaLayer)

    @property
    def page_title(self):
        """Return the HTML page title."""
        return "%s (%s) : %s" % (
            self.context.displayname,
            self.context.version,
            self.context.distribution.displayname,
        )

    @property
    def status_chip_color(self):
        """
        Return the status chip color.
        See: https://vanillaframework.io/docs/patterns/chip#colour-coding
        """
        if self.context.status in [
            SeriesStatus.CURRENT,
            SeriesStatus.SUPPORTED,
        ]:
            return "p-chip--positive"

        if self.context.status in [
            SeriesStatus.DEVELOPMENT,
            SeriesStatus.FROZEN,
            SeriesStatus.FUTURE,
        ]:
            return "p-chip--information"

        if self.context.status in [
            SeriesStatus.EXPERIMENTAL,
            SeriesStatus.OBSOLETE,
        ]:
            return "p-chip--caution"

        return "p-chip--information"

    @property
    def bugs_summary(self):
        """Return the bugs summary (critical, in progress, triaged counts)."""

        importance_params = BugTaskSearchParams(
            importance=BugTaskImportance.CRITICAL,
            orderby="-datecreated",
            omit_dupes=True,
            user=self.user,
        )
        importance_params.setDistroSeries(self.context)
        critical_bugs = self.context.searchTasks(importance_params)

        inprogress_params = BugTaskSearchParams(
            status=BugTaskStatus.INPROGRESS,
            orderby="-datecreated",
            omit_dupes=True,
            user=self.user,
        )
        inprogress_params.setDistroSeries(self.context)
        inprogress_bugs = self.context.searchTasks(inprogress_params)

        triaged_params = BugTaskSearchParams(
            status=BugTaskStatus.TRIAGED,
            orderby="-datecreated",
            omit_dupes=True,
            user=self.user,
        )
        triaged_params.setDistroSeries(self.context)
        triaged_bugs = self.context.searchTasks(triaged_params)

        return {
            "critical_bugs_count": critical_bugs.count(),
            "inprogress_bugs_count": inprogress_bugs.count(),
            "triaged_bugs_count": triaged_bugs.count(),
        }

    @property
    def packages_summary_24h(self):
        """Return the packages summary for the last 24 hours."""
        store = IStore(BinaryPackageBuild)
        cutoff = datetime.now(timezone.utc) - timedelta(hours=24)
        base_clauses = [
            BinaryPackageBuild.distro_series == self.context,
            BinaryPackageBuild.is_distro_archive,
            BinaryPackageBuild.date_finished >= cutoff,
        ]

        total_built = store.find(
            BinaryPackageBuild,
            *base_clauses,
        ).count()
        successful_builds = store.find(
            BinaryPackageBuild,
            *base_clauses,
            BinaryPackageBuild.status == BuildStatus.FULLYBUILT,
        ).count()
        failed_to_build = store.find(
            BinaryPackageBuild,
            *base_clauses,
            BinaryPackageBuild.status == BuildStatus.FAILEDTOBUILD,
        ).count()
        failed_to_upload = store.find(
            BinaryPackageBuild,
            *base_clauses,
            BinaryPackageBuild.status == BuildStatus.FAILEDTOUPLOAD,
        ).count()

        return {
            "built_packages_percentage": (
                round(successful_builds / total_built * 100, 1)
                if total_built
                else 0
            ),
            "failed_to_build_packages_count": failed_to_build,
            "failed_to_upload_packages_count": failed_to_upload,
        }

    @property
    def next_milestone(self):
        """Return the closest upcoming milestone by expected date."""
        today = datetime.today().date()
        # `self.context.milestones` already returns active milestones for this
        # distroseries; we further restrict to those with a date on or after
        # today and pick the one with the earliest expected date.
        upcoming = [
            milestone
            for milestone in self.context.milestones
            if milestone.dateexpected is not None
            and milestone.dateexpected >= today
        ]

        if not upcoming:
            return None

        return min(upcoming, key=milestone_sort_key)
