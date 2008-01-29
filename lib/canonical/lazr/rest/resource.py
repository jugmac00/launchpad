# Copyright 2008 Canonical Ltd.  All rights reserved.

"""Base classes for HTTP resources."""

__metaclass__ = type
__all__ = [
    'Collection',
    'CollectionResource',
    'Entry',
    'EntryResource',
    'HTTPResource',
    'ReadOnlyResource',
    'ScopedCollection',
    'ScopedCollectionResource',
    'ServiceRootResource'
    ]


import simplejson
import urllib

from zope.component import getMultiAdapter
from zope.interface import implements, directlyProvides
from zope.publisher.interfaces import NotFound
from zope.schema.interfaces import IField, IObject

# XXX leonardr 2008-01-25 bug=185958:
# canonical_url code should be moved into lazr.
from canonical.launchpad.webapp import canonical_url
from canonical.lazr.interfaces import (
    ICollection, ICollectionField, ICollectionResource, IEntry,
    IEntryResource, IHTTPResource, IJSONPublishable, IScopedCollection,
    IServiceRootResource)


class ResourceJSONEncoder(simplejson.JSONEncoder):
    """A JSON encoder for JSON-exposable resources like entry resources.

    This class works with simplejson to encode objects as JSON if they
    implement IJSONPublishable. All EntryResource subclasses, for
    instance, should implement IJSONPublishable.
    """

    def default(self, obj):
        """Convert the given object to a simple data structure."""
        if IJSONPublishable.providedBy(obj):
            return obj.toDataForJSON()
        return simplejson.JSONEncoder.default(self, obj)


class HTTPResource:
    """See `IHTTPResource`."""
    implements(IHTTPResource)

    def __init__(self, context, request):
        self.context = context
        self.request = request

    def __call__(self):
        """See `IHTTPResource`."""
        pass

    @property
    def root_resource(self):
        try:
            return self.request.publication.getApplication(self.request)
        except NotFound:
            return None


class ReadOnlyResource(HTTPResource):
    """A resource that serves a string in response to GET."""

    def __call__(self):
        """Handle a GET request."""
        if self.request.method == "GET":
            return self.do_GET()
        else:
            self.request.response.setStatus(405)
            self.request.response.setHeader("Allow", "GET")


class CollectionEntryDummy:
    """An empty object providing the interface of the items in the collection.

    This is to work around the fact that getMultiAdapter() and other
    zope.component lookup methods don't accept a bare interface and only
    works with objects.
    """
    def __init__(self, collection_field):
        directlyProvides(self, collection_field.value_type.schema)


class EntryResource(ReadOnlyResource):
    """An individual object, published to the web."""
    implements(IEntryResource, IJSONPublishable)

    rootsite = None
    @property
    def inside(self):
        """Find the top-level collection resource associated with this entry.
        """
        return self.root_resource.publishTraverse(
            self.request, self.context.parent_collection_name)

    def __init__(self, context, request):
        """Associate this resource with a specific object and request."""
        super(EntryResource, self).__init__(IEntry(context), request)

    @property
    def path(self):
        """See `IEntryResource`."""
        return urllib.quote(self.context.fragment())

    def publishTraverse(self, request, name):
        """Fetch a scoped collection resource by name."""
        field = self.context.schema.get(name)
        if not ICollectionField.providedBy(field):
            raise NotFound(self, name)
        collection = getattr(self.context, name, None)
        if collection is None:
            raise NotFound(self, name)
        # Create a dummy object that implements the field's interface.
        # This is neccessary because we can't pass the interface itself
        # into getMultiAdapter.
        example_entry = CollectionEntryDummy(field)
        from zope.component.interfaces import ComponentLookupError
        scoped_collection = getMultiAdapter((self.context, example_entry),
                                             IScopedCollection)

        # Tell the IScopedCollection object what collection it's managing,
        # and what the collection's relationship is to the entry it's
        # scoped to.
        scoped_collection.collection = collection
        scoped_collection.relationship = name

        return ScopedCollectionResource(scoped_collection, self.request, name)


    def toDataForJSON(self):
        """Turn the object into a simple data structure.

        In this case, a dictionary containing all fields defined by
        the resource interface.
        """
        dict = {}
        dict['self_link'] = canonical_url(self, request=self.request)
        schema = self.context.schema
        for name in schema.names():
            element = schema.get(name)
            if ICollectionField.providedBy(element):
                try:
                    related_resource = self.publishTraverse(self.request, name)
                    key = name + '_collection_link'
                    dict[key] = canonical_url(related_resource,
                                              request=self.request)
                except NotFound:
                    pass
            elif IObject.providedBy(element):
                related_entry = getattr(self.context, name)
                if related_entry is not None:
                    related_resource = EntryResource(related_entry,
                                                     self.request)
                    key = name + '_link'
                    dict[key] = canonical_url(related_resource,
                                              request=self.request)
            elif IField.providedBy(element):
                dict[name] = getattr(self.context, name)

        return dict

    def do_GET(self):
        """Render the entry as JSON."""
        self.request.response.setHeader('Content-type', 'application/json')
        return ResourceJSONEncoder().encode(self)


class CollectionResource(ReadOnlyResource):
    """A resource that serves a list of entry resources."""
    implements(ICollectionResource)

    def __init__(self, context, request, collection_name):
        super(CollectionResource, self).__init__(
            ICollection(context), request)
        self.collection_name = collection_name

    # A top-level collection resource is inside the root resource.
    inside = None
    rootsite = None

    @property
    def path(self):
        """See `ICollectionResource`."""
        return self.collection_name

    def publishTraverse(self, request, name):
        """Fetch an entry resource by name."""
        entry = self.context.lookupEntry(name)
        if entry is None:
            raise NotFound(self, name)
        else:
            return EntryResource(entry, self.request)

    def do_GET(self):
        """Fetch a collection and render it as JSON."""
        entries = self.context.find() or []
        entry_resources = [EntryResource(entry, self.request)
                           for entry in entries]
        self.request.response.setHeader('Content-type', 'application/json')
        return ResourceJSONEncoder().encode(entry_resources)


class ScopedCollectionResource(CollectionResource):

    @property
    def inside(self):
        """The collection is inside its scope."""
        return EntryResource(self.context.context, self.request)


class ServiceRootResource:
    """A resource that responds to GET by describing the service."""
    implements(IServiceRootResource)

    inside = None
    path = ''
    rootsite = None

    @property
    def top_level_collections(self):
        return {}

    def __call__(self, REQUEST=None):
        """Handle a GET request."""
        if REQUEST.method == "GET":
            return "This is a web service."
        else:
            REQUEST.response.setStatus(405)
            REQUEST.response.setHeader("Allow", "GET")

    def publishTraverse(self, request, name):
        if name in self.top_level_collections:
            return CollectionResource(
                self.top_level_collections[name], request, name)
        else:
            raise NotFound(self, name)


class Entry:
    """An individual entry."""
    implements(IEntry)

    def __init__(self, context):
        """Associate the entry with some database model object."""
        self.context = context


class Collection:
    """A collection of entries."""
    implements(ICollection)

    def __init__(self, context):
        """Associate the entry with some database model object."""
        self.context = context


class ScopedCollection:
    implements(ICollection)

    def __init__(self, context, collection):
        self.context = context
        self.collection = collection

    def lookupEntry(self, name):
        pass

    def find(self):
        return self.collection