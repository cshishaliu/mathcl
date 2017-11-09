#!/usr/bin/env python3

import argparse
import re
import os
import os.path
import sys

from baseutil import read_txt_file
import fmtparser as fp

"""
"""

regex_mdfile_parser = re.compile(fp.mdfile_parser, re.MULTILINE | re.DOTALL)


def make_converter(parser, formatter):
    names_in_parser = fp.regex_find_names_in_parser.findall(parser)
    names_in_formatter = fp.regex_find_names_in_formatter.findall(formatter)

    for name in names_in_formatter:
        if name not in names_in_parser:
            raise RuntimeWarning('Field %s not in parser' % name)

    return {'parser': re.compile(parser, re.MULTILINE | re.DOTALL),
            'formatter': formatter}


md_paragraph_parser = '''\
.*?
```latex
(?P<latexsrc>.*)
```.*'''

tex_paragraph_formatter = '%(latexsrc)s'

md2tex_paragraph_converter = make_converter(md_paragraph_parser, tex_paragraph_formatter)


choice_candidates_parser = '''\
(?P<pre>.*)
A. (?P<cha>.*)
B. (?P<chb>.*)
C. (?P<chc>.*)
D. (?P<chd>.*)(?P<post>.*)\
'''

choice_candidates_formatter = '''\
%(pre)s
\candidates{%(cha)s}{%(chb)s}{%(chc)s}{%(chd)s}%(post)s\
'''

choice_candidates_converter = make_converter(choice_candidates_parser, choice_candidates_formatter)

regex_fig_parser = re.compile('!\[(?P<label>.*?)\]\((?P<figname>.*?)\)', re.MULTILINE)


def convert_fig(text):

    tex_fig_list = []

    for mt in regex_fig_parser.findall(text):
        if mt[1][-5:] == '.tikz':
            tex_fig_list.append('\\MathclFigTikz[%s]{%s}' % mt)
        else:
            tex_fig_list.append('\\MathclFigFile[%s]{%s}' % mt)

    if tex_fig_list:
        text_post = '\\MathclFigPlace{%s}\n%s' % (''.join(tex_fig_list), regex_fig_parser.sub('', text))
        text_list = [line for line in text_post.split('\n') if line.strip()]
        text = '\n'.join(text_list)

    return text


enum_tex_template = r'''\begin{enumerate}
\renewcommand{\labelenumi}{(\theenumi)}
%s\end{enumerate}'''


def convert_enum(text):

    line_list = text.split('\n')

    first_letters = ''.join([line[0] for line in line_list])
    spans = [m.span() for m in re.finditer('\({2,}', first_letters)]
    spans.reverse()
    for span in spans:
        s, e = span
        cur_text = '\n'.join(line_list[s:e])
        cur_regex = '\n'.join([r'\(%s\)\s*(.*)\s*' % (no + 1) for no in range(e - s)])
        m = re.match(cur_regex, cur_text)
        if m is not None:
            items_text = '\\item %s\n' * (e - s) % m.groups()
            cur_text_alt = enum_tex_template % items_text
            line_list[s:e] = [cur_text_alt]

    if spans:
        text = '\n'.join(line_list)

    return text


def convert(text, converter):

    m = converter['parser'].match(text)
    if m is not None:
        text = converter['formatter'] % m.groupdict()

    return text


def make_problem_entry(content):
    """
    """

    m = regex_mdfile_parser.match(content)
    if m is None:
        # TODO: raise an exception
        return None
    problem_entry = m.groupdict()

    for title in problem_entry:

        if problem_entry[title].strip() == '':
            continue

        text = convert(problem_entry[title], md2tex_paragraph_converter)

        if problem_entry[title] != text:
            problem_entry[title] = text
            continue

        problem_entry[title] = convert_fig(problem_entry[title])
        problem_entry[title] = convert_enum(problem_entry[title])

    if r'\choice' in problem_entry['problem']:
        problem_entry['problem'] = convert(problem_entry['problem'],
                                           choice_candidates_converter)

    return problem_entry


if __name__ == '__main__':
    """
    """
    ap = argparse.ArgumentParser()
    ap.add_argument('files', nargs='*')
    ap.add_argument('-f', '--force', action='store_true')
    args = ap.parse_args()

    file_names = args.files
    if not file_names:
        file_names = os.listdir()

    mdfiles = [name for name in file_names if name[-3:] == '.md']

    for mdfile in mdfiles:

        texfile = mdfile[:-3] + '.tex'

        if not os.path.exists(texfile) or os.path.getmtime(texfile) < os.path.getmtime(mdfile) or args.force:

            print('Processing file [%s]...' % mdfile)

            p_entry = make_problem_entry(read_txt_file(mdfile))

            if p_entry is not None:
                fp.write_file(texfile, p_entry, fp.texfile_formatter)
