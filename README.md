# nvim
my config that i use at work everyday 😎

### How do I use it?
- This uses `vim-plug` as the plugin manager so execute a `:PlugInstall`, restart nvim and you should be (mostly) good to go!
- Depending on the language you'll be programming in, you'll also need to download the appropriate treesitter config with `:TSInstall`

### My specific tweaks
- I personally use the default `<leader>` key - `<space>`.
- However my config also works well if you prefer your `<leader>` key to be `,`!
- This config also integrates well with `Neovide` if that's your cup of tea. To increase/decrease scale use `<C-->` and `<C-=>`. By default scale will be set at `0.75`.

### Splitting Windows
- Split Horizontally: `\h`
- Split Vertically: `\v`
- Move between splits: `\ + Arrow keys`
- Resize splits: `\ + ,|.|-|=` (Same controls as vanilla Vim but `<C-w>` becomes `\`)

### Harpoon (Navigation)
Harpoon Superkey (`<HS>`) - `<leader>h`
- Quick Menu: `<HS>m`
- Mark File: `<HS>a`
- Next File: `<HS>n`
- Prev File: `<HS>p`

### Mason (LSP)
- GUI: `<leader>cm`

### Code-related
- Go to matching bracket / parentheses: `M`

### Telescope
Telescope Superkey (`<TS>`) - `<leader><space>`
- Find files: `<TS>f`
- Live Grep: `<TS>g`
- View Buffers: `<TS>b`

### Glow
- Preview Markdown in the current buffer: `<leader>md`

### Fugitive 
- Launch Fugitive in a buffer: `<leader>gg`
