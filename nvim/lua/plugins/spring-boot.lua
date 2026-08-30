return {
  enabled = false,
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "vscode-spring-boot-tools" })
    end,
  },
}
