from Library.finder import *


def delete_derived_data():
    return "rm -rf ~/Library/Developer/Xcode/DerivedData"


def list_simulators():
    return "xcrun simctl list"


def remove_unavailable_simulators():
    return "xcrun simctl delete unavailable"


def simulators():
    return f"{list_simulators()} | {find_between('== Device Types ==', '== Runtimes ==')}"


def iphone_simulators():
    return f"{list_simulators()} | {find_between('== Device Types ==', '== Runtimes ==')} | {find_lines_with_word('iPhone')}"
