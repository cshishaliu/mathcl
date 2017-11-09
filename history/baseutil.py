import re
import shutil


def print_hline(symbol ='-', count=60):
    print(symbol*count)
    return


def read_txt_file(filename):

    with open(filename) as f:
        fs = f.read()

    return fs


if __name__ == '__main__':

    pass