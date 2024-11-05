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

set expandtab       " Replace tabs with spaces.

" Julia Stuff
autocmd BufRead,BufNewFile *.jl set textwidth=92    " Limit lines according to Julia's CONTRIBUTING guidelines.
" Julia Styling
autocmd BufRead,BufNewFile *.jl set colorcolumn=93 " none shall pass 93
autocmd BufRead,BufNewFile *.jl set tabstop=4       " Set tabstops to a width of four columns.
autocmd BufRead,BufNewFile *.jl set softtabstop=4   " Determine the behaviour of TAB and BACKSPACE keys with expandtab.
autocmd BufRead,BufNewFile *.jl set shiftwidth=4    " Determine the results of >>, <<, and ==.

" HTML templates
autocmd BufRead,BufNewFile *.html.tmpl set filetype=html

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

" Comments made easy
Plug 'tpope/vim-commentary'

" Lang support
Plug 'sheerun/vim-polyglot'
Plug 'lluchs/vim-wren'
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

Plug 'jgdavey/tslime.vim'
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
vnoremap <leader><leader> <Plug>SendSelectionToTmux
nnoremap <leader><leader> <Plug>NormalModeSendToTmux

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

if executable('python')
  Plug 'Ron89/thesaurus_query.vim'
else
  echo "Python is not installed and thesaurus_query will not be used."
endif

call plug#end()

" Custom bindings
" Make binding
noremap <leader>m :w<CR>:!make<CR>

" Sets mathematica strings
autocmd FileType mma setlocal commentstring=(*\ %s\ *) 

" Setting complete opts
setlocal completeopt=menu,menuone,noselect
setlocal dictionary=spell

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nnoremap <buffer> gI <plug>(lsp-status)
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nnoremap <buffer> g]r <plug>(lsp-next-reference)
    nnoremap <buffer> g[r <plug>(lsp-previous-reference)
    nmap <buffer> <leader>gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <leader>f <plug>(lsp-document-format)
    vnoremap <leader>f <plug>(lsp-document-format)
    nnoremap <buffer> ga <plug>(lsp-code-action)
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" colorscheme
let g:sonokai_style = 'espresso'
colorscheme sonokai
