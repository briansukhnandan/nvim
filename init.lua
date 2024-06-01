-- Please note - colorscheme is set inside of catppuccin_conf, as 
-- it needs to be set after the config is loaded.

-- Plugin configurations
require("nvim_conf")
require("keybinds_conf")
require("dashboard_conf")
require("telescope_conf")
require("harpoon_conf")
require("scrollbar_conf")
require("catppuccin_conf")
require("treesitter_conf")
require("cmp_conf")
require("mason_conf")
require("neotree_conf")
require("lualine_conf")
require("toggleterm_conf")

-- Out of the box plugins
require('gitsigns').setup()
require('glow').setup()
require("fidget").setup()
