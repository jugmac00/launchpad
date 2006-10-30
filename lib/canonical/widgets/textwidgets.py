# Copyright 2004-2006 Canonical Ltd.  All rights reserved.

from zope.app.form.interfaces import ConversionError
from zope.app.form.browser.textwidgets import TextWidget
from canonical.launchpad.webapp.uri import URI, InvalidURIError

#XXX matsubara 2006-05-10: Should I move our NewLineToSpacesWidget to 
# this module?


class StrippedTextWidget(TextWidget):
    """A widget that strips leading and trailing whitespaces."""

    def _toFieldValue(self, input):
        return TextWidget._toFieldValue(self, input.strip())


class URIWidget(TextWidget):
    """A widget that represents a URI."""

    displayWidth = 44
    cssClass = 'urlTextType'

    def _toFieldValue(self, input):
        if isinstance(input, list):
            raise ConversionError('Only a single value is expected')
        input = input.strip()
        if input:
            try:
                uri = URI(input.strip())
            except InvalidURIError, e:
                raise ConversionError(str(e))
            # If there is a policy 
            if self.context.trailing_slash is not None:
                if self.context.trailing_slash:
                    if not uri.path.endswith('/'):
                        uri = uri.replace(path=uri.path + '/')
                else:
                    uri = uri.replace(path=uri.path.rstrip('/'))
                    
            input = str(uri)
        return TextWidget._toFieldValue(self, input)
