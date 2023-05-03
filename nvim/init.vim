" The goods (basic edition)
set exrc
set undodir=~/.vim/undodir
set undofile
set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set colorcolumn=80
set signcolumn=yes
set mouse=a

" Give more space for displaying messages.
set cmdheight=2

" Having longer update time (default 4000 ms = 4 s) leads to noticeable
" delays and poor UX feel
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

"""""""""""""""""""""" START PLUGS """"""""""""""""""""""
call plug#begin('~/.vim/plugged')
" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" File Tree
Plug 'preservim/nerdtree'

" More Colorschemes
Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'catppuccin/nvim', {'name': 'catppuccin'}
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sainnhe/everforest'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'rmehri01/onenord.nvim', { 'branch': 'main' }
Plug 'wdhg/dragon-energy'
Plug 'EdenEast/nightfox.nvim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'chriskempson/base16-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'jacoborus/tender.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'ayu-theme/ayu-vim'

" LSP Support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" Metal LSP for Scala
Plug 'scalameta/nvim-metals'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" Auto-Pair Matching
Plug 'andymass/vim-matchup'
Plug 'jiangmiao/auto-pairs'

" Allows for MD previewing inside of Neovim
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" Jupyter Notebook (*.ipynb) Extension
Plug 'untitled-ai/jupyter_ascending.vim'

" orgmode extensions
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-orgmode/orgmode'

call plug#end()
""""""""""""""""""""""" END PLUGS """""""""""""""""""""""

highlight Normal guibg=none

" mode lhs rhs
let mapleader = " "
"nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

fun! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup MY_AUTOGROUP
    autocmd!
    autocmd BufWritePre * :call TrimWhiteSpace()
augroup END

" Vim Airline Settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

nmap <leader>x :bdelete<Enter>
nmap <leader>f :NERDTree<Enter>

" orgmode Configuration Script
lua << EOF
require('orgmode').setup_ts_grammar()

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'},
  },
  ensure_installed = {'org'},
}

require('orgmode').setup({
  org_agenda_files = '~/Documents/Notes/org/*',
  org_default_notes_file = '~/Documents/Notes/org/todos.org',
})
EOF

" Colorscheme, obviously the most important part of programming...
colorscheme catppuccin
