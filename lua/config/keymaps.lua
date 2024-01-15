-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap.set
local silent = { silent = true }
local expr_opts = { expr = true, silent = true }

function Map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  keymap(mode, lhs, rhs, options)
end

-- Don't yank on delete char
Map("n", "x", '"_x', silent)
Map("n", "X", '"_X', silent)
Map("v", "x", '"_x', silent)
Map("v", "X", '"_X', silent)

-- Remove highlights
Map("n", "<ESC>", ":noh<CR><CR>", silent)

-- Tabs
Map("n", "<leader>nt", "<cmd>tabnew<cr>", { desc = "New Tab" }) -- Default is leader-tab-tab
Map("n", "<C-x><Right>", "<cmd>tabnext<cr>", { desc = "Next Tab" })
Map("n", "<C-x><Left>", "<cmd>tabprev<cr>", { desc = "Previous Tab" })
Map("n", "<leader><Tab>c", "<cmd>bd<cr>", { desc = "Close Tab" })
