-- local ios = require 'Library.ios'
local finder = require 'Library.finder'
local printer = require 'Library.printer'
local ios = require 'Library.ios'

local library = {}

library.ios = ios
library.finder = finder
library.printer = printer

return library