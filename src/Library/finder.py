from plumbum.cmd import ls, grep, wc, sed
from toolz import compose


def curry(*types, exception=TypeError):
    def outerwrap(f):
        def innerwrap(*args):
            # check if types are correct
            for i in range(min(len(args), len(types))):
                if types[i] is Any:
                    continue
                if not type(args[i]) is types[i]:
                    raise exception("in {}: expected {}, got {}"
                                    .format(f.__name__, types[i], type(args[i])))
            # if too few arguments are given, return new curried function
            if len(types) > len(args):
                return curry(*(types[len(args):]), exception=exception)(lambda *largs: f(*args, *largs))
            return f(*args)
        return innerwrap
    return outerwrap


class Any:
    pass


def find_between(first, second):
    return sed["-n", f'/{first}/,/{second}/p']


def find_lines_with_word(word):
    return grep[f"\"{word}\""]
    # return f"grep \"{word}\""



@curry(str)
def list_files(directory_path):
    return ls[directory_path]


count = wc["-l"]


def number_of_files(directory_path):
    return list_files(directory_path) | count


def number_of_files_foo(directory_path):
    return list_files()(directory_path) | count

# TODO: Move from here


def run_cpu_monitor():
    return "top"

# def remember_function(file, function_name, function_code):
#     return f"echo \"def hello(directory_path):\n    return \\\"{function_name}\\\"\" >> {file}"


# TODO: Should it be here?


# def number_of_files(directory_path):
#     return "ls " + directory_path + " | wc -l"
