local toggleterm = require('toggleterm')
local map = require("util").map

toggleterm.setup{
  hide_numbers = true,
  start_in_insert = false,
  insert_mappings = false,
  auto_scroll = true, -- automatically scroll to the bottom on terminal output
  open_mapping = [[<C-`>]],
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
}

-- Exit Terminal mode
-- vim.keymap.set(
--   "t",
--   "<esc>",
--   [[<C-x>z]],
--   { silent = true }
-- )
Map("t", "<C-x>z", "<C-\\><C-n>")
