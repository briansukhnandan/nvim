local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
       vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<Up>"] = cmp.mapping.select_prev_item(),
    ["<Down>"] = cmp.mapping.select_next_item(),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = 'nvim_lsp_signature_help' },
    { name = "vsnip" },
    { name = "path" },
  },
})

-- Disable cmp for log files. Since buffer completion is super slow for huge
-- files
vim.api.nvim_create_autocmd({"BufEnter"}, {
  pattern = "*.log",
  callback = function ()
    if vim.bo.filetype == "log" then
      cmp.setup.buffer { enabled = false }
    end
  end}
)
