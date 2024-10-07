local keymap = vim.keymap.set

function Map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  keymap(mode, lhs, rhs, options)
end

local M = {}
function M.apply_shortcut(mode, shortcut, func, options)
  if shortcut then
    vim.keymap.set(mode, shortcut, func, options)
  end
end
return M
