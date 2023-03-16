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

set nolist
set wrap
set linebreak

set textwidth=0

silent execute '!mkdir -p ~/.vim/tmp'

set backupdir=~/.vim/tmp
set directory=~/.vim/tmp

"END

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

set noswapfile
let g:neovide_cursor_vfx_mode="wireframe"
let g:neoterm_size=""

set guifont=CaskaydiaCove_Nerd_Font_Regular,Hack,Noto_Color_Emoji

let g:neoterm_size = 5
let g:neoterm_default_mod = 'botright'
let g:neoterm_autoinsert = 1

]])
