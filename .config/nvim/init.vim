
" Global settings

if exists('g:vscode')
    " VSCode extension
else
    " Non-VSCode settings
    
    " Source vimrc plugins
    "source ~/.vimrc
    "call plug#begin('~/.vim/plugged')
    "Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    "call plug#end()

    " Get back full line yank
    unmap Y

    nnoremap <C-p> :Telescope find_files<Enter>
    inoremap jf <Esc>:w<Enter>
    inoremap  
    set shiftwidth  =4
    set smartcase ignorecase

    "remove highlight on search
    nnoremap <C-n> :nohl<Enter>

    colorscheme slate

    " Automatically install missing plugins on startup
    autocmd VimEnter *
	\  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
	\|   PlugInstall --sync | q
	\| endif

    call plug#begin()
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
    " or                                , { 'branch': '0.1.x' }
    Plug 'neovim/nvim-lspconfig'
    Plug 'ajmwagar/vim-deus'

    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    " Plug 'hrsh7th/cmp-buffer'
    " Plug 'hrsh7th/cmp-path'
    call plug#end()

    " Load any lua configs
    lua require('config')
    lua require('user.treesitter')
    " lua require('user.nvim-cmp')
endif
