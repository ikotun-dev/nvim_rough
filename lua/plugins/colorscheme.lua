return {
  { "ellisonleao/gruvbox.nvim" },
  -- { "dracula/vim" },
  -- { "EdenEast/nightfox.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "olimorris/onedarkpro.nvim" },
  -- { "luisiacc/gruvbox-baby" },
  -- { "ellisonleao/gruvbox.nvim" },
  -- { "ramojus/mellifluous.nvim" },
  -- { "ribru17/bamboo.nvim" },
  -- { "Mofiqul/dracula.nvim" },
  { "folke/tokyonight.nvim" },
  -- { "zootedb0t/citruszest.nvim" },
  -- { "w0ng/vim-hybrid" },
  -- { "vv9k/vim-github-dark" },
  -- { "Tsuzat/NeoSolarized.nvim" },
  -- { "craftzdog/solarized-osaka.nvim" },
  -- { "marko-cerovac/material.nvim" },
  -- { "projekt0n/github-nvim-theme" },
  -- { "Mofiqul/adwaita.nvim" },
  -- { "sekke276/dark_flat.nvim" },
  -- { "LunarVim/darkplus.nvim" },
  -- { "ronisbr/nano-theme.nvim" },
  -- { "srcery-colors/srcery-vim" },
  -- { "askfiy/visual_studio_code" },
  -- {
  --   "gmr458/vscode_modern_theme.nvim",
  -- },
  { "Shatur/neovim-ayu" },
  -- { "sainnhe/sonokai" },
  -- { "sainnhe/everforest" },
  -- { "sainnhe/edge" },
  { "sainnhe/gruvbox-material" },
  -- { "sainnhe/forest-night" },
  -- { "sainnhe/edge" },
  { "ayu-theme/ayu-vim" },
  { "mofiqul/vscode.nvim" },
  -- { "lunacookies/vim-colors-xcode" },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
      })
    end,
  },
  {
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("monokai-pro").setup()
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}
