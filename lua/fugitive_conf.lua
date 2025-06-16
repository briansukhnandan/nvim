require("util")

-- Fugitive (Git)
Map("n", "<C-x>g", "<cmd>Git<cr>", { desc = "Launch Vim Fugitive" })
vim.api.nvim_create_user_command('Gp', 'G push', {})
vim.api.nvim_create_user_command('Gpf', 'G push --force', {})
vim.api.nvim_create_user_command('Grc', 'G rebase --continue', {})
vim.api.nvim_create_user_command('Gra', 'G rebase --abort', {})
