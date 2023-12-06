vim.cmd("source $HOME/.config/nvim/plugins.vim")

require("nvim") -- nvim specific
require("catppuccin_conf") --------------- very configurable color scheme
require("treesitter") -------------------- language parser; try :TSPlaygroundToggle!
require("telescope_conf") ---------------- telescope is a pop-up search tool
require("lsp_conf") ---------------------- languages server protocol
require("cmp_conf") ---------------------- neovim-cmp (completion suggestions)
require("statusline") -------------------- status line at the bottom of the UI
require("scrollbar_conf") ---------------- scrollbar

require("nvim-ts-autotag").setup() ------- autotagging
require("nvim-autopairs").setup() -------- autopairs (brackets)

require("gitsigns").setup() -------------- Gitsigns 
