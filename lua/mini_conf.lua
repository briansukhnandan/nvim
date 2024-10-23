require('mini.pairs').setup()
require('mini.comment').setup()
require('mini.indentscope').setup()

vim.api.nvim_create_autocmd("FileType", {
  desc = "Disable indentscope for certain filetypes",
  pattern = {
    "mason",
    "toggleterm",
    "dashboard",
    "telescope",
  },
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})
