return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "python" } },
  },
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "ty", "basedpyright", "ruff", "pyproject-fmt" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ty = {
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("uv.lock", "ty.toml", ".git")(fname)
          end,
        },
      },
    },
  },
}
