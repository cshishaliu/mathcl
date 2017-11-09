#!/opt/local/bin/python3

import os
import os.path
import sys

"""
"""

default_label_prefix = 'gsmath'
label_postfix_length = 2


def process_answer(anslines = []):
    """
    """

    shortans_obtained = False
    shortans = ''
    hint = []
    solution = []

    for line in anslines:

        line = line.strip('> \t\n')
        
        if not line:
            continue
        elif line[:6] == '`hint`' :
            hint.append(line[6:].strip())
        elif not shortans_obtained:
            shortans = line
            shortans_obtained = True
        else:
            solution.append(line)

    return shortans, '\n'.join(hint), '\n'.join(solution)


def read_src(fname):
    """
    """

    plist = []
    #cur_pentry = new_problem_entry(number=0)

    tag_prefix = ''
    label_prefix = default_label_prefix

    new_entry_no = 0
    cur_entry_no = 0
    cur_pbtext = []
    cur_choices = []
    cur_topics = []
    cur_answer = []

    with open(fname, 'r') as mdfile:
    
        for line in mdfile.readlines():

            # process the title line, get label and tag prefix, and continue the loop
            if line[:2] == '# ':
                tokens = [token.strip() for token in line.strip('#` \t\n').split('`')]
                tag_prefix = tokens[0]
                label_prefix = default_label_prefix if len(tokens) == 1 else tokens[1]
                continue

            # if not the title line, and the first char is non-empty,
            # then this line may be a beginning line of a problem entry.
            if line[0].strip():
                dpos = line.find('. ')
                if dpos > 0:
                    # try to find the *number* of this problem entry
                    try:
                        new_entry_no = int(line[:dpos])
                    except ValueError:
                        # if ValueError raised, cur_entry_no remains unchanged.
                        pass
                    else:
                        # if no exception raised, and the number at the beginning
                        # of this line is just the next integer of the number of 
                        # cur_pentry, then this line is indeed a beginning line of
                        # a problem entry.
                        if new_entry_no == cur_entry_no + 1:
                            # make up the old entry and attach it to the plist
                            if cur_entry_no > 0:

                                cur_label = label_prefix + str(cur_entry_no).rjust(label_postfix_length, '0')
                                cur_tag = '%s第 %s 题' % (tag_prefix, cur_entry_no) 

                                cur_shortans, cur_hint, cur_solution = process_answer(cur_answer)

                                cur_pentry =  dict(
                                    number = cur_entry_no,
                                    label = cur_label,
                                    tag = cur_tag,
                                    problem = '\n'.join(cur_pbtext),
                                    choices = cur_choices,
                                    topics = cur_topics,
                                    answer = cur_shortans,
                                    hint = cur_hint,
                                    solution = cur_solution,
                                    info = '',
                                )
                                plist.append(cur_pentry)

                            cur_entry_no = new_entry_no

                            # clear up temporary data
                            cur_label = ''
                            cur_tag = ''
                            cur_choices = []
                            cur_topics = []
                            cur_answer = []
                            #cur_shortans = ''
                            #cur_hint = ''
                            #cur_solution = ''
                            #cur_info = ''

                            # add this line to cur_pbtext if non-empty
                            line = line[dpos+2:].strip()
                            cur_pbtext = [line] if line else []

                            continue
                    finally:
                        pass

            line = line.strip()

            if line == '':
                # empty line, do nothing and continue the loop
                continue

            elif line[0] == '`' and line[-1] == '`':
                # topic line, gather topic strings
                cur_topics.extend([topic.strip() for topic in line.strip('` \t\n').split(',')])

            elif line[0] == '>':
                # answer line, gathering answer lines
                cur_answer.append(line)

            else:
                cur_pbtext.append(line)

    # process the last problem entry
    cur_label = label_prefix + str(cur_entry_no).rjust(label_postfix_length, '0')
    cur_tag = '%s第 %s 题' % (tag_prefix, cur_entry_no) 

    cur_shortans, cur_hint, cur_solution = process_answer(cur_answer)

    cur_pentry =  dict(
        number = cur_entry_no,
        label = cur_label,
        tag = cur_tag,
        problem = '\n'.join(cur_pbtext),
        choices = cur_choices,
        topics = cur_topics,
        answer = cur_shortans,
        hint = cur_hint,
        solution = cur_solution,
        info = '',
    )
    plist.append(cur_pentry)

    return plist


def makemdlist(plist):
    """
    """
    return [makemd(pentry) for pentry in plist]

def makemd(pentry):
    """
    """

    with open(pentry['label'] + '.md', 'w') as f:

        f.write('#### label: `%s`\n\n' % pentry['label'])
        f.write('#### tag: `%s`\n\n' % pentry['tag'])
        f.write('#### topics: `%s`\n\n' % ', '.join(pentry['topics']))
        f.write('#### problem\n\n%s\n\n' % pentry['problem'])

        if pentry['choices']:
            for ch_tuple in zip('ABCD', pentry['choice']):
                f.write('%s. %s\n\n' % ch_tuple)

        f.write('#### answer\n\n%s\n\n' % pentry['answer'])
        f.write('#### hint\n\n%s\n\n' % pentry['hint'])
        f.write('#### solution\n\n%s\n\n' % pentry['solution'])
        f.write('#### note\n\n')
        f.write('#### comment\n\n')
        f.write('#### info\n\n')

    return

if __name__ == '__main__':
    #print(sys.argv)

    for filename in sys.argv[1:]:

        print('Processing file [%s]...' % filename)

        problemlist = read_src(filename)

        makemdlist(problemlist)

