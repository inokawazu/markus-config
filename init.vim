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

colo torte
