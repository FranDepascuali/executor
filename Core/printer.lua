local colors = require 'ansicolors'

local printer = {}

function printer.print_statement(message)
    -- formatted_message = colors(string.format("%{magenta}→ %s", message))
    formatted_message = colors("%{magenta}→ " .. message)
    print(formatted_message)
end

return printer