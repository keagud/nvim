Languages = {}

local language = {}

function language:new()

    local newObj = {

        compile_flags = {},

        commands = {
            Compile = nil,
            Format = nil,
            Lint = nil,
            Build = "make",
            Test = nil,
            Run = "./",
        }

    }

    self.__index = self

    return setmetatable(newObj, self)
end

BINARY_STYLE = "%:r.bin"
GIT_TOPLEVEL = "$(git rev-parse --show-toplevel)"

-- Python
local python = language:new()
Languages.python = python

python.commands.Format = "black %"
python.commands.Run = "python3 %"
python.commands.Lint = "pylint %"
python.commands.Test = "poetry run pytest"

-- lua
local lua = language:new()
Languages.lua = lua
lua.commands.Format = "lua-format % -i"
lua.commands.Run = "lua %"

-- rust
local rust = language:new()
Languages.rust = rust
rust.commands.Format = "rustfmt %"
rust.commands.Compile = "rustc % -o " .. BINARY_STYLE
rust.commands.Lint = "clippy-driver %"
rust.commands.Build = "cargo build"

-- C
local c = language:new()
Languages.c = c
c.commands.Format = "clang-format % -i -style=llvm"
c.commands.Compile = "gcc % -o " .. BINARY_STYLE

c.compile_flags = {'-Wall', '-Wextra', '-std=c99'}

-- C++
local cpp = c:new()
Languages.cpp = cpp
cpp.commands.Format = c.commands.Format
cpp.commands.Compile = c.commands.Compile

cpp.compile_flags = {" -lstdc++ -Wall", "-Wextra", "-pedantic", "-std=c++17"}

--- autocmd setup
for langName, langConfig in pairs(Languages) do

    for command, action in pairs(langConfig.commands) do

        if not action then
            action = string.format(":!echo %s not defined for %s", command,
                                   langName)

        elseif command == "Compile" then
            action = action .. " " ..
                         table.concat(langConfig.compile_flags, " ")

        elseif command == "Run" and langConfig.commands.Compile ~= nil then

            action =  langConfig.commands.Compile  .. " " .. table.concat(langConfig.compile_flags, " " ).. " && " ..
                         langConfig.commands.Run .. BINARY_STYLE

        elseif command == "Test" and langConfig.commands.Test ~= nil then
            action = "cd " .. GIT_TOPLEVEL .. " && " .. action
            print(action)
        end

        action = ":!" .. action

        local cmdStr = string.format("au Filetype %s exe \"command! %s %s\"",
                                     langName, command, action)
        vim.cmd(cmdStr)

    end

end

