require("config.options")
require("config.keymaps")
require("config.lazy_init")

-- DO.not
-- DO NOT INCLUDE THIS

-- If i want to keep doing lsp debugging
-- function restart_htmx_lsp()
--     require("lsp-debug-tools").restart({ expected = {}, name = "htmx-lsp", cmd = { "htmx-lsp", "--level", "DEBUG" }, root_dir = vim.loop.cwd(), });
-- end

-- DO NOT INCLUDE THIS
-- DO.not

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

autocmd({"BufWritePre"}, {
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
      autocmd FileType bzl AutoFormatBuffer buildifier
      autocmd FileType c,cpp,proto,javascript,typescript,arduino AutoFormatBuffer clang-format
      autocmd FileType clojure AutoFormatBuffer cljstyle
      autocmd FileType dart AutoFormatBuffer dartfmt
      autocmd FileType elixir,eelixir,heex AutoFormatBuffer mixformat
      autocmd FileType fish AutoFormatBuffer fish_indent
      autocmd FileType gn AutoFormatBuffer gn
      autocmd FileType go AutoFormatBuffer gofmt
      autocmd FileType haskell AutoFormatBuffer ormolu
      " Alternative for web languages: prettier
      autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
      autocmd FileType java AutoFormatBuffer google-java-format
      autocmd FileType jsonnet AutoFormatBuffer jsonnetfmt
      autocmd FileType julia AutoFormatBuffer JuliaFormatter
      autocmd FileType kotlin AutoFormatBuffer ktfmt
      autocmd FileType lua AutoFormatBuffer luaformatterfiveone
      autocmd FileType markdown AutoFormatBuffer prettier
      autocmd FileType ocaml AutoFormatBuffer ocamlformat
      autocmd FileType python AutoFormatBuffer yapf
      " Alternative: autocmd FileType python AutoFormatBuffer autopep8
      autocmd FileType ruby AutoFormatBuffer rubocop
      autocmd FileType rust AutoFormatBuffer rustfmt
      autocmd FileType swift AutoFormatBuffer swift-format
      autocmd FileType vue AutoFormatBuffer prettier
    augroup END
]]

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
