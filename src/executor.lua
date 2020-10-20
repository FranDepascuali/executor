local thispath = select('1', ...):match(".+%.") or ""
local library = require(thispath.."Library")

-- Flatten a list of commands into one
-- or return the command if it was a string already
function flatten(separator, ...) 
    if type(...) == "string" then
        return ...
    end
    return table.concat(..., separator)
end

function pipe(...)
    return flatten(" | ", ...)
end

function execute(command)
    local f = io.popen(command) -- runs command
    local l = f:read("*a") -- read output of command
    f:close()
    return l
end

local function hook (original_fn)
    return function (...)
        command = pipe(original_fn(...))
        library.printer.print_statement(command)
        execution = execute(command)
        -- print(execution)
        return execution
    end
end

for module,value in pairs(library) do
    -- For the case where the module returns an empty {}. don't know why
    -- but module without returns returns a boolean.
    if library[module] ~= nil and type(library[module]) ~= "boolean" then
        for funct,v in pairs(library[module]) do
            _G[funct] = hook(library[module][funct])
        end
    end

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
