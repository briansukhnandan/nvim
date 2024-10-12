vim.cmd("source $HOME/.config/nvim/plugins.vim")
vim.cmd("set number relativenumber")

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
  vim.g.neovide_input_macos_alt_is_meta = true
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
