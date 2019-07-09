local finder = require 'library.finder'
local printer = require 'library.printer'
local ios = require 'library.ios'

local library = {}

library.ios = ios
library.finder = finder
library.printer = printer

return library