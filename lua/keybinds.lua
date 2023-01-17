
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

leaderCommandMap('mr', "Run")
leaderCommandMap('mf', "Format")
leaderCommandMap('mc', "Compile")
leaderCommandMap("ml", "Lint")

leaderCommandMap('ff', 'NERDTreeToggle')








