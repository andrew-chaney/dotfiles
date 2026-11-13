return {
  enabled = true,
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "tofu" } },
  },
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "tofu-ls" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tofu_ls = {},
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        opentofu = { "tofu_fmt" },
        ["opentofu-vars"] = { "tofu_fmt" },
        terraform = { "tofu_fmt" },
        ["terraform-vars"] = { "tofu_fmt" },
      },
    },
  },
}
