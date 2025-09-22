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
      local detail = false

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
          ["="] = actions.select.callback,
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
              -- Toggle file preview
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
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("colorizer").setup({
        "*", -- highlight all filetypes
        css = { css = true },
        html = { names = true },
      }, {
        mode = "background",
        RRGGBBAA = true,
        rgb_fn = true,
        hsl_fn = true,
        names = false,
      })

      -- Keybinding to toggle colorizer globally
      vim.keymap.set("n", "<C-c>ct", "<cmd>ColorizerToggle<CR>", {
        noremap = true,
        silent = true,
        desc = "Toggle colorizer",
      })
    end,
  },

  -- Utilities
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    cmd = { "Telescope" },
    keys = {
      { "<leader><leader>f", "<cmd>Telescope find_files<CR>", desc = "Telescope Find Files" },
      { "<leader><leader>g", "<cmd>Telescope live_grep<CR>", desc = "Telescope Live Grep" },
      { "<leader><leader>b", "<cmd>Telescope buffers<CR>", desc = "Telescope Buffers" },
      { "<leader><leader>j", "<cmd>Telescope jumplist<CR>", desc = "Telescope Jumplist" },
      { "<leader><leader>o", "<cmd>Telescope oldfiles<CR>", desc = "Telescope Oldfiles" },
      { "<leader><leader>m", "<cmd>Telescope marks<CR>", desc = "Telescope Marks" },
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
    lazy = false,
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

      local minimap = require("mini.map")
      minimap.setup({
        integrations = nil,
        symbols = {
          encode = minimap.gen_encode_symbols.dot("4x2"),
        },
        window = {
          width = 4,
          show_integration_count = false,
        },
      })

      vim.keymap.set("n", "<C-m>mo", minimap.open,   { desc = "Open minimap" })
      vim.keymap.set("n", "<C-m>mc", minimap.close,  { desc = "Close minimap" })
      vim.keymap.set("n", "<C-m>mt", minimap.toggle, { desc = "Toggle minimap" })
      vim.keymap.set("n", "<C-m>mf", minimap.toggle_focus, { desc = "Toggle minimap focus" })
      vim.keymap.set("n", "<C-m>mr", minimap.refresh, { desc = "Refresh minimap" })

      vim.api.nvim_create_autocmd("BufEnter", {
        callback = function(args)
          local ft = vim.bo[args.buf].filetype
          local ignore = { "lazy", "help" }
          if not vim.tbl_contains(ignore, ft) then
            MiniMap.open()
          end
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
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    keys = {
      { "<C-g>o", "<cmd>GitBlameOpenCommitURL<cr>", desc = "Open commit in GitLab/GitHub" },
      { "<C-g>s", "<cmd>GitBlameCopySHA<cr>", desc = "Copy SHA hash of current line's commit" },
      { "<C-g>u", "<cmd>GitBlameCopyCommitURL<cr>", desc = "Copy URL of current line's commit" },
      { "<C-g>f", "<cmd>GitBlameOpenFileURL<cr>", desc = "Open current file in browser" },
    },
  },
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
    keys = {
      { "<C-x>G", "<cmd>Glow<cr>", desc = "Preview Markdown in current buffer" },
    },
    config = function ()
      require("glow").setup()
    end
  },
  {
    "crispgm/nvim-tabline",
    config = function()
      local colors = { "🔴", "🟠", "🟡", "🟢", "🔵", "🟣" }
      local buffer_to_emoji_map = {}
      local next_emoji_index = 1
      math.randomseed(os.time())

      local function custom_tabline()
        local s = ""
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_option(buf, "buftype") == "" then
            local name = vim.api.nvim_buf_get_name(buf)
            name = name ~= "" and vim.fn.fnamemodify(name, ":t") or "[No Name]"

            -- assign the next sequential emoji if not already assigned
            if not buffer_to_emoji_map[buf] then
              buffer_to_emoji_map[buf] = colors[next_emoji_index]
              next_emoji_index = next_emoji_index % #colors + 1  -- wrap around
            end

            local emoji = buffer_to_emoji_map[buf]
            local is_active = buf == vim.api.nvim_get_current_buf()

            if is_active then
              s = s .. "%#TabLineSel#" .. " " .. emoji .. " " .. name .. " %#TabLine#"
            else
              s = s .. " " .. emoji .. " " .. name .. " "
            end
          end
        end
        return s
      end

      -- Store it globally so Neovim can call it
      _G.custom_tabline = custom_tabline

      -- Activate the tabline
      vim.o.showtabline = 2
      vim.o.tabline = "%!v:lua._G.custom_tabline()"
    end
  },
  {
    "samjwill/nvim-unception",
    init = function()
        vim.g.unception_open_buffer_in_new_tab = true
    end
  },
  {
    "stevearc/conform.nvim",
    event = "VeryLazy",
    config = function()
      local conform = require("conform")
      local util = require("lspconfig.util")

      -- Project root detector
      local function get_project_root(bufnr)
        bufnr = bufnr or vim.api.nvim_get_current_buf()
        local filename = vim.api.nvim_buf_get_name(bufnr)
        return util.root_pattern(
          ".git",
          "package.json",
          ".prettierrc",
          ".prettierrc.json",
          ".prettierrc.js",
          ".prettierrc.cjs",
          ".prettierrc.yaml",
          ".prettierrc.yml",
          "prettier.config.js",
          "prettier.config.cjs"
        )(filename) or vim.fn.getcwd()
      end

      -- Check if a .prettierrc (or equiv) exists in the project root
      local function has_prettierrc(bufnr)
        local root = get_project_root(bufnr)
        local files = {
          ".prettierrc",
          ".prettierrc.json",
          ".prettierrc.js",
          ".prettierrc.cjs",
          ".prettierrc.yaml",
          ".prettierrc.yml",
          "prettier.config.js",
          "prettier.config.cjs",
        }
        for _, f in ipairs(files) do
          if vim.loop.fs_stat(root .. "/" .. f) then
            return true
          end
        end
        return false
      end

      conform.setup({
        formatters_by_ft = {
          javascript = { "prettier_if_config" },
          typescript = { "prettier_if_config" },
          javascriptreact = { "prettier_if_config" },
          typescriptreact = { "prettier_if_config" },
          json = { "prettier_if_config" },
          css = { "prettier_if_config" },
          html = { "prettier_if_config" },
          yaml = { "prettier_if_config" },
          markdown = { "prettier_if_config" },
        },
        -- No format on save
        format_on_save = false,
      })

      -- Custom Prettier wrapper `prettier_if_config`: only runs if a config exists
      conform.formatters.prettier_if_config = {
        command = "prettier",
        args = { "--stdin-filepath", "$FILENAME" },
        condition = function(ctx)
          if has_prettierrc(ctx.buf) then
            return true
          else
            vim.notify(
              "No .prettierrc found in project root. Skipping Prettier for "
                .. vim.api.nvim_buf_get_name(ctx.buf),
              vim.log.levels.WARN
            )
            return false
          end
        end,
      }

      -- Format all listed buffers with `:Pfa`
      vim.api.nvim_create_user_command("Pfa", function()
        for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
          if vim.api.nvim_buf_is_loaded(bufnr) and vim.api.nvim_buf_get_option(bufnr, "modifiable") then
            conform.format({ bufnr = bufnr, async = true })
          end
        end
        vim.notify("prettier triggered for all open buffers", vim.log.levels.INFO)
      end, { desc = "prettier triggered for all open buffers" })

      -- Only format current buffer
      vim.keymap.set("n", "<leader>pf", function()
        conform.format({ async = true })
      end, { desc = "Format current buffer" })
    end,
  },
  {
    "yutkat/confirm-quit.nvim",
    event = "CmdlineEnter",
    opts = {},
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- Leave empty for default config
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
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
  {
    "dnlhc/glance.nvim",
    event = "LspAttach",
    keys = {
      { "gR", "<cmd>Glance references<cr>", desc = "Glance at references" },
      { "gD", "<cmd>Glance definitions<cr>", desc = "Glance at definition" },
      { "gY", "<cmd>Glance type_definitions<cr>", desc = "Glance at type definition" },
      { "gM", "<cmd>Glance implementations<cr>", desc = "Glance at implementation" },
    }
  },
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
      { "williamboman/mason.nvim", tag = "v1.11.0" },
      { "williamboman/mason-lspconfig.nvim", tag = "v1.32.0" },
    },
    config = function()
      local global_opts = { noremap = true, silent = true }

      -- Command for launching Mason
      vim.keymap.set("n", "<C-x>m", "<cmd>Mason<cr>", global_opts)

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
          local is_prompt = buftype == "prompt"

          return not inside_comment
            and not inside_log
            and not is_prompt
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
