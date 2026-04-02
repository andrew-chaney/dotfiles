return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "python" } },
  },
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "pyright", "ruff", "isort", "pyproject-fmt" } },
  },
}
