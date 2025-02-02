local toggleterm = require('toggleterm')

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

vim.api.nvim_create_user_command('TT', '1ToggleTerm', {})
