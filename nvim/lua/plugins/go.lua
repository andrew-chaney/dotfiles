return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "go" } },
  },
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "gopls", "goimports", "gotests" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              buildFlags = { "-tags=integration" },
            },
          },
        },
      },
    },
  },
}
