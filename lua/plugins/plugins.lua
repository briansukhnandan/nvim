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

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "vertical",
        layout_config = {
          vertical = {
            preview_cutoff = 0,
          },
        },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },
}
