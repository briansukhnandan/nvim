local keymap = vim.keymap.set
require('gitsigns').setup()

function Map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  keymap(mode, lhs, rhs, options)
end

-- Gitsigns comes with Git Blame by default
Map(
  "n", 
  "<C-x>o", 
  "<cmd>GitBlameOpenCommitURL<cr>", 
  { desc = "Open Commit in GitLab/GitHub" }
)
