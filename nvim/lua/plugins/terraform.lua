return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "terraform" } },
  },
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "terraform-ls", "tflint", "tfsec" } },
  },
}
