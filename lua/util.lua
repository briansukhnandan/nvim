local keymap = vim.keymap.set

function Map(mode, keymap_to_set, command_to_run, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  keymap(mode, keymap_to_set, command_to_run, options)
end

function copy_buf_path_to_clipboard()
  local filepath = vim.fn.expand('%')
  vim.fn.setreg('+', filepath) -- write to clipboard
end

local M = {}
function M.apply_shortcut(mode, shortcut, func, options)
  if shortcut then
    vim.keymap.set(mode, shortcut, func, options)
  end
end
return M
