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

if vim.g.neovide then
  vim.g.neovide_scale_factor = 0.75
  vim.g.neovide_input_macos_alt_is_meta = true
  vim.g.neovide_window_blurred = true
  vim.g.neovide_cursor_vfx_mode = "torpedo"

  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(1.25)
  end)
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1/1.25)
  end)
end
