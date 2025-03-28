return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        vim.keymap.set('n', '<leader>pv', "<cmd>NvimTreeToggle<CR>", { desc = "Toggle [P]roject [V]iew" })
        require("nvim-tree").setup({
            hijack_netrw = true,
            auto_reload_on_write = true,
        })
    end,
}
