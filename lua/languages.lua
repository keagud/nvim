Languages = {}

local language = {}

function language:new()

    local newObj = {

        compile_flags = {},

        commands = {Format = nil, Run = nil, Compile = nil, Lint = nil}

    }

    self.__index = self

    return setmetatable(newObj, self)
end

-- Python
local python = language:new()
Languages.python = python

python.commands.Format = ":!black %"
python.commands.Run = ":!python3 %"
python.commands.Lint = ":!pylint %"

-- lua
local lua = language:new()
Languages.lua = lua
lua.commands.Format = ":!lua-format % -i"
lua.commands.Run = ":!lua %"

-- C
local c = language:new()
Languages.c = c
c.commands.Format = ":!clang-format % -i -style=mozilla"
c.commands.Compile = ":!gcc % -o %:r.bin"

c.compile_flags = {'-Wall', '-Wextra', '-std=c99'}

-- C++
local cpp = c:new()
Languages.cpp = cpp
cpp.commands.Format = c.commands.Format
cpp.commands.Compile = c.commands.Compile

cpp.compile_flags = {" -lstdc++ -Wall", "-Wextra", "-pedantic", "-std=c++17"}

for langName, langConfig in pairs(Languages) do

    for command, action in pairs(langConfig.commands) do

        if not action then
          action = string.format(":!echo %s not defined for %s", command, langName)

        elseif command == "Compile" then
            action = action .. " " ..
                         table.concat(langConfig.compile_flags, " ")

        end

        local cmdStr = string.format("au Filetype %s exe \"command! %s %s\"",
                                     langName, command, action)
        vim.cmd(cmdStr)

    end


end

