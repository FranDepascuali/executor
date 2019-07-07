require 'language/lua'

lua = Language::Lua.new()
# lua.eval("lualibrary.lua")
print(lua.eval("
require(\"runner\")"
))


# lua.ios_simulators()
# lua.find_files(".", "runner.lua")
lua.ls()
lua.wc("-l")
# lua.find_between("hello", "goodbye")
# lua.foo("hello", "hello")
# print(lua.ios_simulators())

# out = lua.function_to_execute()
# print out;