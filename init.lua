-- Please note - colorscheme is set inside of catppuccin_conf, as 
-- it needs to be set after the config is loaded.

-- Plugin configurations
require("nvim_conf")
require("keybinds_conf")
require("dashboard_conf")
require("telescope_conf")
require("colorscheme_conf")
require("treesitter_conf")
require("scrollbar_conf")
require("cmp_conf")
require("mason_conf")
require("neotree_conf")
require("lualine_conf")
require("terminal_conf")
require("mini_conf")
require("gitsigns_conf")
require("html_autotag_conf")

-- Out of the box plugins
require('glow').setup()
require("fidget").setup()

-- Disabled (for now)
-- require("catppuccin_conf")
