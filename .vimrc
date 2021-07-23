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

" none shall pass 80
set colorcolumn=80

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
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

" Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}

" " julia
" let g:default_julia_version = '1.0'

" " language server
" let g:LanguageClient_autoStart = 1
" let g:LanguageClient_serverCommands = {
" \   'julia': ['julia', '--startup-file=no', '--history-file=no', '-e', '
" \       using LanguageServer;
" \       using Pkg;
" \       import StaticLint;
" \       import SymbolServer;
" \       env_path = dirname(Pkg.Types.Context().env.project_file);
" \       
" \       server = LanguageServer.LanguageServerInstance(stdin, stdout, env_path, "");
" \       server.runlinter = true;
" \       run(server);
" \   ']
" \ }

" nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

