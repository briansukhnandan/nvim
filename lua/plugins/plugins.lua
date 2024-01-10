return {
  -- For now disabling nvim-notify
  {
    "rcarriga/nvim-notify",
    enabled = false,
    -- opts = {
    --   level = 3,
    --   render = "minimal",
    --   stages = "static",
    -- },
  },

  -- Set default colorscheme to dracula.
  { "Mofiqul/dracula.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },
}
