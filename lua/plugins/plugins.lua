return {
  -- Disabling nvim-notify
  {
    "rcarriga/nvim-notify",
    enabled = false,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = false,
    },
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function ()
      require("catppuccin").setup({
        color_overrides = {
          -- Not a fan of the default frappe background color
          -- however the rest of the theming is nice.
          frappe = {
            base = "#363636",
            mantle = "#404040",
            crust = "#4d4d4d",
          },
        }
      })
    end,
  },
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
      require("scrollbar").setup({
        handle = {
          blend = 75,
          color = "#f9fcfb",
        },
        marks = {
          Cursor = {
            text = "★",
          }
        },
      })
    end,
  },

  -- Markdown Previews
  { "ellisonleao/glow.nvim", config = true, cmd = "Glow" },

  -- strictly for fun :)
  { "HiPhish/rainbow-delimiters.nvim" },

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
