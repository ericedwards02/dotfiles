-- require("ayu").setup({
--   mirage = true, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
--   overrides = {}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
-- })
-- vim.cmd([[colorscheme ayu]])

-- require("onedark").setup({
--   style = "darker",
-- })
-- require("onedark").load()

-- vim.g.edge_style = "aura"
-- vim.g.edge_better_performance = 1
-- vim.cmd([[colorscheme edge]])
--
require("catppuccin").setup({
  term_colors = true,
  color_overrides = {
    mocha = {
      base = "#202023",
      mantle = "#202023",
      crust = "#2c2e34",
    },
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    harpoon = true,
    mini = {
      enabled = true,
      indentscope_color = "",
    },
    noice = true,
    telescope = true,
    treesitter = true,
  },
})

vim.cmd([[colorscheme catppuccin]])
