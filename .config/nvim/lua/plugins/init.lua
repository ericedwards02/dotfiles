return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    -- or                            , branch = '0.1.x',
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "nvim-treesitter/playground",
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  "mbbill/undotree",
  "mhartington/formatter.nvim",

  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },          -- Required
      { "williamboman/mason.nvim" },        -- Optional
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },  -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "L3MON4D3/LuaSnip" },  -- Required
      { "hrsh7th/cmp-nvim-lua" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
    },
  },

  "windwp/nvim-autopairs",
  "windwp/nvim-ts-autotag",

  { "nvim-lualine/lualine.nvim",       dependencies = { "nvim-tree/nvim-web-devicons", lazy = true } },
  { "L3MON4D3/LuaSnip",                dependencies = { "rafamadriz/friendly-snippets" } },
  "saadparwaiz1/cmp_luasnip",

  {
    "mrcjkb/haskell-tools.nvim",
    version = "^3",
    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
  },

  {
    "kylechui/nvim-surround",
    version = "*",
  },

  "tpope/vim-fugitive",

  "numToStr/Comment.nvim",

  "Wansmer/treesj",

  { "kevinhwang91/nvim-bqf", ft = "qf" },

  { "folke/trouble.nvim",    dependencies = { "nvim-tree/nvim-web-devicons" } },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },

  {
    "smjonas/inc-rename.nvim",
  },

  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

  { "echasnovski/mini.nvim",                    version = "*" },

  "andrewferrier/wrapping.nvim",

  { "stevearc/dressing.nvim" },

  "lewis6991/gitsigns.nvim",
  { "catppuccin/nvim",         name = "catppuccin", priority = 1000 },

  { "mistricky/codesnap.nvim", build = "make" },

  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  },
}
