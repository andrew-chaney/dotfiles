return {
  -- add gruvbox
  { "EdenEast/nightfox.nvim" },
  { "Mofiqul/adwaita.nvim" },
  { "NLKNguyen/papercolor-theme" },
  { "Shatur/neovim-ayu" },
  { "bluz71/vim-moonfly-colors" },
  { "catppuccin/nvim" },
  { "folke/tokyonight.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "rose-pine/neovim" },
  { "sainnhe/everforest" },
  { "wittyjudge/gruvbox-material.nvim" },
  { "xero/miasma.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
