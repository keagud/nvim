
vim.cmd([[ 

syntax enable
set number
set cursorline
set wildmenu
set wildmode=list:longest


set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*.bin

"set tabs to 2 spaces
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab


colorscheme molokai_dark

if exists("g:neovide")
	colorscheme moonfly
endif


]])
