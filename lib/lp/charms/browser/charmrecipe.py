# Copyright 2021 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""Charm recipe views."""

__all__ = [
    "CharmRecipeAddView",
    "CharmRecipeAdminView",
    "CharmRecipeAuthorizeView",
    "CharmRecipeContextMenu",
    "CharmRecipeDeleteView",
    "CharmRecipeEditView",
    "CharmRecipeNavigation",
    "CharmRecipeNavigationMenu",
    "CharmRecipeRequestBuildsView",
    "CharmRecipeURL",
    "CharmRecipeView",
    ]

from lazr.restful.interface import (
    copy_field,
    use_template,
    )
from zope.component import getUtility
from zope.error.interfaces import IErrorReportingUtility
from zope.formlib.form import FormFields
from zope.interface import (
    implementer,
    Interface,
    )
from zope.schema import (
    Bool,
    Choice,
    Dict,
    List,
    TextLine,
    )
from zope.security.interfaces import Unauthorized

from lp import _
from lp.app.browser.launchpadform import (
    action,
    LaunchpadEditFormView,
    LaunchpadFormView,
    )
from lp.app.browser.lazrjs import InlinePersonEditPickerWidget
from lp.app.browser.tales import format_link
from lp.charms.browser.widgets.charmrecipebuildchannels import (
    CharmRecipeBuildChannelsWidget,
    )
from lp.charms.interfaces.charmhubclient import (
    BadRequestPackageUploadResponse,
    )
from lp.charms.interfaces.charmrecipe import (
    CannotAuthorizeCharmhubUploads,
    CHARM_RECIPE_WEBHOOKS_FEATURE_FLAG,
    ICharmRecipe,
    ICharmRecipeSet,
    NoSuchCharmRecipe,
    )
from lp.charms.interfaces.charmrecipebuild import ICharmRecipeBuildSet
from lp.code.browser.widgets.gitref import GitRefWidget
from lp.code.interfaces.gitref import IGitRef
from lp.registry.interfaces.personproduct import IPersonProductFactory
from lp.registry.interfaces.product import IProduct
from lp.services.channels import (
    channel_list_to_string,
    channel_string_to_list,
    )
from lp.services.features import getFeatureFlag
from lp.services.propertycache import cachedproperty
from lp.services.utils import seconds_since_epoch
from lp.services.webapp import (
    canonical_url,
    ContextMenu,
    enabled_with_permission,
    LaunchpadView,
    Link,
    Navigation,
    NavigationMenu,
    stepthrough,
    structured,
    )
from lp.services.webapp.breadcrumb import (
    Breadcrumb,
    NameBreadcrumb,
    )
from lp.services.webapp.candid import request_candid_discharge
from lp.services.webapp.interfaces import ICanonicalUrlData
from lp.services.webhooks.browser import WebhookTargetNavigationMixin
from lp.snappy.browser.widgets.storechannels import StoreChannelsWidget
from lp.soyuz.browser.build import get_build_by_id_str


@implementer(ICanonicalUrlData)
class CharmRecipeURL:
    """Charm recipe URL creation rules."""
    rootsite = "mainsite"

    def __init__(self, recipe):
        self.recipe = recipe

    @property
    def inside(self):
        owner = self.recipe.owner
        project = self.recipe.project
        return getUtility(IPersonProductFactory).create(owner, project)

    @property
    def path(self):
        return "+charm/%s" % self.recipe.name


class CharmRecipeNavigation(WebhookTargetNavigationMixin, Navigation):
    usedfor = ICharmRecipe

    @stepthrough("+build-request")
    def traverse_build_request(self, name):
        try:
            job_id = int(name)
        except ValueError:
            return None
        return self.context.getBuildRequest(job_id)

    @stepthrough("+build")
    def traverse_build(self, name):
        build = get_build_by_id_str(ICharmRecipeBuildSet, name)
        if build is None or build.recipe != self.context:
            return None
        return build


class CharmRecipeBreadcrumb(NameBreadcrumb):

    @property
    def inside(self):
        # XXX cjwatson 2021-06-04: This should probably link to an
        # appropriate listing view, but we don't have one of those yet.
        return Breadcrumb(
            self.context.project, text=self.context.project.display_name,
            inside=self.context.project)


class CharmRecipeNavigationMenu(NavigationMenu):
    """Navigation menu for charm recipes."""

    usedfor = ICharmRecipe

    facet = "overview"

    links = ("admin", "edit", "webhooks", "authorize", "delete")

    @enabled_with_permission("launchpad.Admin")
    def admin(self):
        return Link("+admin", "Administer charm recipe", icon="edit")

    @enabled_with_permission("launchpad.Edit")
    def edit(self):
        return Link("+edit", "Edit charm recipe", icon="edit")

    @enabled_with_permission("launchpad.Edit")
    def webhooks(self):
        return Link(
            "+webhooks", "Manage webhooks", icon="edit",
            enabled=(
                bool(getFeatureFlag(CHARM_RECIPE_WEBHOOKS_FEATURE_FLAG)) and
                bool(getFeatureFlag("webhooks.new.enabled"))))

    @enabled_with_permission("launchpad.Edit")
    def authorize(self):
        if self.context.store_secrets:
            text = "Reauthorize Charmhub uploads"
        else:
            text = "Authorize Charmhub uploads"
        return Link("+authorize", text, icon="edit")

    @enabled_with_permission("launchpad.Edit")
    def delete(self):
        return Link("+delete", "Delete charm recipe", icon="trash-icon")


class CharmRecipeContextMenu(ContextMenu):
    """Context menu for charm recipes."""

    usedfor = ICharmRecipe

    facet = "overview"

    links = ("request_builds",)

    @enabled_with_permission("launchpad.Edit")
    def request_builds(self):
        return Link("+request-builds", "Request builds", icon="add")


class CharmRecipeView(LaunchpadView):
    """Default view of a charm recipe."""

    @cachedproperty
    def builds_and_requests(self):
        return builds_and_requests_for_recipe(self.context)

    @property
    def person_picker(self):
        field = copy_field(
            ICharmRecipe["owner"],
            vocabularyName="AllUserTeamsParticipationPlusSelfSimpleDisplay")
        return InlinePersonEditPickerWidget(
            self.context, field, format_link(self.context.owner),
            header="Change owner", step_title="Select a new owner")

    @property
    def build_frequency(self):
        if self.context.auto_build:
            return "Built automatically"
        else:
            return "Built on request"

    @property
    def sorted_auto_build_channels_items(self):
        if self.context.auto_build_channels is None:
            return []
        return sorted(self.context.auto_build_channels.items())

    @property
    def store_channels(self):
        return ", ".join(self.context.store_channels)

    @property
    def user_can_see_source(self):
        try:
            return self.context.source.visibleByUser(self.user)
        except Unauthorized:
            return False


def builds_and_requests_for_recipe(recipe):
    """A list of interesting builds and build requests.

    All pending builds and pending build requests are shown, as well as up
    to 10 recent builds and recent failed build requests.  Pending items are
    ordered by the date they were created; recent items are ordered by the
    date they finished (if available) or the date they started (if the date
    they finished is not set due to an error).  This allows started but
    unfinished builds to show up in the view but be discarded as more recent
    builds become available.

    Builds that the user does not have permission to see are excluded (by
    the model code).
    """
    # We need to interleave items of different types, so SQL can't do all
    # the sorting for us.
    def make_sort_key(*date_attrs):
        def _sort_key(item):
            for date_attr in date_attrs:
                if getattr(item, date_attr, None) is not None:
                    return -seconds_since_epoch(getattr(item, date_attr))
            return 0

        return _sort_key

    items = sorted(
        list(recipe.pending_builds) + list(recipe.pending_build_requests),
        key=make_sort_key("date_created", "date_requested"))
    if len(items) < 10:
        # We need to interleave two unbounded result sets, but we only need
        # enough items from them to make the total count up to 10.  It's
        # simplest to just fetch the upper bound from each set and do our
        # own sorting.
        recent_items = sorted(
            list(recipe.completed_builds[:10 - len(items)]) +
            list(recipe.failed_build_requests[:10 - len(items)]),
            key=make_sort_key(
                "date_finished", "date_started",
                "date_created", "date_requested"))
        items.extend(recent_items[:10 - len(items)])
    return items


class ICharmRecipeEditSchema(Interface):
    """Schema for adding or editing a charm recipe."""

    use_template(ICharmRecipe, include=[
        "owner",
        "name",
        "project",
        "require_virtualized",
        "auto_build",
        "auto_build_channels",
        "store_upload",
        ])

    git_ref = copy_field(ICharmRecipe["git_ref"], required=True)

    # This is only required if store_upload is True.  Later validation takes
    # care of adjusting the required attribute.
    store_name = copy_field(ICharmRecipe["store_name"], required=True)
    store_channels = copy_field(ICharmRecipe["store_channels"], required=True)


def log_oops(error, request):
    """Log an oops report without raising an error."""
    info = (error.__class__, error, None)
    getUtility(IErrorReportingUtility).raising(info, request)


class CharmRecipeAuthorizeMixin:

    def requestAuthorization(self, recipe):
        try:
            self.next_url = CharmRecipeAuthorizeView.requestAuthorization(
                recipe, self.request)
        except BadRequestPackageUploadResponse as e:
            self.setFieldError(
                "store_upload",
                "Cannot get permission from Charmhub to upload this package.")
            log_oops(e, self.request)


class CharmRecipeAddView(CharmRecipeAuthorizeMixin, LaunchpadFormView):
    """View for creating charm recipes."""

    page_title = label = "Create a new charm recipe"

    schema = ICharmRecipeEditSchema

    custom_widget_git_ref = GitRefWidget
    custom_widget_auto_build_channels = CharmRecipeBuildChannelsWidget
    custom_widget_store_channels = StoreChannelsWidget
    store_channels_data = []

    @property
    def field_names(self):
        fields = ["owner", "name"]
        if self.is_project_context:
            fields += ["git_ref"]
        else:
            fields += ["project"]
        return fields + [
            "auto_build",
            "auto_build_channels",
            "store_upload",
            "store_name",
            "store_channels",
            ]

    @property
    def is_project_context(self):
        return IProduct.providedBy(self.context)

    @property
    def cancel_url(self):
        return canonical_url(self.context)

    @property
    def initial_values(self):
        initial_values = {"owner": self.user}
        if (IGitRef.providedBy(self.context) and
                IProduct.providedBy(self.context.target)):
            initial_values["project"] = self.context.target
        return initial_values

    def validate_widgets(self, data, names=None):
        """See `LaunchpadFormView`."""
        if self.widgets.get("store_upload") is not None:
            # Set widgets as required or optional depending on the
            # store_upload field.
            super().validate_widgets(data, ["store_upload"])
            store_upload = data.get("store_upload", False)
            self.widgets["store_name"].context.required = store_upload
            self.widgets["store_channels"].context.required = store_upload
        super().validate_widgets(data, names=names)

    @action("Create charm recipe", name="create")
    def create_action(self, action, data):
        if IGitRef.providedBy(self.context):
            project = data["project"]
            git_ref = self.context
        elif self.is_project_context:
            project = self.context
            git_ref = data["git_ref"]
        else:
            raise NotImplementedError(
                "Unknown context for charm recipe creation.")
        recipe = getUtility(ICharmRecipeSet).new(
            self.user, data["owner"], project, data["name"], git_ref=git_ref,
            auto_build=data["auto_build"],
            auto_build_channels=data["auto_build_channels"],
            store_upload=data["store_upload"],
            store_name=data["store_name"],
            store_channels=data.get("store_channels"))
        if data["store_upload"]:
            self.requestAuthorization(recipe)
        else:
            self.next_url = canonical_url(recipe)

    def validate(self, data):
        super().validate(data)
        owner = data.get("owner", None)
        if self.is_project_context:
            project = self.context
        else:
            project = data.get("project", None)
        name = data.get("name", None)
        if owner and project and name:
            if getUtility(ICharmRecipeSet).exists(owner, project, name):
                self.setFieldError(
                    "name",
                    "There is already a charm recipe owned by %s in %s with "
                    "this name." % (owner.display_name, project.display_name))

    def _getFieldName(self, name, store_channel_index):
        suffix = ".%s" % store_channel_index
        return name + suffix

    def parseData(self, data):
        track, risk, branch = data[0].split("/")
        self.store_channels_data.append(data[0])
        return self.store_channels_data

    @action("Save store channel data", name="add")
    def add_action(self, action, data):
        self.parseData(data["store_channels"])
        self.next_url = canonical_url(
            self.context, view_name="+new-charm-recipe")


class BaseCharmRecipeEditView(
        CharmRecipeAuthorizeMixin, LaunchpadEditFormView):

    schema = ICharmRecipeEditSchema

    def initialize(self):
        super().initialize()

    def _getFieldName(self, name, channel_index):
        return "%s.%d" % (name, channel_index)

    def getStoreWidgets(self, channel_index):
        widgets_by_name = {widget.name: widget for widget in self.widgets}

        track_field_name = (
                "field." + self._getFieldName("track", channel_index))

        branch_field_name = (
                "field." + self._getFieldName("branch", channel_index))
        risks_field_name = (
                "field." + self._getFieldName("risks", channel_index))
        delete_field_name = (
                "field." + self._getFieldName("delete", channel_index))
        risks = []
        track, risk, branch = channel_string_to_list(
            self.context.store_channels[channel_index])
        risks.append(risk)

        track_widget = widgets_by_name[track_field_name]
        track_widget.setRenderedValue(track)
        branch_widget = widgets_by_name[branch_field_name]
        branch_widget.setRenderedValue(branch)
        risks_widget = widgets_by_name[risks_field_name]
        risks_widget.setRenderedValue(risks)
        return {
            "track": track_widget,
            "branch": branch_widget,
            "risks": risks_widget,
            "delete": widgets_by_name[delete_field_name],
        }

    def setUpFields(self):
        """See `LaunchpadFormView`."""
        super().setUpFields()
        for index in range(len(self.context.store_channels)):
            self.form_fields += FormFields(TextLine(
                __name__=self._getFieldName('track', index),
                required=False))
            self.form_fields += FormFields(List(
                __name__=self._getFieldName('risks', index),
                required=False,
                value_type=Choice(vocabulary="SnapStoreChannel")))
            self.form_fields += FormFields(TextLine(
                __name__=self._getFieldName('branch', index),
                required=False))
            self.form_fields += FormFields(Bool(
                __name__=self._getFieldName('delete', index),
                readonly=False, default=False))

    def setUpWidgets(self, context=None):
        super().setUpWidgets(context=context)

    @property
    def cancel_url(self):
        return canonical_url(self.context)

    def validate_widgets(self, data, names=None):
        """See `LaunchpadFormView`."""
        if self.widgets.get("store_upload") is not None:
            # Set widgets as required or optional depending on the
            # store_upload field.
            super().validate_widgets(data, ["store_upload"])
            store_upload = data.get("store_upload", False)
            self.widgets["store_name"].context.required = store_upload
            self.widgets["store_channels"].context.required = store_upload
        super().validate_widgets(data, names=names)

    def validate(self, data):
        super().validate(data)
        # These are the requirements for public snaps.
        if "owner" in data:
            owner = data.get("owner", self.context.owner)
            if owner is not None and owner.private:
                self.setFieldError(
                    "owner",
                    "A public charm recipe cannot have a private owner.")
        if "git_ref" in data:
            ref = data.get("git_ref", self.context.git_ref)
            if ref is not None and ref.private:
                self.setFieldError(
                    "git_ref",
                    "A public charm recipe cannot have a private repository.")

    def _needCharmhubReauth(self, data):
        """Does this change require reauthorizing to Charmhub?"""
        store_upload = data.get("store_upload", False)
        store_name = data.get("store_name")
        if not store_upload or store_name is None:
            return False
        return (
            not self.context.store_upload or
            store_name != self.context.store_name)

    def parseData(self, data):
        """Rearrange form data to make it easier to process."""
        parsed_data = {}
        # The fields of the StoreChannelsWidget are the ones used to add
        # a new row / store channel entry, we parse it here and if any of its
        # data members are filled in we infer that the user id adding
        # a new entry on the edit screen.
        form_fields = data.keys()
        if 'field.store_channels.track' in form_fields:
            add_track = data["field.store_channels.track"]
            del data["field.store_channels.track"]
        else:
            add_track = None
        if 'field.store_channels.branch' in form_fields:
            add_branch = data["field.store_channels.branch"]
            del data["field.store_channels.branch"]
        else:
            add_branch = None
        if 'field.store_channels.risk' in form_fields:
            add_risk = data["field.store_channels.risk"]
            del data["field.store_channels.risk"]
        else:
            add_risk = None
        # parse data from the Add new channel data section of the form
        # essentially the 3 fields of the StoreChannelsWidget
        if add_track or add_branch or add_risk:
            add_store_channels = channel_list_to_string(
                add_track, add_branch, add_risk)
            parsed_data.setdefault(None, {
                "add_store_channels": add_store_channels,
                "action": "add",
            })
        # parse data from the Edit existing channels section of the form
        edited_store_channels = []
        for index in range(len(self.context.store_channels)):
            if not data["delete.%s" % index]:
                if len(data["risks.%s" % index]) == 0:
                    risk = None
                else:
                    risk = data["risks.%s" % index][0]
                edited_store_channels.append(channel_list_to_string(
                    data["track.%s" % index], risk,
                    data["branch.%s" % index]))
                parsed_data.setdefault('change', {
                    "edited_store_channels": edited_store_channels,
                })
                del (data["track.%s" % index],
                     data["risks.%s" % index],
                     data["branch.%s" % index],
                     data["delete.%s" % index])
            else:
                del (data["track.%s" % index],
                     data["risks.%s" % index],
                     data["branch.%s" % index],
                     data["delete.%s" % index])

        parsed_data.setdefault("recipe_fields", data)
        return parsed_data

    def updateRecipeFromData(self, parsed_data):
        fields = parsed_data.keys()
        self.updateContextFromData(parsed_data["recipe_fields"])
        if "change" in fields:
            self.context.store_channels = \
                parsed_data["change"]["edited_store_channels"]
        elif action == "add":
            self.context.store_channels.append(
                parsed_data["add_store_channels"])
        else:
            raise AssertionError("unknown action: %s" % action)

    @action("Update charm recipe", name="update")
    def request_action(self, action, data):
        if not data.get("auto_build", False):
            if "auto_build_channels" in data:
                del data["auto_build_channels"]
        store_upload = data.get("store_upload", False)
        if not store_upload:
            if "store_name" in data:
                del data["store_name"]
            if "store_channels" in data:
                del data["store_channels"]
        parsed_data = self.parseData(data)
        #need_charmhub_reauth = self._needCharmhubReauth(data)
        self.updateRecipeFromData(parsed_data)

        # if need_charmhub_reauth:
        #     self.requestAuthorization(self.context)
        # else:
        #     self.next_url = canonical_url(self.context)
        self.next_url = canonical_url(self.context)

    @property
    def adapters(self):
        """See `LaunchpadFormView`."""
        return {ICharmRecipeEditSchema: self.context}


class CharmRecipeAdminView(BaseCharmRecipeEditView):
    """View for administering charm recipes."""

    @property
    def label(self):
        return "Administer %s charm recipe" % self.context.name

    page_title = "Administer"

    field_names = ["require_virtualized"]


class CharmRecipeEditView(BaseCharmRecipeEditView):
    """View for editing charm recipes."""

    @property
    def label(self):
        return "Edit %s charm recipe" % self.context.name

    page_title = "Edit"

    field_names = [
        "owner",
        "name",
        "project",
        "git_ref",
        "auto_build",
        "auto_build_channels",
        "store_upload",
        "store_name",
        "store_channels",
        ]
    custom_widget_git_ref = GitRefWidget
    custom_widget_auto_build_channels = CharmRecipeBuildChannelsWidget
    custom_widget_store_channels = StoreChannelsWidget

    def validate(self, data):
        super().validate(data)
        owner = data.get("owner", None)
        project = data.get("project", None)
        name = data.get("name", None)
        if owner and project and name:
            try:
                recipe = getUtility(ICharmRecipeSet).getByName(
                    owner, project, name)
                if recipe != self.context:
                    self.setFieldError(
                        "name",
                        "There is already a charm recipe owned by %s in %s "
                        "with this name." %
                        (owner.display_name, project.display_name))
            except NoSuchCharmRecipe:
                pass


class CharmRecipeAuthorizeView(LaunchpadEditFormView):
    """View for authorizing charm recipe uploads to Charmhub."""

    @property
    def label(self):
        return "Authorize Charmhub uploads of %s" % self.context.name

    page_title = "Authorize Charmhub uploads"

    class schema(Interface):
        """Schema for authorizing charm recipe uploads to Charmhub."""

        discharge_macaroon = TextLine(
            title="Serialized discharge macaroon", required=True)

    render_context = False

    focusedElementScript = None

    @property
    def cancel_url(self):
        return canonical_url(self.context)

    @classmethod
    def requestAuthorization(cls, recipe, request):
        """Begin the process of authorizing uploads of a charm recipe."""
        try:
            root_macaroon_raw = recipe.beginAuthorization()
        except CannotAuthorizeCharmhubUploads as e:
            request.response.addInfoNotification(str(e))
            request.response.redirect(canonical_url(recipe))
        else:
            base_url = canonical_url(recipe, view_name="+authorize")
            return request_candid_discharge(
                request, root_macaroon_raw, base_url,
                "field.discharge_macaroon",
                discharge_macaroon_action="field.actions.complete")

    @action("Begin authorization", name="begin")
    def begin_action(self, action, data):
        login_url = self.requestAuthorization(self.context, self.request)
        if login_url is not None:
            self.request.response.redirect(login_url)

    @action("Complete authorization", name="complete")
    def complete_action(self, action, data):
        if not data.get("discharge_macaroon"):
            self.addError(structured(
                _("Uploads of %(recipe)s to Charmhub were not authorized."),
                recipe=self.context.name))
            return
        self.context.completeAuthorization(data["discharge_macaroon"])
        self.request.response.addInfoNotification(structured(
            _("Uploads of %(recipe)s to Charmhub are now authorized."),
            recipe=self.context.name))
        self.request.response.redirect(canonical_url(self.context))

    @property
    def adapters(self):
        """See `LaunchpadFormView`."""
        return {self.schema: self.context}


class CharmRecipeDeleteView(BaseCharmRecipeEditView):
    """View for deleting charm recipes."""

    @property
    def label(self):
        return "Delete %s charm recipe" % self.context.name

    page_title = "Delete"

    field_names = []

    @action("Delete charm recipe", name="delete")
    def delete_action(self, action, data):
        owner = self.context.owner
        self.context.destroySelf()
        self.next_url = canonical_url(owner, view_name="+charm-recipes")


class CharmRecipeRequestBuildsView(LaunchpadFormView):
    """A view for requesting builds of a charm recipe."""

    @property
    def label(self):
        return "Request builds for %s" % self.context.name

    page_title = "Request builds"

    class schema(Interface):
        """Schema for requesting a build."""

        channels = Dict(
            title="Source snap channels", key_type=TextLine(), required=True,
            description=ICharmRecipe["auto_build_channels"].description)

    custom_widget_channels = CharmRecipeBuildChannelsWidget

    @property
    def cancel_url(self):
        return canonical_url(self.context)

    @property
    def initial_values(self):
        """See `LaunchpadFormView`."""
        return {
            "channels": self.context.auto_build_channels,
            }

    @action("Request builds", name="request")
    def request_action(self, action, data):
        self.context.requestBuilds(self.user, channels=data["channels"])
        self.request.response.addNotification(
            _("Builds will be dispatched soon."))
        self.next_url = self.cancel_url
