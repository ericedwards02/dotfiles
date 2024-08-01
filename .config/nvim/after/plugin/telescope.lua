require("telescope").setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules",
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case",    -- or "ignore_case" or "respect_case"
    },
  },
})

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>pf", function()
  MiniFiles.close()
  builtin.find_files()
end, {})
vim.keymap.set("n", "<C-p>", function()
  MiniFiles.close()
  builtin.git_files()
end, {})
vim.keymap.set("n", "<leader>ps", function()
  MiniFiles.close()
  builtin.live_grep()
end, {})
vim.keymap.set("n", "<leader>ph", function()
  MiniFiles.close()
  builtin.command_history()
end, {})

require("telescope").load_extension("fzf")
