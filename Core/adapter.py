from lupa import LuaRuntime
lua = LuaRuntime()

lua.eval("require(\"runner\")")


lua.globals().ios_simulators()
lua.globals().ls("-l")
