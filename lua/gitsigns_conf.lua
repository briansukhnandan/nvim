require("util")
require('gitsigns').setup()

-- This is a super handy one, opens up the MR on GitLab/Github
-- for the current line you're on
Map(
  "n",
  "<C-x>o",
  "<cmd>GitBlameOpenCommitURL<cr>", 
  { desc = "Open Commit in GitLab/GitHub" }
)
