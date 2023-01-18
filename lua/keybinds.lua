
local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = false, silent = true })
end

local function nmap(shortcut, command)
  map('n', shortcut, command)
 end

local function imap(shortcut, command)
  map('i', shortcut, command)
end

local function leaderCommandMap(shortcut, command)
  nmap( "<Leader>"..shortcut, ":"..command.."<CR>")
end


vim.g.mapleader = ','

leaderCommandMap('kr', "Run")
leaderCommandMap('kf', "Format")
leaderCommandMap('kc', "Compile")
leaderCommandMap("kl", "Lint")

leaderCommandMap('ff', 'NERDTreeToggle')


vim.cmd('tnoremap <Leader>tm  <C-\\><C-n><bar><C-w>')
leaderCommandMap('ts', ':botright :vertical Topen resize=40<CR>')
leaderCommandMap('tv', ':botright :vertical Topen')

--[[
-- place this in one of your configuration file(s)
local hop = require('hop')
local directions = require('hop.hint').HintDirection

leaderCommandMap('hf', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, {remap=true})
vim.keymap.set('', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, {remap=true})
vim.keymap.set('', 't', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, {remap=true})
vim.keymap.set('', 'T', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, {remap=true})


]]--


