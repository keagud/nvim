
vim.cmd([[


let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set runtimepath^=~=/.vim runtimepath+=~/.vim/after 

let &packpath = &runtimepath

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'bling/vim-airline'
Plug 'NLKNguyen/c-syntax.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'kassio/neoterm'
Plug 'bluz71/vim-nightfly-colors'
Plug 'bluz71/vim-moonfly-colors'
Plug 'Yggdroot/indentLine'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
Plug 'itmecho/neoterm.nvim'
call plug#end()

]])

vim.cmd([[
set nottimeout
set encoding=utf-8
imap jj <Esc>
syntax enable
set number 
set cursorline
set hlsearch
colorscheme molokai_dark

if exists("g:neovide")
	colorscheme moonfly
endif


]])
