require 'language/lua'
lua = Language::Lua.new()
# lua.eval("lualibrary.lua")
print(lua.eval("require(\"Library.lualibrary\") ; return function_to_execute()"))

out = lua.function_to_execute()
print out;