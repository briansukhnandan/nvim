# nvim
w.i.p neovim config

# Setup
Clone into `~/.config`
```
:PlugInstall

-- tweak as needed
:LspInstallInfo
:LspInstall tsserver
:LspInstall pylsp
```

## common keybinds
- `[t ]t`  - tab navigation
- `<leader>nt` - new tab
- `<leader>ct` - close tab

- `gd` - open definition (when hovered over something)
- `K` - see type when hovered over variable
- `:vsp` - open split

- `<leader>tf` - Open Telescope finder

## NERDTree specific
- `<leader>n` - Toggle the tree
- `<leader>N` - Open tree and focus dir of current buffer
- m (after opening NERDtree) - file menu
