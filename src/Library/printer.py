import re


class Colors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


def print_statement(message):
    from pprint import pprint
    print(f"{Colors.HEADER}→ {message}{Colors.ENDC}")


def print_info(message):
    # print(Colors.OKBLUE + "Info: ")
    # pretty_message = '\t'.join(('\n' + message.lstrip()).splitlines(True))
    # new_lines = pretty_message.count("\n")
    # if new_lines > 1:
    # pretty_message = pretty_message[pretty_message.find('\n') + 1 : pretty_message.rfind('\n')]
    # pretty_message = re.sub('\n', '', pretty_message, 1)
    # print(pretty_message + Colors.ENDC)

    print(Colors.OKBLUE + "Info: " + __adapt_message__(message) + Colors.ENDC)


def print_success(message):
    print(Colors.OKGREEN + "✔ " + __adapt_message__(message) + Colors.ENDC)


def print_error(message):
    print(Colors.FAIL + "Failed: " + __adapt_message__(message) + Colors.ENDC)


def __adapt_message__(message):
    if isinstance(message, list):
        return '\n'.join(message)
    return message
