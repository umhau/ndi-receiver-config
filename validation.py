# cleans the text
# if clean is too different from raw, then possibly malicious
# check length
# puts a good/bad file where site can see it
# creates and pushes a request to the generation server

import os.path
import glob
import datetime
from pathlib import Path
import time 
import argparse
import platform
import string
from random import randint


# use_py3 = platform.python_version()[0] == '3'

parser = argparse.ArgumentParser(description='TensorFlow code for generating from CTRL')
parser.add_argument('--jobs_folder', type=str, default='',required=True,
                                        help='a folder to watch for files containing new jobs')
parser.add_argument('--file_pattern', type=str, default='', required=True,
                                        help='name format of the files to watch for in the input folder. use single quotes.')
parser.add_argument('--archive_folder', type=str, default='',required=True,
                                        help='location to put files after they\'ve been processed')
parser.add_argument('--sleep_period', type=str, default='', required=True,
                                        help='how long the input searcher should wait between checks. counted in seconds.')
parser.add_argument('--max_wordcount', type=str, default='', required=True,
                                        help='refuse to generate more than this much text; skip the request.')
parser.add_argument('--label', type=str, default='', required=True,
                                        help='standard label to identify requests from this program to the text generator')
parser.add_argument('--output_folder', type=str, default='', required=True,
                                        help='place to put text generation request files.')

args = parser.parse_args()

if not os.path.isdir(args.output_folder): 
    print("output folder missing"); exit()

if not os.path.isdir(args.jobs_folder): 
    print("jobs folder missing"); exit()

if not os.path.isdir(args.archive_folder): 
    print("archive folder missing"); exit()

print("all folders present. entering loop.")

while True:

    age_sorted_list_of_files = sorted(glob.glob(os.path.join(args.jobs_folder, args.file_pattern)), key=os.path.getctime)

    if not age_sorted_list_of_files: 
        time.sleep(int(args.sleep_period))
        continue

    filepath = age_sorted_list_of_files[0]                    # get the oldest
    _, filename = os.path.split(filepath)              # extract the file name
    file_vars = filename.split('.')                # get variables out of name
    tag = file_vars[0]

    print("Found request file: " + filename)

    with open(filename) as f: rawlines = f.readlines()             # open file 
    lines = []                                                    # clean data
    printable = set(string.printable) 
    for rawline in rawlines: lines.append(''.join(filter(lambda x: x in printable, rawline.rstrip())))

    os.rename(filepath,args.archive_folder + '/' + filename) # archive old file

    email = lines[0]                                        # extract variables
    wordcount = int(lines[1])
    keyword1 = lines[2]
    keyword2 = lines[3]
    keyword3 = lines[4]

    if wordcount >= int(args.max_wordcount):
        print("Wordcount too great; refusing to generate.")
        continue

    # build request for the text generator
    seed = randint(10000000, 99999999)
    out_filename = tag + '.' + args.label + '.' + str(wordcount) + '.' + str(seed) + '.input'
    out_filepath = args.output_folder + '/' + out_filename
    generation_prompt = "Links " + keyword1 + ', ' + keyword2 + ', ' + keyword3 + '. '

    with open(out_filepath, "w") as myfile: myfile.write(generation_prompt)

    print("Sent generation prompt:")
    print("\tfilename: " + out_filepath)
    print("\tprompt: " + generation_prompt)
    print("")

