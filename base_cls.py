
import os
import re
import shutil

import base_fp as fp

################################################################################
# class: ProblemList
################################################################################


class ProblemEntry:

    def __init__(self, text='', src='', dest='', shortanswer=False, **kw):

        if not text:
            with open(src, 'r') as f:
                text = f.read()

        self.src = src
        self.dest = dest if dest else os.getcwd()
        self.shortanswer = shortanswer

        self.problem = ''
        self.topics = ''
        self.hint = ''
        self.answer = ''
        self.solution = ''
        self.note = ''
        self.comment = ''
        self.info = ''

        self.figures = {}

        self.label = ''
        self.tag = ''

        self.import_text(text)
        self.set(**kw)

        return

    def __bool__(self):
        if self.problem and self.label:
            return True
        else:
            return False

    def process(self):
        return

    def import_text(self, text):
        """Get label (if exists), problem, topics, hint, answer, solution, note, comment, and info from text.

        :param text:
        :return:
        """

        _pre = _ans = _post = ''

        _slices = re.split('((?:^>.*?\n)+)', text+'\n', flags=re.MULTILINE)

        if len(_slices) == 1:
            _pre = _slices[0]
        elif len(_slices) == 3:
            _pre, _ans, _post = _slices
        else:
            # there is extra content
            # TODO: reimplement this using Warnings
            print('More contents found in file [%s]' % self.src)

        # process _pre, to get tag (if exists), problem and topics
        _slices = [s.strip() for s in re.split('^\s*`(.*)`\s*$', _pre, flags=re.MULTILINE)]

        if len(_slices) == 1:
            self.problem = _slices[0]
        elif len(_slices) == 3:
            if _slices[0]:
                self.problem, self.topics = _slices[:2]
            else:
                self.tag, self.problem = _slices[1:]
        elif len(_slices) == 5:
            self.tag, self.problem, self.topics = _slices[1:4]
        else:
            # TODO: reimplement this using Warnings
            print('More contents found in the *problem* section of file [%s]' % self.src)

        # process _ans, to get hint, short answer and full solution
        _ans = re.sub('^> *', '', _ans, flags=re.MULTILINE)
        _hint_regex = re.compile('^`hint`\s*?(?P<hint>.*?)\s*?$\n', re.MULTILINE)

        _m = _hint_regex.search(_ans)
        self.hint = _m.group('hint') if _m else ''

        _ans = _hint_regex.sub('\n', _ans).strip()

        if self.shortanswer:
            _slices = [line.strip() for line in _ans.split('\n', maxsplit=1)]
            if len(_slices) == 1:
                self.answer, self.solution = _slices[0], ''
            else:
                self.answer, self.solution = _slices
        else:
            self.solution = _ans

        # process _post, to get note, comment, and info
        _slices = re.split('^\s*`(.*)`\s*', _post)

        self.note = _slices[0].strip()
        for (h, s) in zip(_slices[1::2], _slices[2::2]):
            if h in ['note', 'comment', 'info']:
                self.__dict__[h] = self.__dict__[h] + '\n' + s
            else:
                # TODO: reimplement this using Warnings
                print('More contents (`%s`) found in the *note* section of file [%s]' % h, self.src)

        # process figures
        for _k in ['problem', 'solution']:
            self.add_figure(self.__dict__[_k])

        return

    def set(self, **kw):
        for k in kw:
            if k in 'src dest label tag'.split():
                self.__setattr__(k, kw[k])
            else:
                # TODO: reimplement this using Warnings
                print('Unknown property "%s"' % k)
        return

    def add_figure(self, text=''):
        for (label, path) in re.findall('!\[(.*?)\]\((.*?)\)', text):
            self.figures[label] = os.path.normcase(
                os.path.join(
                    os.path.dirname(self.src), path
                )
            )
        return

    def copy_figure_files(self, dest=''):
        dest = dest if dest else self.dest

        for (label, path) in self.figures.items():
            shutil.copyfile(
                path,
                os.path.join(dest, os.path.basename(path))
            )
        return

    def export(self, dest='', fmt='both'):
        dest = dest if dest else self.dest

        # fmt can be 'md' or 'tex' or 'both' or 'all'
        if fmt[0] in 'MmBbAa':
            self.export_markdownfile(dest=dest)
        elif fmt[0] == 'TtBbAa':
            self.export_texfile(dest=dest)

        self.copy_figure_files()

        return

    def export_markdownfile(self, dest=''):
        # CAUTION: THIS METHOD SHOULD NOT BE DIRECTLY CALLED BY USERS
        dest = dest if dest else self.dest
        if os.path.isdir(dest):
            dest = os.path.join(dest, self.label + '.md')

        with open(dest, 'w') as f:
            f.write(fp.mdfile_formatter % self.__dict__)
        return

    def export_texfile(self, dest=''):
        # CAUTION: THIS METHOD SHOULD NOT BE DIRECTLY CALLED BY USERS
        dest = dest if dest else self.dest
        if os.path.isdir(dest):
            dest = os.path.join(dest, self.label + '.tex')

        with open(dest, 'w') as f:
            f.write(self.export_texstr())
        return

    def export_texdict(self):
        texdict = {}
        for k in 'label tag problem topics hint answer solution note comment info'.split():
            texdict[k] = self.__dict__[k]

        for k in 'problem solution note comment info'.split():
            _text = texdict[k]

            #
            # search and process tex source
            #
            _m = re.search('^```latex\s*(?P<texsrc>.*?)^```', _text, re.MULTILINE | re.DOTALL)
            if _m:
                texdict[k] = _m.group('texsrc')
                continue

            if k == 'problem':
                #
                # search and process choice/blank place holder and candidates in *problem* text
                #
                _text = re.sub('`\(_{4,}\)`', r'{\choice}', _text)
                _text = re.sub('`_{4,}`', r'{\\blank}', _text)

                _text_list = re.split('\n?(^A\. .*?\nB\. .*?\nC\. .*?\nD\. .*?$)\n?', _text, flags=re.MULTILINE)
                if len(_text_list) > 2:
                    _candidates = re.sub('!\[(?P<figlabel>.*?)\]\((?P<figname>.*?)\)',
                                         '\MathclFigFile[\g<figlabel>]{\g<figname>}',
                                         _text_list[1])

                    _m = re.match('^A\. (.*?)\nB\. (.*?)\nC\. (.*?)\nD\. (.*?)$', _candidates)
                    _text_list[1] = '\candidates{%s}{%s}{%s}{%s}' % _m.groups()
                    _text = '\n'.join(_text_list)

                #
                # search and process enumerated itemize
                #
                _text_list = []
                _enum1 = _enum2 = False
                for line in (_text + '\n').split('\n'):
                    _m = re.match('\((?P<num>[0-9])+\)\s*(?P<itemtext>.*)', line.strip())
                    if _m:
                        if not _enum1:
                            _enum1 = True
                            _text_list.append(r'\begin{enumerate}')
                            _text_list.append(r'\setlength{\itemsep}{0pt}')
                            _text_list.append(r'\renewcommand{\labelenumi}{(\theenumi)}')

                        _text_list.append('\\item %s' % _m.group('itemtext'))
                        continue

                    _m = re.match('\((?P<num>[ivx])+\)\s*(?P<itemtext>.*)', line.strip())
                    if _m:
                        if not _enum2:
                            _enum2 = True
                            _text_list.append(r'\begin{enumerate}')
                            _text_list.append(r'\setlength{\itemsep}{0pt}')
                            _text_list.append(r'\renewcommand{\theenumii}{\roman{enumii}}')
                            _text_list.append(r'\renewcommand{\labelenumii}{(\theenumii)}')

                        _text_list.append('\\item %s' % _m.group('itemtext'))
                        continue

                    if _enum2:
                        _enum2 = 0
                        _text_list.append(r'\end{enumerate}')
                    if _enum1:
                        _enum1 = 0
                        _text_list.append(r'\end{enumerate}')

                    _text_list.append(line)

                _text = '\n'.join(_text_list)

            #
            # search and process figure inclusion
            #
            _fig_list = []
            _text_list = re.split('(!\[.*\]\(.*\))', _text)

            _text = '\n'.join([s.strip() for s in _text_list[::2]])

            for _t in _text_list[1::2]:
                _m = re.match('!\[(?P<figlabel>.*?)\]\((?P<figname>.*?)\)', _t)
                if _m.group('figname')[-5:] == '.tikz':
                    _fig_list.append('\\MathclFigTikz[%s]{%s}' % _m)
                else:
                    _fig_list.append('\\MathclFigFile[%s]{%s}' % _m)

            if _fig_list:
                _text = '\\MathclFigPlace{%s}\n' % ''.join(_fig_list) + _text

            texdict[k] = _text

        return texdict

    def export_texstr(self):
        return fp.texfile_formatter % self.export_texdict()

    def export_tuple(self):
        return (
            self.label,
            self.tag,
            self.problem,
            self.topics,
            self.hint,
            self.answer,
            self.solution,
            self.note,
            self.comment,
            self.info,
            self.figures
        )


################################################################################
# class: ProblemList
################################################################################
numbering_width = 2


def label_numberer_default(n):
    return ('%s' % n).rjust(numbering_width, '0')


def tag_numberer_default(n):
    return '第 %s 题' % n


class ProblemList:

    title_split_regex = re.compile('^#\s+(.*?)\s+$', re.MULTILINE)
    title_parse_regex = re.compile('(.*?)\s+`(.*?)`')
    numbering_regex = re.compile('^[0-9]+. ', re.MULTILINE)

    def __init__(self,
                 text='',
                 src='',
                 dest='',
                 shortanswer=True,
                 label='',
                 tag='',
                 label_numberer=None,
                 tag_numberer=None):

        if not text:
            if os.path.exists(src):
                with open(src, 'r') as f:
                    text = f.read()

        if not label:
            _slices = os.path.basename(src)[:-3]
            label = _slices[3:] if _slices[:3] == 'pl.' else _slices

        self.src = src
        self.dest = dest if dest else os.getcwd()
        self.shortanswer = shortanswer

        _slices = self.title_split_regex.split(text)
        if len(_slices) > 1:
            _title, text = _slices[1:3]

            _m = self.title_parse_regex.match(_title)
            if _m:
                tag, label = _m.groups()
            else:
                tag = _title

        self.label = label
        self.tag = tag

        self.label_numberer = label_numberer if label_numberer else label_numberer_default
        self.tag_numberer = tag_numberer if tag_numberer else tag_numberer_default

        self.plist = []

        self.process(text)

        return

    def __getitem__(self, item):
        return self.plist[item]

    def __len__(self):
        return len(self.plist)

    def process(self, text):
        _slices = self.numbering_regex.split(text)

        if len(_slices) > 1:
            _slices = _slices[1:]

        n = len(self.plist)
        for text in _slices:

            if not text.strip():
                continue

            text = re.sub('^[ \t]*', '', text, flags=re.MULTILINE)

            n += 1
            _label = self.label + self.label_numberer(n)
            _tag = self.tag + self.tag_numberer(n) if self.tag else ''

            _entry = ProblemEntry(
                text,
                src=self.src,
                dest=self.dest,
                shortanswer=self.shortanswer,
                label=_label,
                tag=_tag
            )
            if _entry:
                self.plist.append(_entry)

        return

    def set(self, **kw):
        for k in kw:
            if k in 'src dest label tag'.split():
                self.__setattr__(k, kw[k])

    def export(self, dest='', fmt='both'):
        dest = dest if dest else self.dest
        for e in self.plist:
            e.export(dest=dest, fmt=fmt)
        return


################################################################################
# class: LectureNote
################################################################################
class LectureNote:
    """
    class: LectureNote
    """

    h1regex = re.compile('^#\s+(?P<header>.*?)$', re.MULTILINE)
    h2regex = re.compile('^##\s+(?P<header>.*?)$', re.MULTILINE)
    h3regex = re.compile('^###\s+(?P<header>.*?)$', re.MULTILINE)

    lecnote_split_regex = re.compile('^(#{3,4}\s+.*?)$', re.MULTILINE)

    lecnote_header_regex = re.compile(
        '^#{3}\s+`课后阅读`\s*(?P<readingmaterial>[^`]*?)$'
        '|^#{3}\s+`(?P<hardexample>十面埋伏)`\s*$'
        '|^#{3}\s+`(?P<harderexample>剑指八方)`\s*$'
        '|^#{3}\s+(?P<slicetitle>.*?)$'
        '|^#{4}\s+`?例\s*[0-9]*`?(?P<exampletitle>.*?)$'
        '|^#{4}\s+(?P<unrecognized>.*?)$'
    )

    def __init__(self, src='', text='', dest='', shortanswer=True, label='', tag=''):

        if not text:
            if os.path.exists(src):
                with open(src, 'r') as f:
                    text = f.read()

        if not label:
            _slices = os.path.basename(src)[:-3]
            label = _slices[3:] if _slices[:3] == 'ln.' else _slices

        self.src = src
        self.dest = dest if dest else os.getcwd()

        self.shortanswer = shortanswer

        self.label = label
        self.tag = tag

        self.title = ''
        self.preamble = ''
        self.lecnotes = []
        self.homeworks = []
        self.classtest = []
        self.problemlist = ProblemList(shortanswer=self.shortanswer, label=self.label, tag=self.tag)

        self.process(text)

        self.problemlist.set(src=src, dest=dest)

        return

    def process(self, text=''):
        """"""
        # process the H1 title, i.e., the title of this lecture note
        _slices = [s.strip() for s in self.h1regex.split(text)]

        if len(_slices) < 3:
            # TODO: reimplement this using Warnings
            print('No title found')
            return

        self.title, text = _slices[1:3]

        if _slices[0]:
            # TODO: reimplement this using Warnings
            print('Contents detected before the title')

        if len(_slices) > 3:
            # TODO: reimplement this using Warnings
            print('More than 1 titles found')

        # process H2 titles
        _slices = [s.strip() for s in self.h2regex.split(text)]
        self.preamble = _slices[0]
        _lecnote = _homeworks = _classtest = ''

        for h, s in zip(_slices[1::2], _slices[2::2]):
            if h.strip('`') in ['讲义', '例题', 'lecturenote', 'examples']:
                _lecnote = _lecnote + '\n\n' + s
            elif h.strip('`') in ['练习', '作业', 'homework']:
                _homeworks = _homeworks + '\n\n' + s
            elif h.strip('`') in ['测试', '进门考', 'classtest']:
                _classtest = _classtest + '\n\n' + s
            else:
                # TODO: reimplement this using Warnings
                print('Unexpected content titled *%s* in lecture note' % h)

        # process section **lecnote**
        _slices = [s.strip() for s in self.lecnote_split_regex.split(_lecnote)]

        if _slices[0]:
            self.lecnotes.append(('paragraph', '', _slices[0]))

        for h, s in zip(_slices[1::2], _slices[2::2]):
            m = self.lecnote_header_regex.match(h)
            t = m.lastgroup
            v = m.group(t).strip()

            if t == 'readingmaterial':
                self.lecnotes.append(('readingmaterial', v, s))

            elif t == 'hardexample':
                if s:
                    pass
                self.lecnotes.append(('hardexampletitle', '十面埋伏'))

            elif t == 'harderexample':
                if s:
                    pass
                self.lecnotes.append(('harderexampletitle', '剑指八方'))

            elif t == 'slicetitle':
                self.lecnotes.append(('paragraph', v, s))

            elif t == 'exampletitle':
                if s:
                    self.problemlist.process(s)
                    if v:
                        self.problemlist[-1].set(tag=v.strip('`'))

                    self.lecnotes.append(('example', len(self.problemlist)-1))

            elif t == 'unrecognized':
                # TODO: reimplement this using Warnings
                print('Unexpected H4 title found: %s' % v)

        # process section **homeworks**
        _b = len(self.problemlist)
        self.problemlist.process(_homeworks)
        _e = len(self.problemlist)
        if _e > _b:
            self.homeworks.extend([n for n in range(_b, _e)])

        # process section **classtest**
        _b = _e
        self.problemlist.process(_classtest)
        _e = len(self.problemlist)
        if _e > _b:
            self.classtest.extend([n for n in range(_b, _e)])

        return

    def export_texfile(self, dest=''):
        dest = dest if dest else self.dest
        if os.path.isdir(dest):
            dest = os.path.join(dest, self.label + '.tex')

        with open(dest, 'w') as f:
            f.write('\\chapter{%s}\n\n' % self.title)

            f.write(self.preamble)

            f.write('\\begin{lecturenote}\n\n')
            for t, *v in self.lecnotes:
                if t == 'paragraph':
                    f.write('\\begin{knode}{%s}\n%s\n\\end{knode}\n\n' % tuple(v))
                elif t == 'example':
                    n = v[0]
                    f.write(self.problemlist[n].export_texstr())
                    f.write('\n\\MathclExample\n\n\n')
                elif t == 'hardexampletitle':
                    f.write('\\knodetitle{%s}\n\n' % v[0])
                elif t == 'harderexampletitle':
                    f.write('\\knodetitle{%s}\n\n' % v[0])
                elif t == 'readingmaterial':
                    f.write('\\begin{knode}{%s}\n%s\n\\end{knode}\n\n' % tuple(v))
                else:
                    pass
            f.write('\\end{lecturenote}\n\n')

            f.write('\\begin{homework}\n\n')
            for n in self.homeworks:
                f.write(self.problemlist[n].export_texstr())
                f.write('\n\\MathclExercise\n\n\n')
            f.write('\\end{homework}\n\n')

            f.write('\\begin{classtest}\n\n')
            for n in self.classtest:
                f.write(self.problemlist[n].export_texstr())
                f.write('\\MathclQuestion{??}\n\n\n')
            f.write('\\end{classtest}\n\n')
        return

    def export_problemlist(self, dest='', fmt='both'):
        dest = dest if dest else self.dest
        if not os.path.isdir(dest):
            dest = os.path.dirname(dest)

        self.problemlist.export(dest=dest, fmt=fmt)
        return
