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
autocmd BufRead,BufNewFile *.jl set colorcolumn=93 " none shall pass 93
autocmd BufRead,BufNewFile *.jl set tabstop=4       " Set tabstops to a width of four columns.
autocmd BufRead,BufNewFile *.jl set softtabstop=4   " Determine the behaviour of TAB and BACKSPACE keys with expandtab.
autocmd BufRead,BufNewFile *.jl set shiftwidth=4    " Determine the results of >>, <<, and ==.

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

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary'

Plug 'sheerun/vim-polyglot'
Plug 'lluchs/vim-wren'
Plug 'ollykel/v-vim'
Plug 'lervag/vimtex'
Plug 'rsmenon/vim-mathematica'
" Julia support for vim.
Plug 'JuliaEditorSupport/julia-vim'
Plug 'kdheepak/JuliaFormatter.vim'

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

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ray-x/cmp-treesitter'

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
set completeopt=menu,menuone,noselect

" For ultisnips users.
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

autocmd FileType mma setlocal commentstring=(*\ %s\ *) 

let g:sonokai_style = 'maia'
colorscheme gruvbox-material

lua <<EOF
    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufopts)
    end
    local lsp_flags = {
      -- This is the default in Nvim 0.7+
      debounce_text_changes = 150,
      }

  -- Setup nvim-cmp.
  local cmp = require'cmp'
  local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings") -- for ultisnips remappings

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = false}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<Tab>"] = cmp.mapping( -- ultisnips tab to go to next field mapping
          function(fallback)
            cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
          end,
          { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
        ),
        ["<S-Tab>"] = cmp.mapping(
          function(fallback)
            cmp_ultisnips_mappings.jump_backwards(fallback)
          end,
          { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
        )
    }),
    sources = cmp.config.sources({
      { name = 'treesitter' },
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

  local lsp_installer = require("nvim-lsp-installer")
  lsp_installer.on_server_ready(
    function(server)
    local opts = {on_attach = on_attach}
    server:setup(opts)
    end)
EOF
