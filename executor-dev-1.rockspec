package = "executor"
version = "dev-1"
source = {
   url = "git+https://github.com/FranDepascuali/Executor"
}
description = {
   homepage = "https://github.com/FranDepascuali/Executor",
   license = "*** please specify a license ***"
}
build = {
   type = "none",
   install = {
      lua = {
         "src/Core/executor.lua",
         "src/Core/printer.lua",
         "src/Core/lualibrary.lua"
      }
   }
}
