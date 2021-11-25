" vi is old
set nocompatible

set nohlsearch
set hidden
set incsearch
set scrolloff=10
set spelllang=en_us
set nobackup
set nowritebackup
set number

" Begin Julia Styling
setlocal expandtab       " Replace tabs with spaces.
autocmd BufRead,BufNewFile *.jl set textwidth=92    " Limit lines according to Julia's CONTRIBUTING guidelines.
set colorcolumn=93 " none shall pass 93
set tabstop=4       " Set tabstops to a width of four columns.
set softtabstop=4   " Determine the behaviour of TAB and BACKSPACE keys with expandtab.
set shiftwidth=4    " Determine the results of >>, <<, and ==.
" End Julia Styling

runtime macros/matchit.vim

" Begin Vim plugins
call plug#begin('~/.vim/plugged')

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'JuliaEditorSupport/julia-vim'
Plug 'kdheepak/JuliaFormatter.vim'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'lluchs/vim-wren'
Plug 'ollykel/v-vim'
Plug 'lervag/vimtex'
Plug 'sainnhe/gruvbox-material'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'christoomey/vim-tmux-navigator' " tmux navigation
Plug 'preservim/vimux' " For adding commands from vim to bash
Plug 'dense-analysis/ale' " Linting support for various languages

call plug#end()

" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>

colorscheme gruvbox-material

" ale completion
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
let g:ale_completion_max_suggestions = 20

let g:completion_chain_complete_list = { 'default' : { 'default' : [ {'complete_items' : ['lsp', 'snippet']}, {'mode' : 'file'} ], 'comment' : [], 'string' : [] } }
