
" This turns on syntax highlighting.
syntax on

" This turns on line numbering.
set number 

" This turns on auto suggestions of commands.
set wildmenu

" Spellcheck
set spelling=en_us
set spell

" Disables the autoback up feature of files of vim
set nobackup
set nowritebackup

" This sets the color scheme.
colorscheme jellybeans

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


" Vim plugin
call plug#begin('~/.vim/plugged')

" Julia support for vim.
Plug 'JuliaEditorSupport/julia-vim'

" Multi Language support
Plug 'sheerun/vim-polyglot'

" Support for directory navigation from vim.
Plug 'preservim/nerdtree'

" Linting support for various languages
Plug 'dense-analysis/ale'

call plug#end()
