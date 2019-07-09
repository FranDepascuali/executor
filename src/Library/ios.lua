local finder = require 'library.finder'

local ios = {}


function ios.simulator_sdk_path()
    return "xcrun --show-sdk-path --sdk iphonesimulator"
end

function chain(f, g)
    return { f, flatten(" ", { "xargs -I {}", g }) }
end

function ios.build_workspace(configuration, scheme, workspace)
    -- build = flatten(" ", {
    --                     "xcodebuild",
    --                     "-configuration " .. configuration,
    --                     "-scheme " .. scheme,
    --                     "-workspace " .. workspace,
    --                     "-sdk {}",
    --                     "build",
    --                     "-UseModernBuildSystem=NO"
    --                     })

    -- return chain(ios.simulator_sdk_path(), build)
    return flatten(" ", {
                        "xcodebuild",
                        "-configuration " .. configuration,
                        "-scheme " .. scheme,
                        "-workspace " .. workspace,
                        "-sdk $(" .. ios.simulator_sdk_path() .. ")", 
                        "build",
                        "-UseModernBuildSystem=NO"
                        })
end

function ios.full_simulators_list()
    return "xcrun simctl list"
end

function ios.ios_simulators()
    return {ios.full_simulators_list(), finder.find_between('== Device Types ==', '== Runtimes =='), finder.find_lines_with_word("iPhone") }
end

function ios.simulator_path()
    return "xcrun --show-sdk-path --sdk iphonesimulator"
end

function ios.openSimulator()
    return finder.open("/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app/")
end

return ios