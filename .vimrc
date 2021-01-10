
" This turns on syntax highlighting.
syntax on

" This turns on line numbering.
set number 

" This turns on auto suggestions of commands.
set wildmenu

" Vim plugin
call plug#begin('~/.vim/plugged')

" Julia support for vim.
Plug 'JuliaEditorSupport/julia-vim

call plug#end()
