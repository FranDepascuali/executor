package = "executor"
version = "dev-1"
source = {
   url = "git+https://github.com/FranDepascuali/Executor"
}
description = {
   summary = "A library to execute commands.",
   homepage = "https://github.com/FranDepascuali/Executor",
   license = "*** please specify a license ***"
}
dependencies = {"ansicolors == 1.0.2-3"}
build = {
   type = "none",
   install = {
      lua = {
         ["executor"] = "src/executor.lua",
         ["library"] = "src/library/init.lua",
         ["library.finder"] = "src/library/finder.lua",
         ["library.printer"] = "src/library/printer.lua",
         ["library.ios"] = "src/library/ios.lua"
      }
   }
}