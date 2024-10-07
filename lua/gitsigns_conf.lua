local keymap = vim.keymap.set
require('gitsigns').setup()
local map = require("util").map

-- Gitsigns comes with Git Blame by default
Map(
  "n", 
  "<C-x>o", 
  "<cmd>GitBlameOpenCommitURL<cr>", 
  { desc = "Open Commit in GitLab/GitHub" }
)
