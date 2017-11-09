#!/opt/local/bin/python3

import argparse
import re
import os
import os.path
import shutil


from baseutil import read_txt_file
from fmtparser import mdfile_formatter, write_file
from md2tex import regex_fig_parser


output_dir = '.'

verbose = False

label_prefix_default = 'gsmath'

label_numbering_length = 2

problem_entry_default = dict.fromkeys(
    [
        'label', 'tag', 'topics', 'problem',
        'answer', 'hint', 'solution',
        'note', 'comment', 'info'
    ], '')

##########################

numbering_RE = re.compile('^(\d*)\. ', re.M)


def make_problem_list(content):

    numbers = [int(n) for n in numbering_RE.findall(content)]

    if not all([numbers[i] == i+1 for i in range(len(numbers))]):
        # TODO: Raise an exception here?
        return None

    num_str_list = [''] + ['^%s\. ' % n for n in numbers] + ['']

    split_regex = re.compile('(.*)'.join(num_str_list), re.MULTILINE | re.DOTALL)

    m = split_regex.findall(content)

    if len(m) != 1:
        # TODO: Raise an exception here?
        return None

    content_list = [s.strip() for s in m[0]]

    problem_list = []
    preamble = parse_preamble(content_list[0])

    for (n, content) in enumerate(content_list[1:], start=1):
        problem_entry = parse_problem_text(content)

        problem_entry['label'] = preamble['label_prefix'] + str(n).rjust(label_numbering_length, '0')

        if 'tag_prefix' in preamble:
            problem_entry['tag'] = '%s第 %s 题' % (preamble['tag_prefix'], n)
        else:
            problem_entry['tag'] = ''

        problem_list.append(problem_entry)

    return problem_list


def parse_preamble(pmb_str):

    preamble = {}

    title_line_parsed = False
    title_line_regex = re.compile('^# (?P<title>.*)')
    title_splitter_regex = re.compile('(?P<tag>.*) `(?P<label>.*)`')
    keyvalue_line_regex = re.compile('`(?P<key>.*)` (?P<value>.*)')

    for line in pmb_str.split('\n'):

        if not title_line_parsed:
            m = title_line_regex.match(line)
            if m is None:
                continue

            title = m.group('title').strip()
            m = title_splitter_regex.match(title)
            if m is None:
                preamble['tag_prefix'] = title
                preamble['label_prefix'] = ''

            else:
                preamble['tag_prefix'] = m.group('tag').strip()
                preamble['label_prefix'] = m.group('label').strip()

            title_line_parsed = True

        else:  # title_line_parsed
            m = keyvalue_line_regex.match(line)
            if m is not None:
                preamble[m.group('key')] = m.group('value')

    if not preamble['label_prefix']:
        preamble['label_prefix'] = label_prefix_default

    return preamble


def parse_problem_text(pbm_str):
    pbm_text_list = [line.strip() for line in pbm_str.split('\n')]
    pbm_text_list = [line for line in pbm_text_list if line]

    first_letters = ''.join([line[0] for line in pbm_text_list])
    first_letters = re.sub('[^>]', ' ', first_letters)
    if len(first_letters.split()) > 1:
        # TODO: Raise an exception here?
        return None
    ans_bpos = first_letters.find('>')
    ans_epos = first_letters.rfind('>') + 1
    if '>' not in first_letters:
        ans_bpos = ans_epos = len(first_letters)

    problem_text = []
    topics_text = []
    topics_regex = re.compile('^`(?P<topics>[^`]*)`$')

    for line in pbm_text_list[:ans_bpos]:
        m = topics_regex.match(line)
        if m is not None:
            topics_text.append(m.group('topics'))
        else:
            problem_text.append(line)

    problem_text = '\n'.join(problem_text)
    topics_text = ', '.join(topics_text)

    answer_text = ''
    hint_text = ''
    hint_regex = re.compile('^`hint`(?P<hint>.*)')
    solution_text = []
    for line in pbm_text_list[ans_bpos:ans_epos]:
        line = line[1:].strip()
        m = hint_regex.match(line)
        if m is not None:
            hint_text = m.group('hint')
        elif not answer_text:
            answer_text = line
        elif line:
            solution_text.append(line)

    solution_text = '\n'.join(solution_text)

    extra_keys = ['note', 'comment', 'info']
    extra_regex = re.compile('`(?P<key>\S*)` (?P<text>.*)')
    extra_text_dict = {}.fromkeys(extra_keys, [])
    key = 'note'
    for line in pbm_text_list[ans_epos:]:
        m = extra_regex.match(line)
        if m is None or m.group('key') not in extra_keys:
            text = line
        else:
            key = m.group('key')
            text = m.group('text').strip()
        extra_text_dict[key].append(text)

    note_text = '\n'.join(extra_text_dict['note'])
    comment_text = '\n'.join(extra_text_dict['comment'])
    info_text = '\n'.join(extra_text_dict['info'])

    return dict(label='',
                tag='',
                topics=topics_text,
                problem=problem_text,
                answer=answer_text,
                hint=hint_text,
                solution=solution_text,
                note=note_text,
                comment=comment_text,
                info=info_text)


if __name__ == '__main__':
    """
    """
    parser = argparse.ArgumentParser()
    parser.add_argument('files', nargs='*')
    parser.add_argument('-d', '--outputdir', default='.')
    parser.add_argument('-v', '--verbose', action='store_true')
    args = parser.parse_args()

    output_dir = os.path.dirname(args.outputdir)
    verbose = args.verbose

    for filename in args.files:

        if verbose:
            print('Reading Markdown source file: [%s]...' % filename)

        src_file_content = read_txt_file(filename)

        for entry in make_problem_list(src_file_content):
            md_filename = os.path.join(output_dir, entry['label'] + '.md')

            write_file(md_filename, entry, mdfile_formatter)

        input_dir = os.path.dirname(filename)

        for m in regex_fig_parser.finditer(src_file_content):
            name = m.group('figname')
            shutil.copyfile(os.path.join(input_dir, name), os.path.join(output_dir, name))
