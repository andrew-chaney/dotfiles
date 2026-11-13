return {
  enabled = true,
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "python" } },
  },
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "ruff", "pyproject-fmt" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = { enabled = false },
        pyright = { enabled = false },
        ty = {
          cmd = { "uv", "run", "--all-packages", "ty", "server" },
          root_markers = { "uv.lock", "ty.toml", "pyproject.toml", ".git" },
        },
      },
    },
  },
}
