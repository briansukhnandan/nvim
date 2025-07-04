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
vim.keymap.set("n", "\\", "<cmd>Oil<cr>")
