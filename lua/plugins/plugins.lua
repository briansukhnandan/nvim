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

  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = false,
    },
  },

  { "Mofiqul/dracula.nvim" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-frappe",
    },
  },

  -- Git Blame
  { "f-person/git-blame.nvim" },

  -- HTML auto-close / auto-rename
  { "windwp/nvim-ts-autotag" },

  -- Scrollbar
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup()
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader><space>f",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Find File",
      },
      {
        "<leader><space>g",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Live Grep",
      },
      {
        "<leader><space>b",
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
