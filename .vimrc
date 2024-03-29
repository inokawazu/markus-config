let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vi is old
set nocompatible

let mapleader = ","

" This turns on syntax highlighting.
syntax on

set nohlsearch
set hidden
set incsearch
set scrolloff=10
set mmp=10000 " more memory for pattern matching!

setlocal expandtab       " Replace tabs with spaces.

autocmd BufRead,BufNewFile *.jl set textwidth=92    " Limit lines according to Julia's CONTRIBUTING guidelines.
" Julia Styling
autocmd BufRead,BufNewFile *.jl set colorcolumn=93 " none shall pass 93
autocmd BufRead,BufNewFile *.jl set tabstop=4       " Set tabstops to a width of four columns.
autocmd BufRead,BufNewFile *.jl set softtabstop=4   " Determine the behaviour of TAB and BACKSPACE keys with expandtab.
autocmd BufRead,BufNewFile *.jl set shiftwidth=4    " Determine the results of >>, <<, and ==.

" This turns on line numbering.
set relativenumber
set number

" wildmenu is actually pretty neat!
set wildmenu
set wildmode=full

" starts matchit
runtime macros/matchit.vim

set spelllang=en_us

set nobackup
set nowritebackup

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Plugins
call plug#begin('~/.vim/plugged')

" Async vim
Plug 'skywind3000/asyncrun.vim'

" Comments made easy
Plug 'tpope/vim-commentary'

" Lang support
Plug 'sheerun/vim-polyglot'
Plug 'lluchs/vim-wren'
Plug 'ollykel/v-vim'
Plug 'lervag/vimtex'
Plug 'rsmenon/vim-mathematica'

" easy to put in brackets
Plug 'tpope/vim-surround'

" Julia support for vim.
Plug 'JuliaEditorSupport/julia-vim'
Plug 'kdheepak/JuliaFormatter.vim'

" Coloschemes
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/sonokai'
Plug 'nanotech/jellybeans.vim'

" Powerline Clone
Plug 'itchyny/lightline.vim'

" Plug 'jgdavey/tslime.vim'
" let g:tslime_always_current_session = 1
" let g:tslime_always_current_window = 1
" vnoremap <leader><leader> <Plug>SendSelectionToTmux
" nnoremap <leader><leader> <Plug>NormalModeSendToTmux

" trying sniprun
Plug 'michaelb/sniprun', {'do': 'sh install.sh'}
vnoremap <leader><leader> <Plug>SnipRun
nnoremap <leader><leader> <Plug>SnipRun

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ray-x/cmp-treesitter'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'

set completeopt=menu,menuone,noselect

" Dir navigation
Plug 'preservim/nerdtree'
nnoremap <C-t> :NERDTreeToggle<CR>

call plug#end()

" Custom bindings
"
" Make binding
noremap <leader>m :w<CR>:!make<CR>

" Sets mathematica strings
autocmd FileType mma setlocal commentstring=(*\ %s\ *) 

" Setting complete opts
set completeopt=menu,menuone,noselect

" colorscheme
let g:sonokai_style = 'espresso'
colorscheme sonokai
