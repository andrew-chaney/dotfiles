return {
  enabled = true,
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "terraform" } },
  },
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "terraform-ls", "tflint", "tfsec" } },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        terraform = { "terraform_fmt" },
        ["terraform-vars"] = { "terraform_fmt" },
      },
    },
  },
}
