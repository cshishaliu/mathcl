import re


regex_find_names_in_parser = re.compile('\(\?P<(?P<name>\w*)>[^)]*\)')

regex_find_names_in_formatter = re.compile('%\((?P<name>\w*)\)s')


def formatter2parser(formatter):

    pattern_dict = {}
    for m in regex_find_names_in_formatter.finditer(formatter):
        key_name = m.group('name')
        pattern_dict[key_name] = '(?P<%s>.*)' % key_name

    parser = formatter % pattern_dict

    return parser

mdfile_formatter = """\
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

mdfile_parser = formatter2parser(mdfile_formatter)

texfile_formatter = """\
\\MathclLabel{%(label)s}

\\MathclTag{%(tag)s}

\\MathclTopics{%(topics)s}

\\MathclProblem{%(problem)s}

\\MathclAnswer{%(answer)s}

\\MathclHint{%(hint)s}

\\MathclSolution{%(solution)s}

\\MathclNote{%(note)s}

\\MathclComment{%(comment)s}

\\MathclInfo{%(info)s}

"""

texfile_parser = formatter2parser(texfile_formatter)


def write_file(filename, content, formatter):

    content_to_write = formatter % content

    with open(filename, 'w') as f:
        f.write(content_to_write)

    return content_to_write


if __name__ == '__main__':

    pass
