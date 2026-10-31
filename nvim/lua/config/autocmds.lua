-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd([[%s/\s\+$//e]])
    vim.api.nvim_win_set_cursor(0, pos)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "kotlin",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
    -- ktlint has high JVM startup cost; disable auto-format on save
    vim.b.autoformat = false
  end,
})

----- A tragedy.
-----
----- Every time I closed nvim it seemed that kotlin-lsp was mishandling the cache.
----- If there was no cache present it would build one no problem the first time,
----- but on each subsequent opening of nvim it would never connect to the cache
----- and just continuously try to initialize the project. The following is a brute
----- workaround that explicitly stops the kotlin-lsp client on shutdown and cleans
----- up stale kotlin-lsp processes/workspaces on startup.

local function kotlin_lsp_cleanup()
  -- kotlin-lsp doesn't support multiple sessions; kill any lingering processes
  -- and remove workspace locks so the next session can start cleanly
  vim.fn.system("pkill -f 'kotlinLsp' 2>/dev/null")
  local locks = vim.fn.glob(vim.fn.expand("~/.cache/kotlin-lsp-workspaces/*/.app.lock"), false, true)
  for _, lock in ipairs(locks) do
    os.remove(lock)
  end
end

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = kotlin_lsp_cleanup,
})

-- Also clean up on startup in case of a prior crash
vim.api.nvim_create_autocmd("FileType", {
  pattern = "kotlin",
  once = true,
  callback = kotlin_lsp_cleanup,
})
