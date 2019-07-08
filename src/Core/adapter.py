from lupa import LuaRuntime
lua_runtime = LuaRuntime()

lua_runtime.eval("require(\"executor\")")
lua = lua_runtime.globals()

lua.ios_simulators()
lua.ls("-l")
