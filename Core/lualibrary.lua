local hook = require("hook")

-- https://www.lua.org/pil/9.2.html

local M = {}


-- function curry(exec)
--     return function(command)
--         return exec(command)
--     end
-- end

-- function ls(...)
--     cmd = "ls"

--     for index, argument in pairs({...})
--         do cmd = cmd .. ' ' .. argument
--     end

--     return cmd
-- end

-- function wc()
--     return "wc -l"
-- end

-- function ls()
--     return execute("xcrun simctl list | sed -n '/== Device Types ==/,/== Runtimes ==/p' | grep \"iPhone\"")
-- end

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
