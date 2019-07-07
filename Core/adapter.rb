require 'language/lua'

lua = Language::Lua.new()
# lua.eval("lualibrary.lua")
print(lua.eval("
require(\"runner\")"
))


lua.ios_simulators()
lua.ls("-l")