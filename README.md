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
- Split Horizontally: `\sh`
- Split Vertically: `\sv`
- Move between splits: `\ + hjkl`
- Resize splits: `\ + ,|.|-|=` (Same controls as vanilla Vim but `<C-w>` becomes `\`)

### Harpoon (Navigation)
Harpoon Superkey (`<HS>`) - `<leader>h`
- Quick Menu: `<HS>m`
- Mark File: `<HS>a`
- Next File: `<HS>n`
- Prev File: `<HS>p`

### ToggleTerm
Toggle Key - `<C-\>`
- Prefixing the Toggle key with a number will open that Terminal.
    - For example `2<C-\>` opens Terminal 2

### Telescope
Telescope Superkey (`<TS>`) - `<leader><space>`
- Find files: `<TS>f`
- Live Grep: `<TS>g`
- View Buffers: `<TS>b`
- Jump List: `<TS>j`
- Recent Files: `<TS>o`
- Current Buffer Fuzzy Finder: `<TS>c`

### Glow
- Preview Markdown in the current buffer: `<leader>md`

### Fugitive 
- Launch Fugitive in a buffer: `<leader>gg`

### Mason (LSP)
- GUI: `<leader>cm`

### Neotree (File Explorer)
- Toggle: `<leader>e`
