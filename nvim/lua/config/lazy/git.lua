return {
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({})

            vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", { desc="[G]it Preview [H]unk" })
        end
     },
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gb", ":Git blame<cr>")
            vim.keymap.set("n", "<leader>gA", ":Git add .<cr>")
            vim.keymap.set("n", "<leader>ga", "Git add")
            vim.keymap.set("n", "<leader>gc", ":Git commit")
            vim.keymap.set("n", "<leader>gp", ":Git push")
            vim.keymap.set("n", "<leader>gP", ":Git pull --rebase")
        end
    },
    {
        "kdheepak/lazygit.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            vim.keymap.set("n", "<leader>gl", vim.cmd.LazyGit)
        end
    },
}
