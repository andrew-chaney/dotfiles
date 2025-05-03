return {
    'stevearc/conform.nvim',
    opts = {},
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format { async = true, lsp_fallback = true }
            end,
            mode = "",
        }
    },
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
            }
        })
    end
}
