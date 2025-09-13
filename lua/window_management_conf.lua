-- I think that <C-w> is awkward for splits,
-- so I prefer to use comma
local VIM_WINDOW_LEADER = ","

vim.keymap.set('n', VIM_WINDOW_LEADER, '<C-w>', {noremap = true})

vim.keymap.set('n', VIM_WINDOW_LEADER .. "J", '5<C-w>-', {noremap = true})
vim.keymap.set('n', VIM_WINDOW_LEADER .. "K", '5<C-w>+', {noremap = true})

vim.keymap.set('n', VIM_WINDOW_LEADER .. "H", '5<C-w><', {noremap = true})
vim.keymap.set('n', VIM_WINDOW_LEADER .. "L", '5<C-w>>', {noremap = true})
