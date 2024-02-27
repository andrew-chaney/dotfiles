return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- azure_pipelines_ls = {},
        bashls = {},
        bicep = {},
        clangd = {},
        -- gopls = {},
        helm_ls = {},
        marksman = {},
        powershell_es = {},
        -- pyright will be automatically installed with mason and loaded with lspconfig
        -- pyright = {},
        terraformls = {},
        yamlls = {},
      },
    },
  },
}
