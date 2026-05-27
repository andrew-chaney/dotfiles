-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Fix for Blink Shell + iPadOS adding a newline on Cmd-.
vim.keymap.set("i", "<D-.>", function()
  -- Drop to normal mode
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)

  -- Clear the next keypress if it happens to be the accidental Enter key
  vim.defer_fn(function()
    local char = vim.fn.getchar(0)
    -- 13 is the ASCII code for Carriage Return (Enter)
    if char == 13 then
      -- Do nothing, effectively swallowing the phantom newline
    elseif char > 0 then
      -- If it was a legitimate keypress instead, feed it back to Neovim
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(vim.fn.nr2char(char), true, false, true), "m", false)
    end
  end, 10) -- 10ms delay is enough to capture the trailing iPadOS sequence
end, { desc = "Fix Blink Shell Cmd-. newline bug" })
