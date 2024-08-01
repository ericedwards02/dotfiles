require("wrapping").setup({
  create_commands = true,
  create_keymaps = true,
  notify_on_switch = true,
  auto_set_mode_filetype_allowlist = {
    "asciidoc",
    "gitcommit",
    "latex",
    "mail",
    "markdown",
    "rst",
    "tex",
    "text",
    "markdown.mdx",
  },
  softener = {
    ["markdown.mdx"] = true,
  },
})
