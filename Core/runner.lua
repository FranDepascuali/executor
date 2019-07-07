local library = require 'lualibrary'



local function hook (original_fn)
    return function (...)
        command = original_fn(...)
        print_statement(command)
        print(execute(command))
    end
end


for key,value in pairs(library) do
    -- _G.ios_simulators = library.ios_simulators
    -- key()
    print("found member " .. key);
    _G[key] = hook(library[key])
end

-- _G["ios_simulators"] = library["ios_simulators"]

-- ios_simulators = hook(ios_simulators)
-- _G.ios_simulators = function()
--     library.ios_simulators()
-- end

-- local mt = getmetatable(_G)

-- if mt == nil then
--   mt = {}
--   setmetatable(_G, mt)
-- end

-- -- set hook for undefined variables
-- mt.__index = function(t, cmd)
--     print("hello there")
--     return library.cmd
-- 	-- return command(cmd)
-- end