local shortcuts = require("shortcuts").my_custom_shortcuts

vim.g.mapleader = ","

vim.g.colors_name = "sonokai"
vim.opt.background = "dark"

vim.o.termguicolors = true
vim.opt.guicursor = "i:block"

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2

vim.cmd("set number relativenumber")
vim.cmd("set nowrap")
vim.cmd("set mouse=n")
-- Using <leader>b will show all buffers, you can select a num and hit enter
vim.cmd("nnoremap <Leader>b :ls<CR>:b<Space>")

vim.cmd("nnoremap " .. shortcuts.new_tab .. " <cmd>tabnew<cr>")
vim.cmd("nnoremap " .. shortcuts.next_tab .. " <cmd>tabnext<cr>")
vim.cmd("nnoremap " .. shortcuts.prev_tab .. " <cmd>tabprev<cr>")
vim.cmd("nnoremap " .. shortcuts.close_tab .. " <cmd>tabc<cr>")
vim.cmd("nnoremap <leader>ff :DiffviewOpen<cr>")
vim.cmd("nnoremap <leader>F :DiffviewClose<cr>")
vim.cmd("nnoremap E :Explore<cr>")

vim.cmd("nnoremap <leader>n :NERDTreeToggle<cr>")
vim.cmd("nnoremap <leader>N :NERDTreeFind<cr>")

-- paste from system clipboard
vim.cmd("nnoremap <leader>pc :r !pbpaste<cr>")

-- Neovim comes with a default typescript indentation plugin:
-- https://github.com/jason0x43/vim-js-indent. The plugin behaves super weirdly
-- for comments. It is apparently trying to do prosaic indentation where the
-- first line of a paragraph is indented by 2 spaces. I don't know why anyone
-- would want this and it makes it very difficult to write markdown in
-- typescript comments, so I'm disabling it. The default vim indentation
-- behavior from the days of vi / C is just fine for Javascript and Typescript.
vim.cmd [[
  augroup noindent
    autocmd Filetype javascript,javascriptreact,typescript,typescriptreact set indentexpr=
  augroup END
]]
