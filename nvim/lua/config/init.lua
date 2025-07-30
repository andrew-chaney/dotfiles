require("config.options")
require("config.keymaps")
require("config.lazy_init")

local augroup = vim.api.nvim_create_augroup
local ConfigGroup = augroup('ConfigGroup', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.filetype.add({
    extension = {
        templ = 'templ',
    }
})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({ "BufWritePre" }, {
    group = ConfigGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})


autocmd('LspAttach', {
    group = ConfigGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})

vim.cmd [[
    augroup jdtls_lsp
        autocmd!
        autocmd FileType java lua require'config.jdtls'.setup_jdtls()
    augroup end
]]

vim.cmd [[
    augroup autoformat_settings
      autocmd FileType java AutoFormatBuffer google-java-format
    augroup END
]]

autocmd("FileType", {
    pattern = "html",
    callback = function()
        vim.bo.expandtab   = true -- spaces instead of tabs :contentReference[oaicite:2]{index=2}
        vim.bo.shiftwidth  = 2    -- how many spaces to use for each step of (auto)indent :contentReference[oaicite:3]{index=3}
        vim.bo.softtabstop = 2    -- number of spaces that a <Tab> counts for while editing :contentReference[oaicite:4]{index=4}
        vim.bo.tabstop     = 2    -- number of spaces that a <Tab> in the file counts for :contentReference[oaicite:5]{index=5}
    end,
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
