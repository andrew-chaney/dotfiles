-- Leader keymapping
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remove search highlights after searching
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlights" })

-- Exit Vim's terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Movement functions
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines while keeping cursor position" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move half-page down and center cursor" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move half-page up and center cursor" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Jump to next search match and center cursor" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Jump to previous search match and center cursor" })

-- Exit Vim's insert mode
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Exit insert mode (alternative to Esc)" })

