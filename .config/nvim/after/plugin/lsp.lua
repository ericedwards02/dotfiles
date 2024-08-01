local lsp = require("lsp-zero")

lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
  end, opts)
  vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover()
  end, opts)
  vim.keymap.set("n", "<leader>vws", function()
    vim.lsp.buf.workspace_symbol()
  end, opts)
  vim.keymap.set("n", "<leader>d", function()
    vim.diagnostic.open_float()
  end, opts)
  vim.keymap.set("n", "[d", function()
    vim.diagnostic.goto_next()
  end, opts)
  vim.keymap.set("n", "]d", function()
    vim.diagnostic.goto_prev()
  end, opts)
  vim.keymap.set("n", "<leader>ca", function()
    vim.lsp.buf.code_action()
  end, opts)
  vim.keymap.set("i", "<C-h>", function()
    vim.lsp.buf.signature_help()
  end, opts)
end)

lsp.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ["lua_ls"] = { "lua" },
    ["rust_analyzer"] = { "rust" },
  },
})

require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = { "tsserver", "eslint", "rust_analyzer", "gopls" },
  handlers = {
    lsp.default_setup,
    lua_ls = function()
      local lua_opts = lsp.nvim_lua_ls()
      require("lspconfig").lua_ls.setup(lua_opts)
    end,
    hls = function() end,
  },
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
  ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
  ["<C-f>"] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  sources = {
    { name = "path" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip", keyword_length = 2 },
    { name = "buffer",  keyword_length = 3 },
  },
  formatting = lsp.cmp_format(),
  mapping = cmp_mappings,

  lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
      error = "E",
      warn = "W",
      hint = "H",
      info = "I",
    },
  }),
})

-- Haskell Tools setup
vim.g.haskell_tools = {
  hls = {
    capabilities = lsp.get_capabilities(),
  },
  tools = {
    repl = {
      handler = "toggleterm",
    },
    log = {
      level = vim.log.levels.DEBUG,
    },
  },
}

-- Autocmd that will actually be in charging of starting hls
local hls_augroup = vim.api.nvim_create_augroup("haskell-lsp", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = hls_augroup,
  pattern = { "haskell" },
  callback = function()
    ---
    -- Suggested keymaps from the quick setup section:
    -- https://github.com/mrcjkb/haskell-tools.nvim#quick-setup
    ---

    local ht = require("haskell-tools")
    local bufnr = vim.api.nvim_get_current_buf()
    local def_opts = { noremap = true, silent = true, buffer = bufnr }
    -- haskell-language-server relies heavily on codeLenses,
    -- so auto-refresh (see advanced configuration) is enabled by default
    vim.keymap.set("n", "<leader>hca", vim.lsp.codelens.run, def_opts)
    -- Hoogle search for the type signature of the definition under the cursor
    -- vim.keymap.set("n", "<space>hs", ht.hoogle.hoogle_signature, opts)
    -- Evaluate all code snippets
    vim.keymap.set("n", "<leader>hea", ht.lsp.buf_eval_all, def_opts)
    -- Toggle a GHCi repl for the current package
    vim.keymap.set("n", "<leader>hrr", ht.repl.toggle, def_opts)
    -- Toggle a GHCi repl for the current buffer
    -- vim.keymap.set("n", "<leader>hrf", function()
    --   ht.repl.toggle(vim.api.nvim_buf_get_name(0))
    -- end, def_opts)
    -- vim.keymap.set("n", "<leader>rq", ht.repl.quit, opts)
  end,
})
