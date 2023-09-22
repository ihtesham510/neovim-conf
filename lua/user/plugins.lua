local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- Install your plugins here
require("lazy").setup({
  {
    "nvim-lua/plenary.nvim"
  },
  {
    "windwp/nvim-autopairs"
  },
  {
    "numToStr/Comment.nvim"
  },
  {
    "kyazdani42/nvim-web-devicons"
  },
  {
    "kyazdani42/nvim-tree.lua",
    lazy = false
  },
  {
    "akinsho/bufferline.nvim"
  },
  {
    "moll/vim-bbye"
  },
  {

    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = {

      "nvim-treesitter/nvim-treesitter",
    }
  },
  {
    "nvim-lualine/lualine.nvim",
    lazy = false
  },
  {
    "akinsho/toggleterm.nvim"
  },

  {
    "ahmedkhalf/project.nvim"
  },
  {
    "lewis6991/impatient.nvim"
  },
  {
    "lukas-reineke/indent-blankline.nvim"
  },
  {
    "goolord/alpha-nvim"
  },
  {
    "folke/which-key.nvim"
  },
  {
    -- colorschemes
    "folke/tokyonight.nvim",
    "lunarvim/darkplus.nvim",
    "bluz71/vim-nightfly-colors",
    "rebelot/kanagawa.nvim",
    "Mofiqul/vscode.nvim",
    "navarasu/onedark.nvim",
    "glepnir/oceanic-material",
    "marcopaganini/termschool-vim-theme",
    "TheNiteCoder/mountaineer.vim",
    "dikiaap/minimalist",
    "dasupradyumna/midnight.nvim",
    "Shatur/neovim-ayu"
  },
  {
    -- cmp
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua"
    },
    -- colorizer
    {
      "NvChad/nvim-colorizer.lua"
    },
    {
      "L3MON4D3/LuaSnip",

      dependencies = {
        "rafamadriz/friendly-snippets"
      }
    },
    {
      -- Lsp
      "williamboman/mason.nvim",
      "williamboman/mason.nvim",
      dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "jose-elias-alvarez/null-ls.nvim",
        "RRethy/vim-illuminate",
      }
    },
    {
      {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        dependencies = {
          -- LSP Support
          { "neovim/nvim-lspconfig" },         -- Required
          { "williamboman/mason.nvim" },       -- Optional
          { "williamboman/mason-lspconfig.nvim" }, -- Optional

          -- Autocompletion
          { "hrsh7th/nvim-cmp" }, -- Required
          { "hrsh7th/cmp-nvim-lsp" }, -- Required
          { "L3MON4D3/LuaSnip" }, -- Required
        },
      }
    },
    {
      "nvim-telescope/telescope.nvim",
      dependencies = {

        "nvim-telescope/telescope-file-browser.nvim"
      }
    },
    {

      "simrat39/symbols-outline.nvim",
    },
    {
      "lewis6991/gitsigns.nvim"
    }
  }
})
