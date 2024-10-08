-- require("catppuccin").setup({
--   color_overrides = {
--     -- Not a fan of the default frappe background color
--     -- however the rest of the theming is nice.
--     frappe = {
--       base = "#363636",
--       mantle = "#404040",
--       crust = "#4d4d4d",
--     },
--   },
-- })
-- Colorscheme needs to be set after config for it to take effect
-- vim.cmd("colorscheme catppuccin-frappe")

require('onedark').setup {
  style = 'warm',
  toggle_style_key = "<C-x>tt",
  toggle_style_list = {'warm', 'light'}, -- List of styles to toggle between
}
require('onedark').load()
