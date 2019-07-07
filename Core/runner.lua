local library = require 'lualibrary'

-- for key,value in pairs(library) do
--     print("found member " .. key);
-- end

-- function ios_simulatorss()
--     print_statement(ios_simulators())
--     print(execute(ios_simulators()))
-- end

print_statement(ios_simulators())
print(execute(ios_simulators()))

-- local function capture(table, key, rest)
--     print("hello 1")
--     return function(...)
--         print("hello 2")
--         local args = {...}
--         print(string.format("call to %s with key %s",
--                             tostring(table), tostring(key)))

--         cmd = key
--         for index, argument in pairs({...})
--             do cmd = cmd .. ' ' .. argument
--         end
--         print(cmd)
        
--         print_statement(ios_simulators())
--         print(execute(ios_simulators()))
--     end
-- end

-- local mt = getmetatable(_G)

-- if mt == nil then
--   mt = {}
--   setmetatable(_G, mt)
-- end

-- mt.__index = capture

-- return mt