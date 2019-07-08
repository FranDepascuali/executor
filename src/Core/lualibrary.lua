local M = {}

function M.grep(word)
    return string.format("grep \"%s\"", word)
end

function M.find_between(first, second)
    return string.format("sed -n '/%s/,/%s/p'", first, second)
end

function find_lines_with_word(word)
    return M.grep(word)
end

function simulators()
    return "xcrun simctl list"
end

function M.ios_simulators()
    return {simulators(), M.find_between('== Device Types ==', '== Runtimes =='), find_lines_with_word("iPhone") }
end

function M.find_files(directory, name)
    return "find " .. directory .. " -name " .. name
end

return M
