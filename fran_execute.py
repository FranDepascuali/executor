#!/usr/bin/env python3

import argcomplete
import argparse
import inspect
import Library

parser = argparse.ArgumentParser(description='description')
subparsers = parser.add_subparsers(dest="function_called")
# parser.add_argument('-j', action='append', nargs='+')
# parser.add_argument('-i', action='append', nargs='+')
# parser.add_argument('-k', action='append', nargs='+')

# Tuples: (function_name, function_pointer)
callable_functions = inspect.getmembers(Library, lambda function: inspect.isfunction(
    function) and not '__' in function.__name__)


def get_ordered_arguments(function_name):
    for (name, f) in callable_functions:
        if name == function_name:
            return inspect.getfullargspec(f)[0]


for (function_name, function_pointer) in callable_functions:
    # First element contains the arguments
    # TODO: Add default artguments, it doesn't support them yet
    args = get_ordered_arguments(function_name)
    # print(args)

    parser_option = subparsers.add_parser(function_name)

    for arg in args:
        # Don't know why, but it needs an "--"
        parser_option.add_argument("--" + arg)

argcomplete.autocomplete(parser)
args_namespace = parser.parse_args()
unordered_args_dictionary = vars(args_namespace)
print(unordered_args_dictionary)
function_name = unordered_args_dictionary['function_called']

ordered_args = []

for argument in get_ordered_arguments(function_name):
    ordered_args.append(unordered_args_dictionary[argument])


def __call__(command):
    from subprocess import run, PIPE
    Library.print_statement(command)
    result = run(command, shell=True, stdout=PIPE, stderr=PIPE)
    parsedOutput = list(map(lambda line: line.decode(
        'UTF-8'), result.stdout.splitlines()))
    # print(result)

    # print(parsedOutput)
    # print("hello")
    return parsedOutput


# The function name is the last element, then we take it out from the args.
function_to_call = getattr(Library, function_name)
executedCommand = __call__(function_to_call(*ordered_args))
Library.print_success(executedCommand)
