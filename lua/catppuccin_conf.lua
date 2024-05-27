require("catppuccin").setup({
  color_overrides = {
    -- Not a fan of the default frappe background color
    -- however the rest of the theming is nice.
    frappe = {
      base = "#363636",
      mantle = "#404040",
      crust = "#4d4d4d",
    },
  },
})

-- Colorscheme needs to be set after config for it to take effect
vim.cmd("colorscheme catppuccin-frappe")
