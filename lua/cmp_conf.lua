local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
       vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  -- We want to disable when inside of prompts or in comments
  enabled = function()
    local context = require("cmp.config.context")
    local inside_of_comment = context.in_treesitter_capture("comment")
    local inside_of_logfile = vim.bo.filetype == "log"

    local buftype = vim.api.nvim_buf_get_option(0, "buftype")
    local filetype = vim.bo.filetype

    -- Disable in neotree/Telescope
    local is_prompt = buftype == "prompt"
    local is_neotree_popup = filetype == "neo-tree-popup" or filetype == "neo-tree"

    return not inside_of_comment and not inside_of_logfile and not is_prompt and not is_neotree_popup
  end,
  mapping = {
    ["<Up>"] = cmp.mapping.select_prev_item(),
    ["<Down>"] = cmp.mapping.select_next_item(),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({
      select = true,
    }),
    ['<C-e>'] = cmp.mapping.abort(),
    ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = 'nvim_lsp_signature_help' },
    { name = "vsnip" },
    { name = "path" },
  }, {
    { name = 'buffer' },
  })
})
