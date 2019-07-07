require 'language/lua'

lua = Language::Lua.new()
# lua.eval("lualibrary.lua")
print(lua.eval("
a = require(\"runner\"); 
-- ls(\"-a\")"
))

lua.ios_simulators()
lua.foo("hello", "hello")
# print(lua.ios_simulators())

# out = lua.function_to_execute()
# print out;