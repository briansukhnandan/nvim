require('lualine').setup {
  options = {
    theme = 'dracula',
  },
  sections = {
    lualine_c = {
      {
        'filename',
        -- 0 = filename only,
        -- 1 = relative path,
        -- 2 = absolute path
        path = 1
      }
    }
  }
}
