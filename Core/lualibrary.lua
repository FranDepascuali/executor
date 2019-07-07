local colors = require 'ansicolors'
local hook = require("hook")

-- https://www.lua.org/pil/9.2.html

local M = {}

function execute(command)
    local f = io.popen(command) -- runs command
    local l = f:read("*a") -- read output of command
    f:close()
    return l
end

function build_command(command, ...)
    cmd = command

    for index, argument in pairs({...})
        do cmd = cmd .. ' ' .. argument
    end

    return cmd
end

function ls(...)
    cmd = "ls"

    for index, argument in pairs({...})
        do cmd = cmd .. ' ' .. argument
    end

    return cmd
end

function wc()
    return "wc -l"
end

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

function curry(exec)
    return function(command)
        return exec(command)
    end
end

function combine(...) 
    if type(...) == "string" then
        return ...
    end
    return table.concat(..., " | ")
end

function M.ios_simulators()
    return combine({simulators(), find_between('== Device Types ==', '== Runtimes =='), find_lines_with_word("iPhone") })
    -- print_statement(command_to_execute)
    -- print(execute(command_to_execute))
end

function M.find_files(directory, name)
    return combine("find " .. directory .. " -name " .. name)
end

function print_statement(message)
    -- formatted_message = colors(string.format("%{magenta}→ %s", message))
    formatted_message = colors("%{magenta}→ " .. message)
    print(formatted_message)
end

-- ios_simulators = {simulators(), find_between('== Device Types ==', '== Runtimes =='), find_lines_with_word("iPhone") }

-- command_to_execute = ios_simulators
-- command_to_execute = find_files(".", "sh.lua")
-- command_to_execute = {'echo \"== Device Types ==  hello == Runties == \"', find_between('== Device Types ==', '== Runtimes ==')}
-- command_to_execute = ls("-a")
-- command_to_execute = build_command("wc", "-l")



-- print_statement(string.format("Executing: %s", combine(command_to_execute)))
-- print(execute(combine(command_to_execute)))


-- local function print_command_hook(msg)
-- 	print("testHook2(\"" .. tostring(msg) .. "\")")
-- end

-- ios_simulators = hook.add(ios_simulators, print_command_hook)









-- -- get global metatable
-- local mt = getmetatable(_G)
-- if mt == nil then
--   mt = {}
--   setmetatable(_G, mt)
-- end

-- -- set hook for undefined variables
-- M.__index = function(t, cmd)
    -- print("Hey there: " .. cmd)
    -- return cmd
--     -- converted = combine(build_command("ls", "-a"))
--     -- print(execute(converted))
--     -- print(converted)
--     -- return curry(execute)(converted)
--     print(execute(combine(command_to_execute)))
--     return converted
-- 	-- return build_command(cmd)
-- end



return M
-- command_to_execute = ls("-a")



-- print_statement(string.format("Executing: %s", combine(command_to_execute)))
-- print(curry(execute)(combine(command_to_execute)))

-- require('sh')
