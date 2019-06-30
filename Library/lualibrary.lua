function execute(command)
    local f = io.popen(command) -- runs command
    local l = f:read("*a") -- read output of command
    f:close()
    return l
end

function ls()
    return execute("xcrun simctl list | sed -n '/== Device Types ==/,/== Runtimes ==/p' | grep \"iPhone\"")
end

function find_between(first, second)
    -- def find_between(first, second):
    -- return sed["-n", f'/{first}/,/{second}/p']
    -- return "sed -n /" .. first .. "/,/" .. second .. "\'/p\'"
    
    return string.format("sed -n '/%s/,/%s/p'", first, second)
end

function wc(lines) 
    return execute(string.format("echo \"%s\" | wc -l", lines))
end

function simulators()
    -- sims = "xcrun simctl list"
    -- bet = find_between('== Device Types ==', '== Runtimes ==')
    -- return execute(string.format("%s | %s", sims, bet))
    -- return wc("bla\nhey")
    
    ans = execute("ls .")
    return wc(ans)
end
    -- return string.format("

-- def simulators():
    -- return list_simulators() | find_between('== Device Types ==', '== Runtimes ==')
    -- # return f"{list_simulators()} | {find_between('== Device Types ==', '== Runtimes ==')}"

function_to_execute = simulators


