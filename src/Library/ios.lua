local finder = require 'library.finder'

local ios = {}

function ios.full_simulators_list()
    return "xcrun simctl list"
end

function ios.ios_simulators()
    return {ios.full_simulators_list(), finder.find_between('== Device Types ==', '== Runtimes =='), finder.find_lines_with_word("iPhone") }
end

return ios