vim.cmd("set number relativenumber")

-- I use space for leader
vim.g.mapleader = ' '
vim.o.cursorline = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2

vim.cmd("set noswapfile")
vim.cmd("set nowrap")
vim.cmd("set splitbelow")
vim.cmd("set clipboard=unnamedplus")

-- For rust, but by default nvim doesn't
-- respect tab settings. This disables that
-- behavior.
vim.g.rust_recommended_style = false

if vim.g.neovide then
  vim.g.neovide_scale_factor = 0.75
  vim.g.neovide_input_macos_option_key_is_meta = 'only_left'
  vim.g.neovide_window_blurred = true
  vim.g.neovide_cursor_vfx_mode = "torpedo"

  -- Neovide specific keybinds
  -- Paste insert ctrl+shift+v or command+v
  vim.keymap.set('i', '<sc-v>', '<C-R>+', {noremap = true})
  vim.keymap.set('i', '<D-v>', '<C-R>+', {noremap = true})

  -- Paste in terminal mode with ctrl+shift+v
  vim.keymap.set('t', '<sc-v>', '<C-\\><C-n>"+Pi', {noremap = true})

  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(1.05)
  end)
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1/1.05)
  end)
end


local silent = { silent = true }
--
-- Leave terminal mode with ESC
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Disables arrow keys in Normal mode 
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")

-- Disables moving to Left/Right buffers with Shift+h/l
vim.keymap.set("n", "H", "<Nop>")
vim.keymap.set("n", "L", "<Nop>")

-- Don't yank on delete char in normal mode.
-- We still want to retain in visual.
vim.keymap.set("n", "x", '"_x', silent)
vim.keymap.set("n", "X", '"_X', silent)

-- I also don't like yanking when deleting.
vim.keymap.set("n", "d", '"_d', silent)

-- Remove highlights
vim.keymap.set("n", "<ESC>", ":noh<CR><CR>", silent)

vim.keymap.set("n", "<leader>F", "1<C-g>")

-- Scrolling - Personally I think 5 lines down is 
-- reasonable esp when scrubbing through large files.
vim.keymap.set("n", "<A-j>", "<C-e> 5<C-e>")
vim.keymap.set("n", "<A-k>", "<C-y> 5<C-y>")

-- Yanks the path of the current buffer and stores
-- in the system clipboard
function copy_buf_path_to_clipboard()
  local filepath = vim.fn.expand('%')
  vim.fn.setreg('+', filepath) -- write to clipboard
end
vim.keymap.set("n", "<leader>yp", copy_buf_path_to_clipboard, silent)

-- Tabs (and buffers)
--
-- TL;DR
-- Tab super key (TS) -> Leader + Tab
-- TS + c -> Close Buffer
-- TS + Tab -> New Buffer
-- TS + , (or h) -> Prev Buffer
-- TS + . (or l) -> Next Buffer
vim.keymap.set("n", "<leader><Tab><Tab>", "<cmd>enew<cr>", { desc = "New Buffer" })
vim.keymap.set("n", "<leader><Tab>c", "<cmd>bd<cr>", { desc = "Close Tab" })
vim.keymap.set("n", "<leader><Tab>C", "<cmd>bd!<cr>", { desc = "Force Close Tab" })
vim.keymap.set("n", "<leader><Tab>h", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<leader><Tab>l", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader><Tab>[", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<leader><Tab>]", "<cmd>bnext<cr>", { desc = "Next buffer" })

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

--[[
--
-- Terminal configs
--
--]]

local terminals = {}

local function goto_term(n)
  -- Terminal exists at n → switch to it
  if terminals[n] and vim.api.nvim_buf_is_valid(terminals[n]) then
    vim.api.nvim_set_current_buf(terminals[n])
    vim.notify("Switched to terminal " .. n, vim.log.levels.INFO)
  else
    -- Create a new terminal
    vim.cmd("enew")
    vim.cmd("term")
    local buf = vim.api.nvim_get_current_buf()
    terminals[n] = buf

    -- Give terminal buffer pleasant name
    vim.api.nvim_buf_set_name(buf, "Terminal " .. n)
    vim.notify("Created terminal " .. n, vim.log.levels.INFO)
  end
end

-- <leader>+1 -> <leader>+9
for i = 1, 9 do
  vim.keymap.set(
    "n",
    "<leader>" .. i,
    function() goto_term(i) end,
    { desc = "Go to/create terminal " .. i }
  )
end

--[[
--
-- Window Management configs
--
--]]

-- I think that <C-w> is awkward for splits,
-- so I prefer to use comma
local VIM_WINDOW_LEADER = ","
vim.keymap.set('n', VIM_WINDOW_LEADER, '<C-w>', {noremap = true})
