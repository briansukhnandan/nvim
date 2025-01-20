require("util")

local silent = { silent = true }

-- Leave terminal mode with ESC
Map("t", "<Esc>", "<C-\\><C-n>")

-- Disables arrow keys in Normal mode 
Map("n", "<Left>", "<Nop>")
Map("n", "<Up>", "<Nop>")
Map("n", "<Down>", "<Nop>")
Map("n", "<Right>", "<Nop>")

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

Map("n", "<Space>F", "1<C-g>")

-- Scrolling - Personally I think 5 lines down is 
-- reasonable esp when scrubbing through large files.
-- 
-- I find it comfortable to use W and S for associativity 
-- with moving up/down since I play games, so I use alt + w/s 
-- for scrolling 5.
Map("n", "<A-j>", "<C-e> 5<C-e>")
Map("n", "<A-k>", "<C-y> 5<C-y>")

-- Yanks the path of the current buffer and stores
-- in the system clipboard
Map("n", "<Space>yp", copy_buf_path_to_clipboard, silent)

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
Map("n", "<Space><Tab>C", "<cmd>bd!<cr>", { desc = "Force Close Tab" })
Map("n", "<Space><Tab>h", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
Map("n", "<Space><Tab>l", "<cmd>bnext<cr>", { desc = "Next buffer" })
Map("n", "<Space><Tab>[", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
Map("n", "<Space><Tab>]", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Markdown preview (using `glow.nvim`)
Map("n", "<C-x>G", "<cmd>Glow<cr>", { desc = "Preview Markdown in current buffer" })

-- Glance (LSP)
Map("n", "gR", "<cmd>Glance references<cr>")
Map("n", "gD", "<cmd>Glance definitions<cr>")
Map("n", "gY", "<cmd>Glance type_definitions<cr>")
Map("n", "gM", "<cmd>Glance implementations<cr>")

-- Neotree
Map("n", "<Space>e", "<cmd>Neotree toggle<cr>")

-- Mason
Map("n", "<C-x>m", "<cmd>Mason<cr>")
