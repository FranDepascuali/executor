def find_between(first, second):
    return f"sed -n '/{first}/,/{second}/p'"


def find_lines_with_word(word):
    return f"grep \"{word}\""


def find_files(directory, name):
    return "find {} -name {}".format(directory, name)


# def remember_function(file, function_name, function_code):
def remember_function(file):
    # return "def hello(directory_path)\n return \"hello\""
    return f"def hello(directory_path)\n return \"hello\" >> {file}"


# TODO: Should it be here?


def number_of_files(directory_path):
    return "ls " + directory_path + " | wc -l"


# TODO: Move from here
def run_cpu_monitor():
    return "top"
