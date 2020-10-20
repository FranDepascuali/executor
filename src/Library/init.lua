local finder = require 'library.finder'
local printer = require 'library.printer'
local ios = require 'library.ios'

-- -- http://kiki.to/blog/2014/04/12/rule-5-beware-of-multiple-files/
-- local current_folder = (...):gsub('%.init$', '')
-- print(current_folder_2)
-- local finder = require(current_folder .. '.finder')
-- local printer = require(current_folder .. '.printer')
-- local printer = require(current_folder .. '.ios')

local library = {}

library.ios = ios
library.finder = finder
library.printer = printer

return library