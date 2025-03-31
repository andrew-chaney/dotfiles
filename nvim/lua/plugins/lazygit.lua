return {
    "kdheepak/lazygit.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        -- Open LazyGit window
        vim.keymap.set("n", "<leader>gl", vim.cmd.LazyGit, { desc = "[G]it - [L]azyGit" })
    end
}
