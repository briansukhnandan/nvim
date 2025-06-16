require("util")
require("aerial").setup({
  on_attach = function(bufnr)
    vim.keymap.set("n", "<Up>", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "<Down>", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
  default_direction = "left",
  layout = {
    min_width = 30,
  },
})
Map("n", "<leader>a", "<cmd>AerialToggle left<CR>")
