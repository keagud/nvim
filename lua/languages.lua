Languages = {}

local language = {}

function language:new()

    local newObj = {

        compile_flags = {},

        commands = {Format = nil, Run = nil, Compile = nil}
    }

    return setmetatable(newObj, self)
end

-- Python
local python = language:new()
Languages.python = python

python.commands.Format = ":!black %"
python.commands.Run = ":!python3 %"

-- lua
local lua = language:new()
Languages.lua = lua
lua.commands.Format = ":!lua-format % -i"
lua.commands.Run = ":!lua %"

for langName, langConfig in pairs(Languages) do

    for command, action in pairs(langConfig.commands) do

        repeat

            if not action then do break end end

            local cmdStr = string.format(
                               "au Filetype %s exe \"command! %s %s\"",
                               langName, command, action)
            vim.cmd(cmdStr)
            print(cmdStr)

        until true
    end

end

