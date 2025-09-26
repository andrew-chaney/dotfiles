return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    vim.keymap.set('n', '<leader>pv', "<cmd>NvimTreeToggle<CR>")
    require("nvim-tree").setup({
      hijack_netrw = true,
      auto_reload_on_write = true,
      view = {
        adaptive_size = true,
      },
    })
  end
}
