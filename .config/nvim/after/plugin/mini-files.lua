require("mini.files").setup({
  mappings = {
    go_in = "<leader><CR>",
    go_in_plus = "<cr>",
    go_out = "<leader>-",
    go_out_plus = "-",
  },
  windows = {
    preview = true,
    width_focus = 50,
    width_preview = 50,
  },
})

vim.keymap.set("n", "<leader>pv", function()
  if not MiniFiles.close() then
    MiniFiles.open(vim.api.nvim_buf_get_name(0))
  end
end)
