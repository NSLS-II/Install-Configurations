#!/usr/bin/env python3

"""
Script for identifying the dependencies for a particular EPICS support module. When adding a new module
to a configuration, run this script on it, and ensure that all dependency modules are above it in
the configuration, as installSynApps will build all modules in the order they are given.

@author:    Jakub Wlodek
@created:   10-Sep-2019
@copyright: Brookhaven National Laboratory
"""
 
import os
import re
import argparse


def show_dependencies(path):

    module = os.path.basename(path)
    print('----------------------------------')
    print('Dependancies for {}:'.format(module))
    release_path = os.path.join('configure', 'RELEASE')
    try:
        release_file = open(os.path.join(path, release_path), 'r')
        lines = release_file.readlines()
        release_file.close()
        for line in lines:
            if not line.startswith('#') and '=' in line:
                line = line.strip()
                line = re.sub(' +', '', line)
                print('* {}'.format(line.split('=')[0]))
    except:
        print('Error could not find RELEASE file for path {}.'.format(os.path.join(path, release_path)))


parser = argparse.ArgumentParser()
parser.add_argument('targetpath', help='The path to the module for which you wish to list dependencies')
args = vars(parser.parse_args())

if args['targetpath'].endswith('/'):
    args['targetpath'] = args['targetpath'][:-1]

module = os.path.basename(args['targetpath'])
if module != 'support':
    show_dependencies(args['targetpath'], module)
else:
    for dir in os.listdir(args['targetpath']):
        target = os.path.join(args['targetpath'], dir)
        if os.path.isdir(target):
            show_dependencies(target)
