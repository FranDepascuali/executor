local library = require 'lualibrary'
local printer = require 'printer'

-- Flatten a list of commands into one
-- or return the command if it was a string already
function flatten(...) 
    if type(...) == "string" then
        return ...
    end
    return table.concat(..., " | ")
end

function execute(command)
    local f = io.popen(command) -- runs command
    local l = f:read("*a") -- read output of command
    f:close()
    return l
end

local function hook (original_fn)
    return function (...)
        command = flatten(original_fn(...))
        printer.print_statement(command)
        execution = execute(command)
        print(execution)
        return execution
    end
end


for key,value in pairs(library) do
    _G[key] = hook(library[key])
end

function build_command(command)
    return function(...)
        cmd = command
        
        for index, argument in pairs({...})
            do cmd = cmd .. ' ' .. argument
        end

        return cmd
    end
end

local mt = {} 

mt.__index = function(table, key)
        -- If we didn't find the method, then create it. Index will then handle
        -- the parameters to this function.
        return hook(build_command(key))
    end

setmetatable(_G, mt)
