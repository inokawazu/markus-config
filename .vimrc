" vi is old
set nocompatible

let mapleader = ","

" This turns on syntax highlighting.
syntax on

set nohlsearch
set hidden
set incsearch
set scrolloff=10

setlocal expandtab       " Replace tabs with spaces.
autocmd BufRead,BufNewFile *.jl set textwidth=92    " Limit lines according to Julia's CONTRIBUTING guidelines.

" Begin Julia Styling
set colorcolumn=93 " none shall pass 93
set tabstop=4       " Set tabstops to a width of four columns.
set softtabstop=4   " Determine the behaviour of TAB and BACKSPACE keys with expandtab.
set shiftwidth=4    " Determine the results of >>, <<, and ==.
" End Julia Styling

" This turns on line numbering.
set number 

" starts matchit
runtime macros/matchit.vim

" for fuzzy file search. 
filetype plugin on
set path+=.,**
set wildmenu

set spelllang=en_us

set nobackup
set nowritebackup

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -sfLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Begin Vim plugins
call plug#begin('~/.vim/plugged')

" Julia support for vim.
Plug 'JuliaEditorSupport/julia-vim'
Plug 'kdheepak/JuliaFormatter.vim'

Plug 'tpope/vim-commentary'

Plug 'sheerun/vim-polyglot'
Plug 'lluchs/vim-wren'
Plug 'ollykel/v-vim'
Plug 'lervag/vimtex'

" Coloschemes
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/sonokai'

" Powerline Clone
Plug 'itchyny/lightline.vim'

Plug 'preservim/nerdtree'

Plug 'christoomey/vim-tmux-navigator' " tmux navigation


Plug 'preservim/vimux' " For adding commands from vim to bash

" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>

Plug 'dense-analysis/ale' " Linting support for various languages

call plug#end()

" Settings for lightline
set noshowmode
set laststatus=2

" Block movement for Julia
runtime macros/matchit.vim

" colorscheme settings
if has('termguicolors')
  set termguicolors
endif

" ale completion
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
let g:ale_completion_max_suggestions = 20

let g:sonokai_style = 'maia'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
colorscheme sonokai
