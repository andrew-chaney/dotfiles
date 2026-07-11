-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Blink Shell on iPadOS: Cmd-. is configured as an Esc substitute
-- (Magic Keyboard lacks a physical Esc key).
--
-- Blink may send either:
--   <D-.>  - Kitty keyboard protocol event (Cmd+period as a unit)
--   <M-.>  - \e. byte sequence (ESC + period) delivered close enough together
--            that Neovim recognizes it as a single meta keypress
--
-- Both of those map cleanly to <Esc>. But over Mosh/SSH latency the \e and the
-- trailing . can arrive far enough apart that ttimeoutlen expires first: the
-- bare \e leaves insert mode and the . is then processed in normal mode as
-- dot-repeat, re-running the last change (e.g. re-inserting what you just typed
-- or pasted at the cursor). The mappings below cannot catch that split case
-- because Neovim never sees <M-.> as a unit.
--
-- To cover the split case, swallow a phantom . (or stray <CR>) that lands
-- immediately after dropping to normal mode. This happens whenever Cmd-. is
-- used as Esc - leaving insert mode, but also leaving visual / V-LINE / visual-
-- block, where the trailing . likewise fires dot-repeat in normal mode.
-- getchar(0) is non-blocking, so this only consumes a key already queued within
-- a few ms of the mode change - a real Esc keypress by a human leaves nothing
-- pending, so legitimate input is untouched.
vim.keymap.set("i", "<D-.>", "<Esc>", { noremap = true })
vim.keymap.set("i", "<M-.>", "<Esc>", { noremap = true })

vim.api.nvim_create_autocmd("ModeChanged", {
  -- i:n   leaving insert
  -- v:n   leaving charwise visual
  -- V:n   leaving V-LINE
  -- \22:n leaving visual-block (\22 == <C-v>)
  pattern = { "i:n", "v:n", "V:n", "\22:n" },
  callback = function()
    vim.defer_fn(function()
      local char = vim.fn.getchar(0)
      -- 46 = '.', 13 = <CR>: phantom characters Blink can append after Esc.
      if char == 46 or char == 13 then
        -- Swallow it.
        return
      elseif char ~= 0 then
        -- A real keypress: feed it back so nothing is lost.
        vim.api.nvim_feedkeys(vim.fn.nr2char(char), "m", false)
      end
    end, 10)
  end,
})

vim.opt.clipboard = "unnamedplus"

-- Blink Shell: to allow for copy and paste while within the shell over Mosh
if vim.env.SSH_TTY or vim.env.SSH_CONNECTION then
  local osc52 = require("vim.ui.clipboard.osc52")
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = osc52.copy("+"),
      ["*"] = osc52.copy("*"),
    },
    paste = {
      ["+"] = osc52.paste("+"),
      ["*"] = osc52.paste("*"),
    },
  }
end
