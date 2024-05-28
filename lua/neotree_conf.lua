require("neo-tree").setup({
  filesystem = {
    follow_current_file = {
      enabled = true
    }
  }
})
vim.cmd("nnoremap <Space>e <cmd>Neotree toggle<cr>")
