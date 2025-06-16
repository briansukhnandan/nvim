local function apply_telescope_shortcut(mapping, telescope_command)
  if not mapping then
    return
  end
  vim.cmd("nnoremap " .. mapping .. " <cmd>Telescope " .. telescope_command .. "<cr>")
end

require('telescope').setup {
  defaults = {
    layout_strategy = 'vertical',
    layout_config = {
      vertical = {
        preview_cutoff = 0,
      },
    },
    mappings = {
      n = {
        ["<c-d>"] = require('telescope.actions').delete_buffer
      },
      i = {
        ["<c-d>"] = require('telescope.actions').delete_buffer
      }
    },
    preview = {
      treesitter = false,
    },
    file_ignore_patterns = { "node_modules", "^.git" },
  },
  pickers = {
    find_files = {
      hidden = true
    },
    colorscheme = {
      enable_preview = true
    }
  },
}

apply_telescope_shortcut("<Space><Space>f", 'find_files')
apply_telescope_shortcut("<Space><Space>g", 'live_grep')
apply_telescope_shortcut("<Space><Space>b", 'buffers')
apply_telescope_shortcut("<Space><Space>j", "jumplist")
apply_telescope_shortcut("<Space><Space>o", "oldfiles")
apply_telescope_shortcut("<Space><Space>c", "current_buffer_fuzzy_find")
