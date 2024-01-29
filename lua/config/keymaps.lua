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

-- Don't yank on delete char in normal mode.
-- We still want to retain in visual.
Map("n", "x", '"_x', silent)
Map("n", "X", '"_X', silent)

-- Remove highlights
Map("n", "<ESC>", ":noh<CR><CR>", silent)

-- Tabs (and buffers)
--
-- TL;DR
-- Tab super key (TS) -> Leader + Tab
-- TS + c -> Close Buffer
-- TS + Tab -> New Buffer
-- TS + , (or h) -> Prev Buffer
-- TS + . (or l) -> Next Buffer
Map("n", "<leader><Tab>c", "<cmd>bd<cr>", { desc = "Close Tab" })
Map("n", "<leader><Tab>h", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
Map("n", "<leader><Tab>l", "<cmd>bnext<cr>", { desc = "Next buffer" })
Map("n", "<leader><Tab>[", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
Map("n", "<leader><Tab>]", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Markdown preview (using `glow.nvim`)
Map("n", "<leader>md", "<cmd>Glow<cr>", { desc = "Preview Markdown in current buffer" })

-- Fugitive (Git)
Map("n", "<leader>gg", "<cmd>Git<cr>", { desc = "Launch Vim Fugitive" })

-- Glance (LSP)
Map("n", "<leader>gr", "<cmd>Glance references<cr>")
Map("n", "<leader>gd", "<cmd>Glance definitions<cr>")
Map("n", "<leader>gy", "<cmd>Glance type_definitions<cr>")
Map("n", "<leader>gm", "<cmd>Glance implementations<cr>")
