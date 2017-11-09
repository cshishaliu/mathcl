#!/usr/bin/env python3

import argparse
import os

from base_cls import LectureNote

if __name__ == '__main__':
    """
    """
    ap = argparse.ArgumentParser()
    ap.add_argument('files', nargs='*')
    ap.add_argument('-f', '--force', action='store_true')
    args = ap.parse_args()

    file_names = args.files
    if not file_names:
        file_names = [name for name in os.listdir() if name[:3] == 'ln.']

    mdfiles = [name for name in file_names if name[-3:] == '.md']

    for mdfile in mdfiles:
        ln = LectureNote(src=mdfile, shortanswer=False)

        texfile = ln.label + '.tex'

        if not os.path.exists(texfile) or os.path.getmtime(texfile) < os.path.getmtime(mdfile) or args.force:

            print('Processing file [%s]...' % mdfile)

            ln.export_texfile(dest=texfile)


