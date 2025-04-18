return {
    "ThePrimeagen/harpoon",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        vim.keymap.set("n", "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>")
        vim.keymap.set("n", "<TAB>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>")
    end
}
