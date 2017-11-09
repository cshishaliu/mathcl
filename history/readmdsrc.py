#!/opt/local/bin/python3

import argparse
import re
import os
import os.path
import shutil

"""
"""

output_dir = '.'
verbose = False

mdfig_regex = re.compile('!\[.*\]\((.*)\)')

label_prefix_default = 'gsmath'

label_numbering_length = 2

problem_entry_default = dict(label='',
                             tag='',
                             topics=[],
                             problem='',
                             answer='',
                             hint='',
                             solution='',
                             note='',
                             comment='',
                             info='')

markdown_template = """\
#### label: `%(label)s`

#### tag: `%(tag)s`

#### topics: `%(topics)s`

#### problem

%(problem)s

#### hint

%(hint)s

#### answer

%(answer)s

#### solution

%(solution)s

#### note

%(note)s

#### comment

%(comment)s

#### info

%(info)s

"""


def make_md_list(plist):

    return [make_md(p_entry) for p_entry in plist]


def make_md(p_entry):

    file_name = os.path.join(output_dir, p_entry['label'] + '.md')
    file_content = markdown_template % p_entry

    with open(file_name, 'w') as f:

        if verbose:
            print('writing file: %s...' % file_name)

        f.write(file_content)

    return True


def read_and_split_src(file_name):
    """Split the markdown source file into a list of strings.

    :param file_name:
    :return:
    """
    src_content = []
    with open(file_name, 'r') as f:
        f_str = f.read()
        n = 0
        n_pos = 0
        startings = [0]
        endings = []
        while n_pos >= 0:
            n += 1
            n_str = '\n\n%s. ' % n
            n_pos = f_str.find(n_str, startings[-1])
            endings.append(n_pos)
            startings.append(n_pos + len(n_str))

        endings[-1] = len(f_str)
        startings[-1:] = []

        for s, e in zip(startings, endings):
            src_content.append(f_str[s:e])

    return src_content


def process_preamble(pmb_str):
    """Process the preamble of the markdown source file.
    preamble may contains informations about the label_prefix, tag_prefix, ...

    :param pmb_str:
    :return:
    """

    preamble = dict(label_prefix=label_prefix_default)

    for line in pmb_str.split('\n'):

        # process the title line, get label and tag prefix, and continue the loop
        if line[:2] == '# ':
            line_contents = [token.strip() for token in line[2:].split('`')]
            preamble['tag_prefix'] = line_contents[0]
            if len(line_contents) > 2:
                preamble['label_prefix'] = line_contents[1]
            continue

        line = line.strip()

        # key-value line, gather keys and values
        if line[0] == '`' and line[-1] == '`' and ':' in line:
            line_contents = [token.strip() for token in line[1:-1].split(':')]
            if len(line_contents) == 2:
                preamble[line_contents[0]] = line_contents[1]
            else:
                # maybe an exception should be raised here
                pass

            continue

        # extra info line, gather extra info
        if 'info' not in preamble:
            preamble['info'] = [line]
        else:
            preamble['info'].append(line)

    return preamble


def process_problem(p_str):

    p_entry = dict(label='',
                   tag='',
                   topics=[],
                   problem=[],
                   answer='',
                   hint='',
                   solution=[],
                   note=[],
                   comment=[],
                   info=[])

    problem_finished = False
    extra_key = 'note'

    for line in p_str.split('\n'):

        line = line.strip()

        if line == '':
            # empty line, continue the loop
            continue

        if line[:1] == '>':
            # answer line found, problem line finished, process answer line
            problem_finished = True

            line = line[1:].strip()

            if line[:6] == '`hint`':
                # get hint
                p_entry['hint'] = line[6:].strip()
            elif not p_entry['answer']:
                # get short answer
                p_entry['answer'] = line
            else:
                # gather solution line
                p_entry['solution'].append(line)

        elif not problem_finished:
            # problem or topics line
            if line[0] == '`' and line[:3] != '```' and line[-1] == '`':
                # topics line found, gather topics
                topics = [topic.strip() for topic in line[1:-1].split(',')]
                p_entry['topics'].extend(topics)
            else:
                # gather problem line
                p_entry['problem'].append(line)

        else:
            # extra info line, gather
            if line[0] == '`':
                # check whether the header of current line tells a new key
                pos = line[1:].find('`')
                token = line[1:pos]
                if token in ['note', 'comment', 'info']:
                    extra_key = token
                    line = line[pos+1:].strip()

            if extra_key in p_entry:
                p_entry[extra_key].append(line)
            else:
                p_entry[extra_key] = [line]

    p_entry['topics'] = ', '.join(p_entry['topics'])

    for key in ['problem', 'solution', 'note', 'comment', 'info']:
        p_entry[key] = '\n'.join(p_entry[key])

    return p_entry


def make_problem_list(src_contents):

    p_list = []

    preamble = process_preamble(src_contents[0])

    for n in range(1, len(src_contents)):

        p_entry = process_problem(src_contents[n])

        p_entry['label'] = preamble['label_prefix'] + str(n).rjust(label_numbering_length, '0')

        if 'tag_prefix' in preamble:
            p_entry['tag'] = '%s第 %s 题' % (preamble['tag_prefix'], n)
        else:
            p_entry['tag'] = ''

        p_list.append(p_entry)

    return p_list


if __name__ == '__main__':
    """
    """
    parser = argparse.ArgumentParser()
    parser.add_argument('files', nargs='*')
    parser.add_argument('-t', '--outputfiletype', default='md', choices=['both', 'md', 'tex'])
    parser.add_argument('-d', '--outputdir', default='.')
    parser.add_argument('-v', '--verbose', action='store_true')
    clargs = parser.parse_args()

    output_filetype = [clargs.outputfiletype] if clargs.outputfiletype != 'both' else ['md', 'tex']

    output_dir = os.path.dirname(clargs.outputdir)
    verbose = clargs.verbose

    for filename in clargs.files:

        if verbose:
            print('Reading Markdown source file: [%s]...' % filename)

        src_contents = read_and_split_src(filename)

        problem_list = make_problem_list(src_contents)

        if verbose:
            n_all = len(problem_list)
            n_cho = len([entry for entry in problem_list if '\\choice' in entry['problem']])
            n_blk = len([entry for entry in problem_list if '\\blank' in entry['problem']])
            n_res = n_all - n_cho - n_blk
            print('Totally [%s] problems found, of which: [%s] are choices, [%s] are blanks.' % (n_all, n_cho, n_blk))

        make_md_list(problem_list)

        fig_list = mdfig_regex.findall('\n'.join(src_contents))
        input_dir = os.path.dirname(filename)
        for fig_name in fig_list:
            fig_src_name = os.path.join(input_dir, fig_name)
            fig_dst_name = os.path.join(output_dir, fig_name)
            shutil.copyfile(fig_src_name, fig_dst_name)

