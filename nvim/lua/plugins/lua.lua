return {
  enabled = true,
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "vimdoc", "lua", "vim" } },
  },
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "lua-language-server" } },
  },
}
