local keymap = vim.keymap.set
local silent = { silent = true }

function Map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  keymap(mode, lhs, rhs, options)
end

-- Disables arrow keys in Normal mode 
Map("n", "<Left>", "<Nop>")
Map("n", "<Up>", "<Nop>")
Map("n", "<Down>", "<Nop>")
Map("n", "<Right>", "<Nop>")

-- Controls regarding splits
-- \ is my substitute for C-w.
-- - Split horizontal/vertical -> \h or \v
-- - Resizing - Same controls as vim except <C-w> -> \
-- - Move between splits -> \ + Arrow keys
Map("n", "\\sh", "<cmd>sp<cr>")
Map("n", "\\sv", "<cmd>vsp<cr>")
Map("n", "\\=", "<cmd>resize +2<cr>")
Map("n", "\\-", "<cmd>resize -2<cr>")
Map("n", "\\.", "<cmd>vertical resize +2<cr>")
Map("n", "\\,", "<cmd>vertical resize -2<cr>")
Map("n", "\\j", "<C-w>j")
Map("n", "\\k", "<C-w>k")
Map("n", "\\h", "<C-w>h")
Map("n", "\\l", "<C-w>l")

-- Disables moving to Left/Right buffers with Shift+h/l
Map("n", "H", "<Nop>")
Map("n", "L", "<Nop>")

-- Don't yank on delete char in normal mode.
-- We still want to retain in visual.
Map("n", "x", '"_x', silent)
Map("n", "X", '"_X', silent)

-- I also don't like yanking when deleting.
Map("n", "d", '"_d', silent)

-- Remove highlights
Map("n", "<ESC>", ":noh<CR><CR>", silent)

-- Alternative: Ctrl+c escapes insert mode.
Map("i", "<C-c>", "<ESC>", silent)

-- Scrolling - Personally I think 5 lines down is 
-- reasonable esp when scrubbing through large files.
-- 
-- I find it comfortable to use W and S for associativity 
-- with moving up/down since I play games, so I use alt + w/s 
-- for scrolling 5.
--
-- I also don't really mind ctrl+e/y for scrolling which is 
-- the default vim scroll bindings so i use alt+e/y for 
-- scrolling 3.
Map("n", "<A-j>", "<C-e> 5<C-e>")
Map("n", "<A-k>", "<C-y> 5<C-y>")

Map("n", "<A-e>", "<C-e> 3<C-e>")
Map("n", "<A-y>", "<C-y> 3<C-y>")


-- Tabs (and buffers)
--
-- TL;DR
-- Tab super key (TS) -> Leader + Tab
-- TS + c -> Close Buffer
-- TS + Tab -> New Buffer
-- TS + , (or h) -> Prev Buffer
-- TS + . (or l) -> Next Buffer
Map("n", "<Space><Tab><Tab>", "<cmd>enew<cr>", { desc = "New Buffer" })
Map("n", "<Space><Tab>c", "<cmd>bd<cr>", { desc = "Close Tab" })
Map("n", "<Space><Tab>h", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
Map("n", "<Space><Tab>l", "<cmd>bnext<cr>", { desc = "Next buffer" })
Map("n", "<Space><Tab>[", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
Map("n", "<Space><Tab>]", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Markdown preview (using `glow.nvim`)
Map("n", "<Space>md", "<cmd>Glow<cr>", { desc = "Preview Markdown in current buffer" })

-- Fugitive (Git)
Map("n", "<Space>gg", "<cmd>Git<cr>", { desc = "Launch Vim Fugitive" })

-- Glance (LSP)
Map("n", "gR", "<cmd>Glance references<cr>")
Map("n", "gD", "<cmd>Glance definitions<cr>")
Map("n", "gY", "<cmd>Glance type_definitions<cr>")
Map("n", "gM", "<cmd>Glance implementations<cr>")

-- Goes to the matching grouping (Shift+5)
Map("n", "M", "%")

-- MISC --

-- Random nick nacks i have for day to day.
-- The below makes a basic JS/TS group comment block
-- and leaves in insert mode
Map("n", "tsc", "i/****/")
