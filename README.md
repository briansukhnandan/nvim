# nvim
my config that i use at work everyday 😎
Battle-tested for nvim `v0.11.4`

### How do I use it?
- This uses `lazy.nvim` as the plugin manager, so it should initialize itself automatically automatically on the first launch.
- By default I have LSP for TS, Python, Lua, and Rust installed, but feel free to expand this list in the `lua/plugins.lua` file under the `nvim-lspconfig` plugin block.

### My specific tweaks
- I personally use the default `<leader>` key - `<space>`, however feel free to change this in `lua/nvim_conf.lua`.
- This config also integrates well with `Neovide` if that's your cup of tea. To increase/decrease scale use `<C-->` and `<C-=>`. By default scale will be set at `0.75`.

### Colorscheme
- Right now I use Atom's One Dark colorscheme.
- You can toggle between light/dark mode with `<C-x>tt`

### Telescope
Telescope Superkey - `<leader><leader>`
- Find files: `<leader><leader>f`
- Live Grep: `<leader><leader>g`
- View Buffers: `<leader><leader>>b`
- Jump List: `<leader><leader>j`
- Recent Files: `<leader><leader>o`
- Current Buffer Fuzzy Finder: `<leader><leader>c`

### Aerial
- Open the Aerial Pane (default position is left): `<leader>a`
- Jumping forwards/backwards in the Aerial pane: `<Up>/<Down>`

### Glow
- Preview Markdown in the current buffer: `<C-x>G`

### Oil (File Explorer)
- Toggle: `-`
- See file details in Oil buffer: `gd`

### Git Blame
- Open commit in Github/GitLab - `<C-x>o`

### Fugitive 
- Launch Fugitive in a buffer: `<C-x>g`
- Git push --force `:Gpf`
- Git rebase (Continue) `:Grc`
- Git rebase (Abort) `:Gra`

### Mason (LSP)
- GUI: `<C-x>m`

### Terminals
- I use the built-in neovim terminal, as it works for my use-cases.
- You can spawn + switch up to 9 terminals using `<leader>1` -> `<leader>9`.
- Note that if a terminal buffer is not already created, then using that keybind will
automatically create a new terminal buffer with that label and switch to it.

### Window Management
- To me, `<C-w>` is a bit awkward for window keybinds, so I remapped that to `,`.
- `,`+`HJKL` will also resize buffers, where `J`/`K` are for splits and `H`/`L` are for vsplits.

### Other helpful bindings
- Seeing the path of the current buffer: `<leader>F`
- Scrolling up/down: `<A-j>/<A-k>`
- Opening the GitLab/GitHub commit under the cursor: `<C-x>o`
- Copy the current buffer's path to the system clipboard: `<leader>yp`
