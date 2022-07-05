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

" Julia Styling
set colorcolumn=93 " none shall pass 93
set tabstop=4       " Set tabstops to a width of four columns.
set softtabstop=4   " Determine the behaviour of TAB and BACKSPACE keys with expandtab.
set shiftwidth=4    " Determine the results of >>, <<, and ==.

" This turns on line numbering.
set relativenumber
set number

" wildmenu is actually pretty neat!
set wildmenu

" starts matchit
runtime macros/matchit.vim

set spelllang=en_us

set nobackup
set nowritebackup

" Plugins
call plug#begin('~/.vim/plugged')

" Wolfram Support
Plug 'rsmenon/vim-mathematica'

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

" Prompt for a command to run
Plug 'jgdavey/tslime.vim'
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
vnoremap <leader><leader> <Plug>SendSelectionToTmux
nnoremap <leader><leader> <Plug>NormalModeSendToTmux


" Plug 'dense-analysis/ale' " Linting support for various languages
Plug 'prabirshrestha/vim-lsp'
" Plug 'machakann/vim-lsp-julia'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
let g:asyncomplete_auto_popup = 1
let g:lsp_virtual_text_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_enabled = 1
let g:lsp_signs_enabled = 1
call plug#end()

let g:sonokai_style = 'maia'
colorscheme gruvbox-material
