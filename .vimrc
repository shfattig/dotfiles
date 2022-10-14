call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
call plug#end()


" Use 'jf' to exit insert mode
inoremap jf <Esc>

" Use spaces instead of tabs
"     tabstop:          Width of tab character
"     softtabstop:      Fine tunes the amount of white space to be added
"     shiftwidth        Determines the amount of whitespace to add in normal mode
"     expandtab:        When this option is enabled, vi will use spaces instead of tabs
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab

set autoindent

" Display search match while typing
set incsearch

" Let searches be case agnostic
set ignorecase

" Override ignorecase when searching for uppercase
set smartcase

autocmd FileType text setlocal shiftwidth=2 tabstop=2 softtabstop=2

