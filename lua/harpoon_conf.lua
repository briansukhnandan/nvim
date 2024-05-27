vim.keymap.set(
  "n", 
  "<Space>hm", 
  '<Cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>'
)

vim.keymap.set(
  "n", 
  "<Space>ha", 
  '<Cmd>lua require("harpoon.mark").add_file()<CR>'
)

vim.keymap.set(
  "n", 
  "<Space>hn", 
  '<Cmd>lua require("harpoon.ui").nav_next()<CR>'
)

vim.keymap.set(
  "n", 
  "<Space>hp", 
  '<Cmd>lua require("harpoon.ui").nav_prev()<CR>'
)
