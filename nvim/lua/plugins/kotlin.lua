-- Referenced https://www.lazyvim.org/extras/lang/kotlin
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "kotlin" } },
  },
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "ktlint", "kotlin-debug-adapter", "kotlin-lsp" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        kotlin_lsp = {
          capabilities = {
            textDocument = {
              completion = {
                completionItem = {
                  snippetSupport = false,
                },
              },
            },
          },
        },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = { kotlin = { "ktlint" } },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = { kotlin = { "ktlint" } },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.formatting.ktlint,
        nls.builtins.diagnostics.ktlint,
      })
    end,
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require("dap")
      if not dap.adapters.kotlin then
        dap.adapters.kotlin = {
          type = "executable",
          command = "kotlin-debug-adapter",
          options = { auto_continue_if_many_stopped = false },
        }
      end
      dap.configurations.kotlin = {
        {
          type = "kotlin",
          request = "launch",
          name = "This file",
          mainClass = function()
            local root = vim.fs.find("src", { path = vim.uv.cwd(), upward = true, stop = vim.env.HOME })[1] or ""
            local fname = vim.api.nvim_buf_get_name(0)
            return fname:gsub(root, ""):gsub("main/kotlin/", ""):gsub(".kt", "Kt"):gsub("/", "."):sub(2, -1)
          end,
          projectRoot = "${workspaceFolder}",
          jsonLogFile = "",
          enableJsonLogging = false,
        },
        {
          type = "kotlin",
          request = "attach",
          name = "Attach to debugging session",
          port = 5005,
          args = {},
          projectRoot = vim.fn.getcwd,
          hostName = "localhost",
          timeout = 2000,
        },
      }
    end,
  },
}
