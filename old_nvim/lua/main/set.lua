vim.o.background = "light" -- [light/dark for theming]
vim.opt.termguicolors = true
vim.cmd([[colorscheme nightfox]])

-- vim.opt.guicursor = "" -- for block cursor, even on INSERT

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4 -- TODO - make this dynamic by file-type
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.colorcolumn = "100"
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80" -- TODO - 120 for Java/Kotlin, 80 for others

vim.g.mapleader = " "

-- Effectively disable the use of tabs
vim.opt.showtabline = 0
vim.opt.tabs = 1
