
" This turns on syntax highlighting.
syntax on

" This turns on line numbering.
set number 

" This turns on auto suggestions of commands.
set wildmenu

" starts matchit
runtime macros/matchit.vim

" for fuzzy file search. 
" use `:find filename`, tab for autocompletion
" to fuzzy search just add * beginning or end of filename
filetype plugin on
set path+=**
" fuzzy search result in a menu using tab or shift + tab
" ^^ can use `:ls` to see open files in buffer and switch between them using `:b filename`.

" Spellcheck
set spelllang=en_us
":set spell to start the spellcheck
" set spell

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

" Linting
Plug 'vim-syntastic/syntastic'

" Autocompletions for vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" For commenting
Plug 'tpope/vim-commentary'

" For focusing
Plug 'junegunn/limelight.vim'

" Multi Language support
Plug 'sheerun/vim-polyglot'

" Gruvbox Material
Plug 'sainnhe/gruvbox-material'

" Powerline Clone
Plug 'itchyny/lightline.vim'

" Support for directory navigation from vim.
Plug 'preservim/nerdtree'

" Linting support for various languages
Plug 'dense-analysis/ale'

" For adding Vadar, a test suite
Plug 'junegunn/vader.vim'

call plug#end()

" Settings for lightline
set noshowmode
set laststatus=2

" Important!! for color scheme
        if has('termguicolors')
          set termguicolors
        endif
        " For dark version.
        set background=dark
        " For light version.
        set background=light
        " Set contrast.
        " This configuration option should be placed before `colorscheme gruvbox-material`.
        " Available values: 'hard', 'medium'(default), 'soft'
        let g:gruvbox_material_background = 'soft'
        colorscheme gruvbox-material
