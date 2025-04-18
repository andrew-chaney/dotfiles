return {
    "elixir-tools/elixir-tools.nvim",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local elixir = require("elixir")
        local elixirls = require("elixir.elixirls")

        elixir.setup {
            nextls = { enable = true },
            elixirls = {
                enable = true,
                settings = elixirls.settings {
                    dialyzerEnabled = false,
                    enableTestLenses = false,
                },
                on_attach = function(_client, _bufnr)
                    vim.keymap.set("n", "<space>efp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true, desc = "[E]lixir [F]rom [P]ipe" })
                    vim.keymap.set("n", "<space>etp", ":ElixirToPipe<cr>", { buffer = true, noremap = true, desc = "[E]lixir [T]o [P]ipe" })
                    vim.keymap.set("v", "<space>eem", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true, desc = "[E]lixir [E]xpand [M]acro" })
                end,
            },
            projectionist = {
                enable = true
            }
        }
    end,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
}
