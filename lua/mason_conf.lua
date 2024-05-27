local apply_shortcut = require("util").apply_shortcut

local opts = { noremap = true, silent = true }
apply_shortcut('n', "[d", vim.diagnostic.goto_prev, opts)
apply_shortcut('n', "]d", vim.diagnostic.goto_next, opts)

local on_attach = function(_, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  apply_shortcut('n', "gd", vim.lsp.buf.definition, bufopts)
  apply_shortcut('n', "gr", vim.lsp.buf.references, bufopts)
  apply_shortcut('n', "K", vim.lsp.buf.hover, bufopts)
  apply_shortcut('n', "<Space>cr", vim.lsp.buf.rename, bufopts)

  vim.keymap.set(
    "n", 
    "[w", 
    "<Cmd>lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })<CR>"
  )

  vim.keymap.set(
    "n", 
    "]w", 
    "<Cmd>lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })<CR>"
  )

  vim.keymap.set(
    "n", 
    "[e", 
    "<Cmd>lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })<CR>"
  )

  vim.keymap.set(
    "n", 
    "]e", 
    "<Cmd>lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })<CR>"
  )
end

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  },
})

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls", 
    "rust_analyzer",
    "pyright",
    "tsserver"
  },
})

local lspconfig = require('lspconfig')
lspconfig.pyright.setup({
  on_attach = on_attach,
})
lspconfig.tsserver.setup({
  on_attach = on_attach,
})
lspconfig.lua_ls.setup({
  on_attach = on_attach,
})

vim.cmd("nnoremap <Space>cm <cmd>Mason<cr>")
