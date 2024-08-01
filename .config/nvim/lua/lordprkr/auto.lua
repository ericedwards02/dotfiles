local formatGroup = vim.api.nvim_create_augroup("FormatAutoGroup", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*",
  group = formatGroup,
  command = "FormatWrite",
})
