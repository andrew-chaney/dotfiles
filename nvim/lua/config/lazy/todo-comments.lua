return {
    "folke/todo-comments.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        require("todo-comments").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
        vim.keymap.set("n", "<leader>pt", vim.cmd.TodoTelescope)
        vim.keymap.set("n", "<leader>tt", vim.cmd.TodoLocList)
    end
}
