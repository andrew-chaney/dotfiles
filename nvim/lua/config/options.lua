-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Blink Shell on iPadOS: Cmd-. is configured as an Esc substitute
-- (Magic Keyboard lacks a physical Esc key).
--
-- Blink may send either:
--   <D-.>  - Kitty keyboard protocol event (Cmd+period as a unit)
--   <M-.>  - \e. byte sequence (ESC + period), where the bare \e would exit
--            insert mode and the trailing . would fire dot-repeat in normal
--            mode, re-inserting the last change as a phantom "extra character"
--
-- Mapping both to <Esc> is safe universally: a real Esc key sends a single
-- \x1b byte (unaffected), and neither combo has a standard insert-mode binding
-- that other clients depend on.
vim.keymap.set("i", "<D-.>", "<Esc>", { noremap = true })
vim.keymap.set("i", "<M-.>", "<Esc>", { noremap = true })
