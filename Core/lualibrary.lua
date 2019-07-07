local hook = require("hook")

-- https://www.lua.org/pil/9.2.html

local M = {}



function build_command(command, ...)
    cmd = command

    for index, argument in pairs({...})
        do cmd = cmd .. ' ' .. argument
    end

    return cmd
end

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

function grep(word)
    return string.format("grep \"%s\"", word)
end

-- function ls()
--     return execute("xcrun simctl list | sed -n '/== Device Types ==/,/== Runtimes ==/p' | grep \"iPhone\"")
-- end

function find_between(first, second)
    -- def find_between(first, second):
    -- return sed["-n", f'/{first}/,/{second}/p']
    -- return "sed -n /" .. first .. "/,/" .. second .. "\'/p\'"
    
    return string.format("sed -n '/%s/,/%s/p'", first, second)
end

-- function wc(lines) 
--     return execute(string.format("echo \"%s\" | wc -l", lines))
-- end


function find_lines_with_word(word)
    return grep(word)
end

function simulators()
    return "xcrun simctl list"
end

-- function simulators()
    -- sims = "xcrun simctl list"
    -- bet = find_between('== Device Types ==', '== Runtimes ==')
    -- return execute(string.format("%s | %s", sims, bet))
    -- return wc("bla\nhey")
    
    -- ans = execute("ls .")
    -- return wc(ans)
-- end
    -- return string.format("

-- def simulators():
    -- return list_simulators() | find_between('== Device Types ==', '== Runtimes ==')
    -- # return f"{list_simulators()} | {find_between('== Device Types ==', '== Runtimes ==')}"

function M.ios_simulators()
    return {simulators(), find_between('== Device Types ==', '== Runtimes =='), find_lines_with_word("iPhone") }
end

function M.find_files(directory, name)
    return "find " .. directory .. " -name " .. name
end

return M
