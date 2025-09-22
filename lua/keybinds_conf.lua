local silent = { silent = true }
local keymap = vim.keymap.set

function Map(mode, keymap_to_set, command_to_run, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  keymap(mode, keymap_to_set, command_to_run, options)
end

function copy_buf_path_to_clipboard()
  local filepath = vim.fn.expand('%')
  vim.fn.setreg('+', filepath) -- write to clipboard
end

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

Map("n", "<leader>F", "1<C-g>")

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
Map("n", "<leader>yp", copy_buf_path_to_clipboard, silent)

-- Tabs (and buffers)
--
-- TL;DR
-- Tab super key (TS) -> Leader + Tab
-- TS + c -> Close Buffer
-- TS + Tab -> New Buffer
-- TS + , (or h) -> Prev Buffer
-- TS + . (or l) -> Next Buffer
Map("n", "<leader><Tab><Tab>", "<cmd>enew<cr>", { desc = "New Buffer" })
Map("n", "<leader><Tab>c", "<cmd>bd<cr>", { desc = "Close Tab" })
Map("n", "<leader><Tab>C", "<cmd>bd!<cr>", { desc = "Force Close Tab" })
Map("n", "<leader><Tab>h", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
Map("n", "<leader><Tab>l", "<cmd>bnext<cr>", { desc = "Next buffer" })
Map("n", "<leader><Tab>[", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
Map("n", "<leader><Tab>]", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Markdown preview (using `glow.nvim`)
Map("n", "<C-x>G", "<cmd>Glow<cr>", { desc = "Preview Markdown in current buffer" })

-- Glance (LSP)
Map("n", "gR", "<cmd>Glance references<cr>")
Map("n", "gD", "<cmd>Glance definitions<cr>")
Map("n", "gY", "<cmd>Glance type_definitions<cr>")
Map("n", "gM", "<cmd>Glance implementations<cr>")

-- Mason
Map("n", "<C-x>m", "<cmd>Mason<cr>")

-- <C-x>r closes all non-terminal buffers and returns to dashboard
vim.keymap.set("n", "<C-x>r", function()
  -- Get list of all listed buffers
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) then
      local bt = vim.api.nvim_buf_get_option(buf, "buftype")
      if bt == "" then
        -- normal buffer → wipe it
        vim.api.nvim_buf_delete(buf, { force = true })
      end
    end
  end

  -- Re-open dashboard
  -- Change to `DashboardNew` if dashboard.nvim changes it
  vim.cmd("Dashboard")
end, { noremap = true, silent = true, desc = "Reset Neovim to default state" })
