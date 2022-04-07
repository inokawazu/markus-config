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
set relativenumber
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
Plug 'mazleo/vim-astro'

" Powerline Clone
Plug 'itchyny/lightline.vim'

<<<<<<< HEAD
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>

" Plug 'dense-analysis/ale' " Linting support for various languages
Plug 'prabirshrestha/vim-lsp'
Plug 'machakann/vim-lsp-julia'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'

let g:asyncomplete_auto_popup = 1
let g:lsp_virtual_text_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_enabled = 1
let g:lsp_signs_enabled = 1
=======
Plug 'dense-analysis/ale' " Linting support for various languages
>>>>>>> 6ce315232621bc383c12228a215dc68fe1989abe

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
<<<<<<< HEAD
" let g:ale_completion_enabled = 1
" set omnifunc=ale#completion#OmniFunc
" let g:ale_completion_max_suggestions = 20
=======
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
let g:ale_completion_max_suggestions = 20
let g:ale_floating_preview = 1
>>>>>>> 6ce315232621bc383c12228a215dc68fe1989abe

let g:sonokai_style = 'maia'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
colorscheme sonokai
