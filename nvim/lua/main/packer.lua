-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- use {
  --   'codota/tabnine-nvim',
  --   run = './dl_binaries.sh'
  -- }

  -- Colorschemes
  use('bluz71/vim-moonfly-colors')
  use('catppuccin/nvim')
  use('EdenEast/nightfox.nvim')
  use('folke/tokyonight.nvim')
  use('Mofiqul/adwaita.nvim')
  use('rebelot/kanagawa.nvim')
  use('rose-pine/neovim')
  use('sainnhe/everforest')
  use('sainnhe/gruvbox-material')
  use('xero/miasma.nvim')
  use('NLKNguyen/papercolor-theme')
  use('Shatur/neovim-ayu')

  -- Workflows
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  -- LSP
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  -- Python Linting
  use({
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
        require("null-ls").setup()
    end,
    requires = { "nvim-lua/plenary.nvim" },
  })

  -- Go Support
  use('fatih/vim-go')


  -- Linting it up
  -- use('schrieveslaach/sonarlint.nvim')

  -- Obsidian Plugin
  -- use({
  --     "epwalsh/obsidian.nvim",
  --     tag = "*",  -- recommended, use latest release instead of latest commit
  --     requires = {
  --         -- Required.
  --         "nvim-lua/plenary.nvim",

  --     },
  --     config = function()
  --         require("obsidian").setup({
  --             workspaces = {
  --                 {
  --                     name = "personal",
  --                     path = "/mnt/c/Users/andre/OneDrive/Documents/notes",
  --                 },
  --                 -- {
  --                 --     name = "work",
  --                 --     path = "~/vaults/work",
  --                 -- },
  --             },

  --         })
  --     end,
  -- })

  use('rstacruz/vim-closer')

end)
