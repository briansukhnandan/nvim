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
        key = "f"
      },
      {
        action = "Telescope live_grep",
        desc = " Find text",
        icon = " ",
        key = "g"
      },
    },
  },
}

for _, button in ipairs(opts.config.center) do
  button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
  button.key_format = "  %s"
end

require('dashboard').setup(opts)
