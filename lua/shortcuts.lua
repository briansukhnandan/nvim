local M = {}

-- You can safely delete or comment-out any line here and the mapping will go
-- away; every mapping is conditionally applied only if it's present in this
-- table!
M.my_custom_shortcuts = {
  -- cmp
  completion_next_suggestion = '<Tab>',
  completion_previous_suggestion = '<S-Tab>',
  completion_scroll_docs_back = '<C-b>',
  completion_scroll_docs_forward = '<C-f>',

  -- Note: the JavaScript ecosystem has no official code formatter so this
  -- formatting behavior of ts-server, which may not be the code formatter you
  -- might not work right. If you try to use this, it will dispatch to the
  -- want or use.
  lsp_format = '<leader>lf',
  lsp_goto_definition = 'gd',
  lsp_goto_references = 'gr',
  lsp_hover = 'K',
  lsp_open_float = '<leader>e',
  lsp_rename = '<leader>rn',
  lsp_restart = '<leader>l',
  lsp_diagnostic_goto_next = ']d',
  lsp_diagnostic_goto_prev = '[d',
  lsp_diagnostic_set_loclist = '<space>q',

  -- Telescope
  telescope_buffers = '<leader>tb',
  telescope_colorscheme = '<leader>tc',
  telescope_find_files = '<leader>tf',
  telescope_git_branches = '<leader>tr',
  telescope_git_commits = '<leader>tc',
  telescope_git_status = '<leader>ts',
  telescope_jumplist = '<leader>tj',
  telescope_live_grep = '<leader>tg',

  -- nvim specific (personal preference)
  new_tab = '<leader>nt',
  close_tab = '<leader>ct',
  next_tab = ']t',
  prev_tab = '[t'
}

-- Wrapper around `vim.keymap.set` that will automatically not apply the
-- shortcut if it is `nil`. At callsites, we generally apply the shortcuts in
-- the above table through this wrapper to make it easy for forkers to
-- get a good comment-out workflow for finding shortcuts that work for them.
--
-- Clearly, after you have forked and start to more personally adopt this
-- config, this indirection doesn't really continue to do you any good, unless
-- you want to become a neovim evangelist like myself.
function M.apply_shortcut(mode, shortcut, func, options)
  if shortcut then
    vim.keymap.set(mode, shortcut, func, options)
  end
end

return M
