-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')

    use({
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    })

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

    -- LSP
    use({
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
    })

    -- Java
    use({
        'nvim-java/nvim-java',
        requires = {
            'nvim-java/lua-async-await',
            'nvim-java/nvim-java-core',
            'nvim-java/nvim-java-test',
            'nvim-java/nvim-java-dap',
            'MunifTanjim/nui.nvim',
            'neovim/nvim-lspconfig',
            'mfussenegger/nvim-dap',
            {
                'williamboman/mason.nvim',
                opts = {
                    registries = {
                        'github:nvim-java/mason-registry',
                        'github:mason-org/mason-registry',
                    }
                }
            }
        }
    })

    -- LazyGit
    use({
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })

    -- Todo Comment Highlighting
    use({
        "folke/todo-comments.nvim",
        requires = {
            "nvim-lua/plenary.nvim"
        },
        config = function()
            require("todo-comments").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    })

    -- Python Linting
    use({
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            require("null-ls").setup()
        end,
        requires = { "nvim-lua/plenary.nvim" },
    })

    use('rstacruz/vim-closer')

    use({
        "cappyzawa/trim.nvim",
        config = function()
            require("trim").setup({})
        end
    })

end)
