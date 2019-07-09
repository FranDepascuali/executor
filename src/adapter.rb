require 'language/lua'

lua = Language::Lua.new()
lua.eval("require(\"executor\")")


lua.ios_simulators()
lua.ls("-l")
lua.echo("hola mundo")