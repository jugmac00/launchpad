# -*- coding: ascii -*-
# Contains code from msgfmt.py,
#     written by Martin v. Loewis <loewis@informatik.hu-berlin.de>
#     changed by Christian 'Tiran' Heimes <ch@comlounge.net>

import sys, sets, warnings, textwrap, codecs

from canonical.rosetta.ipofile import IPOMessage, IPOHeader, IPOParser
from zope.interface import implements

# Exceptions and warnings

class POSyntaxError(Exception):
    """ Syntax error in a po file """
    def __init__(self, lno=None):
        self.lno = lno
        
    def __str__(self):
        if self.lno:
            return 'Po file: syntax error on line %d' % self.lno
        else:
            return 'Po file: syntax error in the header entry'

class POInvalidInputError(Exception):
    """ Syntax error in a po file """
    def __init__(self, lno=None, msg=None):
        self.lno = lno
        self.msg = msg
        
    def __str__(self):
        if self.msg:
            return self.msg
        elif self.lno:
            return 'Po file: invalid input on line %d' % self.lno
        else:
            return 'Po file: invalid input in the header entry'

class POSyntaxWarning(Warning):
    """ Syntax warning in a po file """
    def __init__(self, lno=0, msg=None):
        self.lno = lno
        self.msg = msg
        
    def __str__(self):
        if self.msg:
            return self.msg
        elif self.lno:
            return 'Po file: syntax warning on line %d' % self.lno
        else:
            return 'Po file: syntax warning in the header entry'


# classes

class POMessage(object):
    implements(IPOMessage)

    def __init__(self, **kw):
        self.msgid = kw.get('msgid', '')
        self.msgidPlural = kw.get('msgidPlural', '')
        self.msgstr = kw.get('msgstr', '')
        self.commentText = kw.get('commentText', '')
        self.sourceComment = kw.get('sourceComment', '')
        self.fileReferences = kw.get('fileReferences', '').strip()
        self.flags = kw.get('flags', sets.Set())
        self.msgstrPlurals = kw.get('msgstrPlurals', [])
        self.obsolete = kw.get('obsolete', False)

    def is_obsolete(self):
        return self.obsolete

    def __nonzero__(self):
        return bool(self.msgid)

    def flagsText(self, flags=None, withHash=True):
        if flags is None:
            flags = self.flags
        if not flags:
            return ''
        flags = list(flags)
        flags.sort()
        if 'fuzzy' in flags:
            flags.remove('fuzzy')
            flags.insert(0, 'fuzzy')
        if withHash:
            prefix = u'#, '
        else:
            prefix = u''
        return prefix + u', '.join(flags)

    class _fake_wrapper(object):
        width = None
        initial_indent = subsequent_indent = u'"'
        def wrap(self, text):
            return [self.initial_indent + text]

    def __unicode__(self, wrap=80):
        r'''
        Text representation of the message.  Should wrap correctly.
        '

        >>> unicode(POMessage(msgid="foo", msgstr="bar"))
        u'msgid "foo"\nmsgstr "bar"'
        
        obsolete entries are prefixed with #~
        >>> unicode(POMessage(msgid="foo", msgstr="bar", flags=("fuzzy",), obsolete=True))
        u'#, fuzzy\n#~ msgid "foo"\n#~ msgstr "bar"'

        plural forms automatically trigger the correct syntax
        >>> unicode(POMessage(msgid="foo", msgidPlural="foos", msgstrPlurals=["bar", "bars"]))
        u'msgid "foo"\nmsgid_plural "foos"\nmsgstr[0] "bar"\nmsgstr[1] "bars"'

        backslashes are escaped (doubled) and quotes are backslashed
        >>> unicode(POMessage(msgid='foo"bar\\baz', msgstr='z'))
        u'msgid "foo\\"bar\\\\baz"\nmsgstr "z"'

        tabs are backslashed too, with standard C syntax
        >>> unicode(POMessage(msgid="\tServer name: %s", msgstr=""))
        u'msgid "\\tServer name: %s"\nmsgstr ""'

        '(this single-quote is here to appease emacs)
        '''
        if wrap:
            wrapper = textwrap.TextWrapper(wrap-1, subsequent_indent=u'"',
                                           break_long_words=False)
            wrapper.initial_indent = wrapper.subsequent_indent
        else:
            wrapper = self._fake_wrapper()

        return '\n'.join([
            self._comments_representation(),
            self._msgids_representation(wrapper),
            self._msgstrs_representation(wrapper),
            ]).strip()

    def _comments_representation(self):
        r'''
        Text representation of the comments.
        '

        >>> unicode(POMessage(msgid="foo", msgstr="bar",flags=("fuzzy",)))
        u'#, fuzzy\nmsgid "foo"\nmsgstr "bar"'
        >>> unicode(POMessage(msgid="a", msgstr="b", commentText=" blah\n"))
        u'# blah\nmsgid "a"\nmsgstr "b"'
        >>> unicode(POMessage(msgid="%d foo", msgstr="%d bar", flags=('fuzzy', 'c-format')))
        u'#, fuzzy, c-format\nmsgid "%d foo"\nmsgstr "%d bar"'

        '(this single-quote is here to appease emacs)
        '''
        text = []
        # commentText and sourceComment always end in a newline, so
        # splitting by \n always results in an empty last element
        if self.commentText:
            for line in self.commentText.split('\n')[:-1]:
                text.append(u'#' + line)
        if self.sourceComment:
            for line in self.sourceComment.split('\n')[:-1]:
                text.append(u'#. ' + line)
        # not so for references - we strip() it
        if self.fileReferences:
            for line in self.fileReferences.split('\n'):
                text.append(u'#: ' + line)
        if self.flags:
            text.append(self.flagsText())
        return u'\n'.join(text)

    def _msgids_representation(self, wrapper):
        text = self._wrap(self.msgid, u'msgid', wrapper)
        if self.msgidPlural:
            text.extend(self._wrap(self.msgidPlural, u'msgid_plural', wrapper))
        if self.obsolete:
            text = ['#~ ' + l for l in text]
        return u'\n'.join(text)

    def _msgstrs_representation(self, wrapper):
        text = []
        if self.msgstrPlurals:
            for i, s in enumerate(self.msgstrPlurals):
                text.extend(self._wrap(s, u'msgstr[%s]' % i, wrapper))
        else:
            text = self._wrap(self.msgstr, u'msgstr', wrapper)
        if self.obsolete:
            text = ['#~ ' + l for l in text]
        return u'\n'.join(text)

    def _wrap(self, text, prefix, wrapper):
        r'''
        This method does the actual wrapping.
        '

        >>> POMessage(msgid="abcdefghijkl", msgstr="z").__unicode__(20)
        u'msgid "abcdefghijkl"\nmsgstr "z"'
        >>> POMessage(msgid="abcdefghijklmnopqr", msgstr="z").__unicode__(20)
        u'msgid ""\n"abcdefghijklmnopqr"\nmsgstr "z"'
        >>> POMessage(msgid="abcdef hijklm", msgstr="z").__unicode__(20)
        u'msgid ""\n"abcdef hijklm"\nmsgstr "z"'
        >>> POMessage(msgid="abcdefghijklmnopq rs", msgstr="z").__unicode__(20)
        u'msgid ""\n"abcdefghijklmnopq "\n"rs"\nmsgstr "z"'
        >>> POMessage(msgid="abc\ndef", msgstr="z").__unicode__(20)
        u'msgid ""\n"abc\\n"\n"def"\nmsgstr "z"'

        newlines in the text interfere with wrapping
        >>> unicode(POMessage(msgid="abc\ndef", msgstr="z"))
        u'msgid ""\n"abc\\n"\n"def"\nmsgstr "z"'

        a single newline at the end of the message does not
        >>> unicode(POMessage(msgid= "foo\n", msgstr="bar"))
        u'msgid "foo\\n"\nmsgstr "bar"'

        '(this single-quote is here to appease emacs)
        '''
        r = [prefix + u' ""']
        if not text:
            return r
        text = text.replace(u'\\', u'\\\\')
        text = text.replace(u'\"', u'\\"')
        text = text.replace(u'\t', u'\\t')
        if text[-1] == '\n':
            unwrapped = u'%s "%s\\n"' % (prefix, text[:-1])
        else:
            unwrapped = u'%s "%s"' % (prefix, text)
        if ('\n' not in unwrapped) and ((not wrapper.width)
                   or (len(unwrapped) <= wrapper.width + 1)):
            return [unwrapped]
        del unwrapped
        paragraphs = text.split('\n')
        end = len(paragraphs) - 1
        for i, paragraph in enumerate(paragraphs):
            if i == end:
                if not paragraph:
                    break
            else:
                paragraph += u'\\n'
            wrapped = wrapper.wrap(paragraph)
            for line in wrapped[:-1]:
                r.append(line + u" " + wrapper.subsequent_indent)
            r.append(wrapped[-1] + wrapper.subsequent_indent)
        return r

_marker = []
class POHeader(dict, POMessage):
    implements(IPOHeader, IPOMessage)

    def __init__(self, **kw):
        dict.__init__(self)
        POMessage.__init__(self, **kw)
        self._casefold = {}
        self.header = self
        self.charset = kw.get('charset', 'utf8')
        self.messages = kw.get('messages', [])

    def finish(self):
        for l in self.msgstr.strip().split('\n'):
            l = l.strip()
            if not l:
                continue
            try:
                field, value = l.split(':', 1)
            except ValueError:
                raise POSyntaxError
            field, value = field.strip(), value.strip()
            self[field] = value
            self._casefold[field.lower()] = value
        if 'content-type' in self:
            for o in self['content-type'].split(';')[1:]:
                try:
                    name, value = o.split('=')
                except ValueError:
                    continue
                if name.strip().lower() == 'charset':
                    self.charset = value.strip()
                    if self.charset == 'CHARSET':
                        self.charset = 'us-ascii'
        else:
            warnings.warn(POSyntaxWarning(msg='PO file header entry has no content-type field'))
            self['Content-Type'] = 'text/plain; us-ascii'

        # Convert attributes to unicode
        for attr in ('msgidPlural', 'msgstrPlurals', 'fileReferences'):
            if getattr(self, attr):
                warnings.warn(POSyntaxWarning(msg='PO file header entry should have no %s' % attr))
                setattr(self, attr, u'')
        for attr in ('msgid', 'msgstr', 'commentText', 'sourceComment'):
            v = getattr(self, attr)
            if type(v) is str:
                v = self._decode(v)
            setattr(self, attr, v)

    def _decode(self, v):
        try:
            v = unicode(v, self.charset)
        except UnicodeError:
            warnings.warn(POSyntaxWarning(self._lineno,
                                          'string is not in declared charset %r'
                                          % self.charset))
            v = unicode(v, self.charset, 'replace')
        return v

    def get(self, item, default=_marker):
        v = None
        try:
            v = dict.__getitem__(self, item)
        except KeyError:
            try:
                v = self._casefold[item.lower()]
            except KeyError:
                if default is _marker:
                    raise KeyError, item
                else:
                    return default
        if type(v) is str:
            v = self._decode(v)
        return v

    __getitem__ = get

    def has_key(self, item):
        try:
            self[item]
        except KeyError:
            return False
        else:
            return True

    __contains__ = has_key

    def __setitem__(self, item, value):
        if not self.has_key(item) and self._casefold.has_key(item.lower()):
            for key in self.keys():
                if key.lower() == item.lower():
                    item = key
        dict.__setitem__(self, item, value)
        self._casefold[item.lower()] = value

    def update(self, other):
        # sigh... need to reimplement due to casefold
        for key in other:
            # not using items() because this way we get decoding
            self[key] = other[key]

    def copy(self):
        cp = POHeader(self)
        cp.finish()
        # copy any changes made by user-code
        cp.update(self)
        return cp

    def recode(self, charset):
        "A copy with a different charset"
        cp = self.copy()
        cp.charset = charset
        ct_flags = ['text/plain']
        for o in self['content-type'].split(';')[1:]:
            try:
                name, value = o.split('=')
            except ValueError:
                ct_flags.append(o.strip())
                continue
            name, value = name.strip(), value.strip()
            if name.lower() == 'charset':
                value = charset
            ct_flags.append('%s=%s' % (name, value))
        cp['Content-Type'] = '; '.join(ct_flags)
        return cp

    def __nonzero__(self):
        return bool(self.keys())

    def _msgstrs_representation(self, wrapper):
        text = ['msgstr ""']
        printed = sets.Set()
        for l in self.msgstr.strip().split('\n'):
            l = l.strip()
            if not l:
                continue
            try:
                field, value = l.split(':', 1)
            except ValueError:
                raise POSyntaxError
            field = field.strip()
            value = self[field]
            value = value.replace(u'\\', u'\\\\')
            value = value.replace(u'\"', u'\\"')
            text.append(u'"%s: %s\\n"' % (field, self[field]))
            printed.add(field)
        for field in self.keys():
            if field not in printed:
                value = self[field]
                value = value.replace(u'\\', u'\\\\')
                value = value.replace(u'\"', u'\\"')
                text.append(u'"%s: %s\\n"' % (field, self[field]))
        return u'\n'.join(text)

class POParser(object):
    implements(IPOParser)

    def __init__(self, translation_factory=POMessage, header_factory=POHeader):
        self.translation_factory = translation_factory
        self.header_factory = header_factory
        self.header = None
        self.messages = []
        self._pending_line = ''
        self._lineno = 1
        self._make_dataholder()
        self._section = None
        self._plural_case = None

    def write(self, string):
        """Parse string as a PO file fragment."""
        string = self._pending_line + string
        lines = string.split('\n')
        for l in lines[:-1]:
            self.parse_line(l)
        self._pending_line = lines[-1]

    def _make_dataholder(self):
        self._partial_transl = {}
        self._partial_transl['msgid'] = ''
        self._partial_transl['msgidPlural'] = ''
        self._partial_transl['msgstr'] = ''
        self._partial_transl['commentText'] = ''
        self._partial_transl['sourceComment'] = ''
        self._partial_transl['fileReferences'] = ''
        self._partial_transl['flags'] = sets.Set()
        self._partial_transl['msgstrPlurals'] = []
        self._partial_transl['obsolete'] = False

    def append(self):
        if self._partial_transl:
            for message in self.messages:
                if message.msgid == self._partial_transl['msgid']:
                    raise POInvalidInputError('Po file: duplicate msgid on line %d'
                                              % self._lineno)
            transl = self.translation_factory(**self._partial_transl)
            self.messages.append(transl)
        self._partial_transl = None

    def _make_header(self):
        try:
            self.header = self.header_factory(messages=self.messages, **self._partial_transl)
            self.header.finish()
        except POSyntaxError:
            raise POSyntaxError(self._lineno)
        if self.messages:
            warnings.warn(POSyntaxWarning(self._lineno,
                                          'Header entry is not first entry'))

    def parse_line(self, l):
        self._lineno += 1
        # Skip empty lines
        l = l.strip()
        if not l:
            return

        obsolete = False
        if l[:2] == '#~':
            obsolete = True
            l = l[2:].lstrip()
        # If we get a comment line after a msgstr or a line starting with 
        # msgid, this is a new entry
        # XXX: l.startswith('msgid') is needed because not all msgid/msgstr
        # pairs have a leading comment
        if (l[0] == '#' or l.startswith('msgid')) and self._section == 'msgstr':
            if self._partial_transl is None:
                # first entry - do nothing
                pass
            elif self._partial_transl['msgid']:
                self.append()
            elif not self.header:
                # this is the potfile header
                self._make_header()
            self._make_dataholder()
            self._section = None
        # Record that the message is known obsolete
        if obsolete:
            self._partial_transl['obsolete'] = True
        # Record flags
        if l[:2] == '#,':
            self._partial_transl['flags'].update([flag.strip() for flag in l[2:].split(',')])
            return
        # Record comments
        if l[:2] == '#:':
            self._partial_transl['fileReferences'] += l[2:].strip() + '\n'
            return
        if l[:2] == '#.':
            self._partial_transl['sourceComment'] += l[2:].strip() + '\n'
            return
        if l[0] == '#':
            self._partial_transl['commentText'] += l[1:] + '\n'
            return
        # Now we are in a msgid section, output previous section
        if l.startswith('msgid_plural'):
            if self._section != 'msgid':
                raise POSyntaxError(self._lineno)
            self._section = 'msgid_plural'
            l = l[12:]
        elif l.startswith('msgid'):
            if self._section and self._section.startswith('msgid'):
                raise POSyntaxError(self._lineno)
            self._section = 'msgid'
            l = l[5:]
            self._plural_case = None
        # Now we are in a msgstr section
        elif l.startswith('msgstr'):
            self._section = 'msgstr'
            l = l[6:]
            if l[0] == '[':
                # plural case
                new_plural_case, l = l[1:].split(']')
                new_plural_case = int(new_plural_case)
                if (self._plural_case is not None) and (new_plural_case != self._plural_case + 1):
                    warnings.warn(POSyntaxWarning(self._lineno,
                                                  'bad plural case number'))
                if new_plural_case != self._plural_case:
                    self._partial_transl['msgstrPlurals'].append('')
                    self._plural_case = new_plural_case
                else:
                    warnings.warn(POSyntaxWarning(self._lineno,
                                                  'msgstr[] but same plural case number'))
            else:
                self._plural_case = None

        l = l.strip()
        if not l:
            warnings.warn(POSyntaxWarning(self._lineno,
                                          'line has no content; this is not supported by '
                                          'some implementations of msgfmt'))
            return

        # Parse a str line
        if not (l[0] == l[-1] == '"'):
            raise POSyntaxError(self._lineno)
        # XXX: not sure if all Python escapes are OK in a PO file...
        # better be tolerant than strict when reading, since
        # we're already quite strict when writing
        try:
            l = l[1:-1].decode('string_escape')
        except ValueError:
            raise POSyntaxError(self._lineno)

        # Convert to unicode
        if self.header: # header is stored as str, not unicode!
            try:
                l = unicode(l, self.header.charset)
            except UnicodeError:
                warnings.warn(POSyntaxWarning(self._lineno,
                                              'string is not in declared charset %r'
                                              % self.header.charset))
                l = unicode(l, self.header.charset, 'replace')


        if self._section == 'msgid':
            self._partial_transl['msgid'] += l
        elif self._section == 'msgid_plural':
            self._partial_transl['msgidPlural'] += l
        elif self._section == 'msgstr':
            if self._plural_case is None:
                self._partial_transl['msgstr'] += l
            else:
                self._partial_transl['msgstrPlurals'][-1] += l
        else:
            raise POSyntaxError(self._lineno)

    def finish(self):
        """Indicate that the PO data has come to an end.
        Throws an exception if the parser was in the
        middle of a message."""
        if self._pending_line:
            warnings.warn(POSyntaxWarning(self._lineno,
                                          'No newline at end of file'))
            self.parse_line(self._pending_line)
        if self._section and self._section.startswith('msgid'):
            raise POSyntaxError(self._lineno)
        if self._partial_transl['msgid']:
            self.append()
        elif self._partial_transl is not None:
            if self._partial_transl and (self._section is None):
                # input ends in a comment -- should this always be an error?
                raise POSyntaxError(self._lineno)
            elif not self.header:
                # header is last entry... in practice this should
                # only happen when the file is empty
                self._make_header()


# convenience function to dump a catalog to a file-like object

def _write_inner(writer, header):
    "Try to write header and messages to writer; raise UnicodeError"
    # could just use '\n\n'.join() but that could potentially eat
    # up ugly ammounts of RAM
    writer.write(unicode(header))
    for message in header.messages:
        writer.write(u'\n\n')
        writer.write(unicode(message))
    writer.write(u'\n')

def write(f, header, recode=None, use_replace=False):
    """Write a message catalog to an encoded file.
    
    Second argument should be a IPOHeader object.  The messages to
    dump are acquired from its 'messages' attribute.

    Will try to dump using the charset in the header; if that fails,
    what happens depends on the 'recode' parameter.  If it is a false
    value (the default), we just raise UnicodeError.

    If, however, 'recode' is True, we will recode to UTF-8; it may
    also be a sequence of strings naming various charsets to attempt.
    If the keyword argument 'use_replace' is true and recoding also
    fails, encode with the last charset in 'recode', using the option
    (errors='replace').

    First argument may be any file-like object, opened for writing,
    *but* it needs to support seek(0), or recoding will not be
    attempted.

    If recoding is to be attempted, header.messages may *NOT* be an
    iterator or you will lose messages!
    """
    # first pass: try convert everything to the encoding
    # in the header
    writer = codecs.getwriter(header.charset)(f, 'strict')
    try:
        _write_inner(writer, header)
    except UnicodeError:
        if not recode:
            raise
        try:
            f.seek(0)
        except:
            # does not support seek(0)
            raise
    else:
        return

    if recode is True:
        recode = ('UTF-8',)
    for charset in recode:
        header_r = header.recode(charset)
        writer = codecs.getwriter(charset)(f, 'strict')
        try:
            _write_inner(writer, header_r)
        except UnicodeError:
            pass
        else:
            return
    if use_replace:
        # use last charset in 'recode' list
        writer = codecs.getwriter(f, charset)(f, 'replace')
        _write_inner(writer, header_r)

if __name__ == '__main__':
    do_diff = False
    if len(sys.argv) > 1:
        in_f = file(sys.argv[1], 'rU')
    else:
        in_f = sys.stdin
    if len(sys.argv) > 2:
        if sys.argv[2] == '--diff':
            from cStringIO import StringIO
            do_diff = True
            out_f = StringIO()
        else:
            out_f = file(sys.argv[2], 'w')
    else:
        out_f = sys.stdout

    parser = POParser()
    # let's both be nice to RAM and test how well POParser responds to batches
    while True:
        batch = in_f.read(1024)
        if not batch:
            break
        parser.write(batch)
    parser.finish()

    write(out_f, parser.header)
    if do_diff:
        import difflib
        in_f.seek(0)
        out_f.seek(0)
        sys.stdout.writelines(difflib.unified_diff(
            in_f.readlines(), out_f.readlines(), in_f.name, 'generated output'))
