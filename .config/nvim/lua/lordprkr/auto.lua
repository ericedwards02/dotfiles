vim.api.nvim_create_augroup("__formatter__", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*",
  group = "__formatter__",
  command = ":FormatWrite",
})
