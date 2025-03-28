return {
    "mbbill/undotree",
    config = function()
        -- Toggle Undotree window
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end
}
