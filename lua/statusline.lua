local function cwd()
  Home = os.getenv("HOME")
  cwd = vim.loop.cwd()
  return cwd:gsub(Home, "~")
end

require('lualine').setup {
  theme = 'tokyonight',
  options = {
      globalstatus = false,
  },
  sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {'lsp_progress'},
      lualine_y = {'progress', 'filetype'},
      lualine_z = {
          'location',
          cwd
      }
  }
}