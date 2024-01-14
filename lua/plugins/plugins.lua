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

  -- Git Blame
  { "f-person/git-blame.nvim" },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>tf",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Find File",
      },
      {
        "<leader>tg",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Live Grep",
      },
      {
        "<leader>tb",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Telescope buffers",
      },
    },
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
