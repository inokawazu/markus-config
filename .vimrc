" vi is old
set nocompatible

" custom leader key
let mapleader = ","

" This turns on syntax highlighting.
syntax on

" No highlighting
set nohlsearch

" Hidden buffers
set hidden

" show matches
set incsearch

" keep cursor towards the center
set scrolloff=10

setlocal expandtab       " Replace tabs with spaces.
autocmd BufRead,BufNewFile *.jl set textwidth=92    " Limit lines according to Julia's CONTRIBUTING guidelines.

" none shall pass 93
set colorcolumn=93

" blue style tabs
set tabstop=4       " Set tabstops to a width of four columns.
set softtabstop=4   " Determine the behaviour of TAB and BACKSPACE keys with expandtab.
set shiftwidth=4    " Determine the results of >>, <<, and ==.

" This turns on line numbering.
set number 

" starts matchit
runtime macros/matchit.vim

" for fuzzy file search. 
" use `:find filename`, tab for autocompletion
" to fuzzy search just add * beginning or end of filename
filetype plugin on
set path+=.,**

" This turns on auto suggestions of commands.
set wildmenu
" fuzzy search result in a menu using tab or shift + tab
" ^^ can use `:ls` to see open files in buffer and switch between them using `:b filename`.

" Spellcheck
set spelllang=en_us
":set spell to start the spellcheck

" Disables the autoback up feature of files of vim
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

" Vim plugin
call plug#begin('~/.vim/plugged')

" Julia support for vim.
Plug 'JuliaEditorSupport/julia-vim'
Plug 'kdheepak/JuliaFormatter.vim'

" mathematica support 
Plug 'voldikss/vim-mma'

" Grammar Check (not for spelling)
Plug 'rhysd/vim-grammarous'

" Autocompletions for vim
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" For commenting
Plug 'tpope/vim-commentary'

" Multi Language support
Plug 'sheerun/vim-polyglot'

" Coloschemes
" Gruvbox Material
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/sonokai'

" Powerline Clone
Plug 'itchyny/lightline.vim'

" Support for directory navigation from vim.
Plug 'preservim/nerdtree'

" Linting support for various languages
Plug 'dense-analysis/ale'

" tmux navigation
Plug 'christoomey/vim-tmux-navigator'
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>

" For adding commands from vim to bash
Plug 'preservim/vimux'

" For latex commands
Plug 'lervag/vimtex'

Plug 'tpope/vim-fugitive'

" floating terminals
" Plug 'voldikss/vim-floaterm'

" VLang highlighting
Plug 'ollykel/v-vim'

" Snippet Support 
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

" Plug 'neovim/nvim-lsp'

call plug#end()

" Settings for lightline
set noshowmode
set laststatus=2

"snipmate version setting
let g:snipMate = { 'snippet_version' : 1 }

" Block movement for Julia
runtime macros/matchit.vim

" colorscheme settings
if has('termguicolors')
  set termguicolors
endif
"
" uses the syntaxcomplete#Complete for autocompletion
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \ if &omnifunc == "" |
        \ setlocal omnifunc=syntaxcomplete#Complete |
        \ endif
endif

let g:sonokai_style = 'maia'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
let g:sonokai_transparent_background = 1
colorscheme sonokai

" For dark version.
" set background=dark
" let g:gruvbox_material_background = 'hard'
" let g:gruvbox_material_palette = 'original'
" colorscheme gruvbox-material
