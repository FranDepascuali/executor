from Library.finder import *
from plumbum.cmd import xcrun


def delete_derived_data():
    return "rm -rf ~/Library/Developer/Xcode/DerivedData"


simctl = xcrun["simctl"]


def list_simulators():
    return simctl["list"]


def remove_unavailable_simulators():
    return simctl["delete", "unavailable"]


def simulators():
    return list_simulators() | find_between('== Device Types ==', '== Runtimes ==')
    # return f"{list_simulators()} | {find_between('== Device Types ==', '== Runtimes ==')}"


def iphone_simulators():
    return f"{list_simulators()} | {find_between('== Device Types ==', '== Runtimes ==')} | {find_lines_with_word('iPhone')}"
