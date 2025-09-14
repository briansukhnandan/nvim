-- Ensure lazy.nvim is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Eye Candy / UI
  { "nvim-tree/nvim-web-devicons" },
  { "MunifTanjim/nui.nvim" },
  {
    "stevearc/oil.nvim",
    cmd = { "Oil" },
    keys = {
      { "-", "<cmd>Oil<CR>", desc = "Launch Oil", mode = { "n" } }
    },
    config = function ()
      local actions = require("oil.actions")
      require("oil").setup({
        default_file_explorer = true,
        delete_to_trash = true,
        view_options = {
          show_hidden = true,
        },
        is_always_hidden = function(name, _)
          return name == '..' or name == '.git'
        end,
        keymaps = {
          ["gd"] = {
            desc = "Toggle file detail view",
            callback = function()
              detail = not detail
              if detail then
                require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
              else
                require("oil").set_columns({ "icon" })
              end
            end,
          },
          ['<C-p>'] = {
            callback = function()
              -- We use oil.actions to get "toggle" functionality
              actions.preview.callback({ vertical = true, split = "botright" })
            end,
          },
        },
      })
    end
  },
  {
    "navarasu/onedark.nvim",
    event = "VimEnter", -- load on startup
    config = function()
    require("onedark").setup({
      style = "warm",
      toggle_style_key = "<C-x>tt",
      toggle_style_list = { "warm", "light" }, -- List of styles to toggle between
    })
    require("onedark").load()
  end,
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",  -- load dashboard on startup
    config = function()
      local logo = [[
   _________        .__               
  \______  \_______|__|____    ____  
    |    |  _/\_  __ \  \__  \  /    \  
    |    |   \ |  | \/  |/ __ \|   |  \ 
    |______  / |__|  |__(____  /___|  / 
          \/                \/     \/ 
  ]]

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
          -- stylua: ignore
          center = {
            {
              action = "Telescope find_files",
              desc = " Find file",
              icon = " ",
              key = "f",
            },
            {
              action = "Telescope live_grep",
              desc = " Find text",
              icon = " ",
              key = "g",
            },
          },
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      require("dashboard").setup(opts)
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      -- Dracula colors
      local colors = {
        bg       = "#282a36",
        fg       = "#f8f8f2",
        yellow   = "#f1fa8c",
        cyan     = "#8be9fd",
        darkblue = "#6272a4",
        green    = "#50fa7b",
        orange   = "#ffb86c",
        purple   = "#bd93f9",
        red      = "#ff5555",
      }

      local theme = {
        normal = {
          a = { fg = colors.bg, bg = colors.purple, gui = "bold" },
          b = { fg = colors.fg, bg = colors.darkblue },
          c = { fg = colors.fg, bg = colors.bg },
        },
        insert = {
          a = { fg = colors.bg, bg = colors.green, gui = "bold" },
          b = { fg = colors.fg, bg = colors.darkblue },
          c = { fg = colors.fg, bg = colors.bg },
        },
        visual = {
          a = { fg = colors.bg, bg = colors.orange, gui = "bold" },
          b = { fg = colors.fg, bg = colors.darkblue },
          c = { fg = colors.fg, bg = colors.bg },
        },
        replace = {
          a = { fg = colors.bg, bg = colors.red, gui = "bold" },
          b = { fg = colors.fg, bg = colors.darkblue },
          c = { fg = colors.fg, bg = colors.bg },
        },
        command = {
          a = { fg = colors.bg, bg = colors.yellow, gui = "bold" },
          b = { fg = colors.fg, bg = colors.darkblue },
          c = { fg = colors.fg, bg = colors.bg },
        },
        inactive = {
          a = { fg = colors.fg, bg = colors.bg, gui = "bold" },
          b = { fg = colors.fg, bg = colors.bg },
          c = { fg = colors.fg, bg = colors.bg },
        },
      }

      require("lualine").setup({
        options = {
          theme = theme,
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { { "filename", path = 1 } },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { { "filename", path = 1 } },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
      })
    end,
  },
  {
    "petertriho/nvim-scrollbar",
    lazy = false,
    config = function ()
      require("scrollbar").setup({
        handle = {
          blend = 75,
          color = "#acafaf",
        },
        marks = {
          Cursor = {
            text = "ಠ_ಠ",
          },
        },
      })
    end
  },

  -- Utilities
  { "nvim-lua/plenary.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "Telescope" },
    keys = {
      { "<leader><leader>f", "<cmd>Telescope find_files<CR>", desc = "Telescope Find Files" },
      { "<leader><leader>g", "<cmd>Telescope live_grep<CR>", desc = "Telescope Live Grep" },
      { "<leader><leader>b", "<cmd>Telescope buffers<CR>", desc = "Telescope Buffers" },
      { "<leader><leader>j", "<cmd>Telescope jumplist<CR>", desc = "Telescope Jumplist" },
      { "<leader><leader>o", "<cmd>Telescope oldfiles<CR>", desc = "Telescope Oldfiles" },
      { "<leader><leader>c", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Telescope Current Buffer" },
    },
    config = function()
      local actions = require("telescope.actions")
      require("telescope").setup({
        defaults = {
          layout_strategy = "vertical",
          layout_config = {
            vertical = { preview_cutoff = 0 },
          },
          mappings = {
            n = { ["<c-d>"] = actions.delete_buffer },
            i = { ["<c-d>"] = actions.delete_buffer },
          },
          preview = { treesitter = false },
          file_ignore_patterns = {
            "node_modules",
            "^.git",
            "^.next"
          },
        },
        pickers = {
          find_files = { hidden = true },
          colorscheme = { enable_preview = true },
        },
      })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    keys = {
      { "<C-x>o", "<cmd>GitBlameOpenCommitURL<cr>", desc = "Open commit in GitLab/GitHub" },
    },
    config = function ()
      require('gitsigns').setup()
    end
  },
  {
    "echasnovski/mini.nvim",
    version = false, -- use latest
    lazy = false,
    config = function()
      require("mini.pairs").setup()
      require("mini.comment").setup()
      require("mini.indentscope").setup()
      require("mini.tabline").setup()

      local colors = { "🔴", "🟠", "🟡", "🟢", "🔵", "🟣" }
      local buffer_to_emoji_map = {}
      math.randomseed(os.time())
      require("mini.tabline").setup({
        tabpage_section = "left",
        format = function(bufnr, label)
          label = (label and label ~= "") and label or "[No Name]"

          -- assign a random emoji to this buffer if not already assigned
          if not buffer_to_emoji_map[bufnr] then
            buffer_to_emoji_map[bufnr] = colors[math.random(#colors)]
          end

          return " " .. buffer_to_emoji_map[bufnr] .. " " .. label
        end,
      })

      -- Disable indentscope for certain filetypes
      vim.api.nvim_create_autocmd("FileType", {
        desc = "Disable indentscope for certain filetypes",
        pattern = {
          "mason",
          "dashboard",
          "telescope",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
  { "f-person/git-blame.nvim" },
  {
    "justinmk/vim-sneak",
    lazy = false
  },
  {
    "j-hui/fidget.nvim",
    config = function ()
      require("fidget").setup()
    end
  },
  {
    "ellisonleao/glow.nvim",
    config = function ()
      require("glow").setup()
    end
  },

  -- Git
  {
    "tpope/vim-fugitive",
    -- Lazy-load on any of the main fugitive commands
    cmd = { "Git", "G", "Gpush", "Gcommit", "Gdiff" },
    keys = {
      { "<C-x>g", "<cmd>Git<CR>", desc = "Launch Vim Fugitive" },
    },
    config = function()
      -- Convenience user commands
      vim.api.nvim_create_user_command("Gp", "G push", {})
      vim.api.nvim_create_user_command("Gpf", "G push --force", {})
      vim.api.nvim_create_user_command("Grc", "G rebase --continue", {})
      vim.api.nvim_create_user_command("Gra", "G rebase --abort", {})
    end,
  },

  -- LSP / Completion
  { "dnlhc/glance.nvim" },
  {
    "stevearc/aerial.nvim",
    -- Load when the toggle command is called or on buffer read
    cmd = { "AerialToggle", "AerialOpen", "AerialClose" },
    event = "BufReadPre",
    config = function()
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
      vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle left<CR>", { desc = "Toggle Aerial" })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
    },
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { "lua", "python", "javascript", "typescript", "rust" },
        highlight = { enable = true },
        indent = { enable = true },
      })

      require('treesitter-context').setup({
        enable = true,
        line_numbers = true,
        multiline_threshold = 3,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- Global diagnostic shortcuts
      local global_opts = { noremap = true, silent = true }
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, global_opts)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, global_opts)

      -- LSP on_attach function
      local on_attach = function(_, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }

        local mappings = {
          gd = vim.lsp.buf.definition,
          gr = vim.lsp.buf.references,
          gi = vim.lsp.buf.implementation,
          K  = vim.lsp.buf.hover,

          ["<leader>ca"] = vim.lsp.buf.code_action,
          ["<leader>cr"] = vim.lsp.buf.rename,

          ["[w]"] = function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN }) end,
          ["]w"] = function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN }) end,

          ["[e]"] = function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end,
          ["]e"] = function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end,
        }

        for key, fn in pairs(mappings) do
          vim.keymap.set("n", key, fn, bufopts)
        end
      end

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Mason setup
      require("mason").setup({
        ui = { icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" } }
      })

      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "rust_analyzer", "pyright", "ts_ls" },
      })

      local lspconfig = require("lspconfig")

      -- Configure LSP servers
      lspconfig.pyright.setup({ capabilities = capabilities, on_attach = on_attach })
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        init_options = { maxTsServerMemory = 10000 },
      })
      lspconfig.lua_ls.setup({ capabilities = capabilities, on_attach = on_attach })
      lspconfig.rust_analyzer.setup({ capabilities = capabilities, on_attach = on_attach })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        enabled = function()
          local context = require("cmp.config.context")
          local inside_comment = context.in_treesitter_capture("comment")
          local inside_log = vim.bo.filetype == "log"

          local buftype = vim.api.nvim_buf_get_option(0, "buftype")
          local filetype = vim.bo.filetype
          local is_prompt = buftype == "prompt"
          local is_neotree = filetype == "neo-tree-popup" or filetype == "neo-tree"

          return not inside_comment
            and not inside_log
            and not is_prompt
            and not is_neotree
        end,
        mapping = {
          ["<Up>"] = cmp.mapping.select_prev_item(),
          ["<Down>"] = cmp.mapping.select_next_item(),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "nvim_lsp_signature_help" },
          { name = "vsnip" },
          { name = "path" },
        }, {
          { name = "buffer" },
        }),
      })

      -- Cmdline completions
      -- `/` and `?` = search from buffer
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" }
        }
      })

      -- `:` = commands + file paths
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" }
        }, {
          { name = "cmdline" }
        })
      })
    end,
  }
})
