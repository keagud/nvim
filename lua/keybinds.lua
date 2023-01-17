
local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

local function nmap(shortcut, command)
  map('n', shortcut, command)
 end

local function imap(shortcut, command)
  map('i', shortcut, command)
end


vim.g.mapleader = ","





