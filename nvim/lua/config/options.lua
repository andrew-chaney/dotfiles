-- Left column and similar settings
vim.opt_local.number = true         -- display line numbers
vim.opt_local.relativenumber = true -- display relative line numbers
vim.opt_local.numberwidth = 2       -- set width of line number column
vim.opt_local.signcolumn = "yes"    -- always show sign column
vim.opt_local.wrap = false          -- display lines as single line
vim.opt_local.scrolloff = 10        -- number of lines to keep above/below cursor
vim.opt_local.sidescrolloff = 8     -- number of columns to keep to the left/right of cursor

-- Tab spacing/behavior
vim.opt.expandtab = true         -- convert tabs to spaces
vim.opt_local.shiftwidth = 4     -- number of spaces inserted for each indentation level
vim.opt_local.tabstop = 4        -- number of spaces inserted for tab character
vim.opt_local.softtabstop = 4    -- number of spaces inserted for <Tab> key
vim.opt_local.smartindent = true -- enable smart indentation
vim.opt_local.breakindent = true -- enable line breaking indentation

-- General behaviors
vim.opt_local.backup = false            -- disable backup file creation
vim.opt_local.clipboard = "unnamedplus" -- enable system clipboard access
vim.opt_local.conceallevel = 0          -- so that `` is visible in markdown files
vim.opt_local.fileencoding = "utf-8"    -- set file encoding to UTF-8
vim.opt_local.mouse = "a"               -- enable mouse support
vim.opt_local.showmode = false          -- hide mode display
vim.opt_local.splitbelow = true         -- force horizontal splits below current window
vim.opt_local.splitright = true         -- force vertical splits right of current window
vim.opt_local.termguicolors = true      -- enable term GUI colors
vim.opt_local.timeoutlen = 1000         -- set timeout for mapped sequences
vim.opt_local.undofile = true           -- enable persistent undo
vim.opt_local.updatetime = 100          -- set faster completion
vim.opt_local.writebackup = false       -- prevent editing of files being edited elsewhere
vim.opt_local.cursorline = true         -- highlight current line
vim.opt_local.colorcolumn = "80"        -- set suggested wrap line

-- Searching behaviors
vim.opt_local.hlsearch = true   -- highlight all matches in search
vim.opt_local.ignorecase = true -- ignore case in search
vim.opt_local.smartcase = true  -- match case if explicitly stated

-- Effectively disable tabs
vim.opt_local.showtabline = 0 -- never show line with tab page labels
