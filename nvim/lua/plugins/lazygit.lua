return {
    "kdheepak/lazygit.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        -- Open LazyGit window
        vim.keymap.set("n", "<leader>ll", vim.cmd.LazyGit)
    end
}
