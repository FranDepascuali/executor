local finder = {}

function finder.grep(word)
    return string.format("grep \"%s\"", word)
end

function finder.find_between(first, second)
    return string.format("sed -n '/%s/,/%s/p'", first, second)
end

function finder.find_lines_with_word(word)
    return finder.grep(word)
end

function finder.find_files(directory, name)
    return "find " .. directory .. " -name " .. name
end

return finder
