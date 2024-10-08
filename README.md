# nvim
my config that i use at work everyday 😎

### How do I use it?
- This uses `vim-plug` as the plugin manager so execute a `:PlugInstall`, restart nvim and you should be (mostly) good to go!
- Depending on the language you'll be programming in, you'll also need to download the appropriate treesitter config with `:TSInstall`

### My specific tweaks
- I personally use the default `<leader>` key - `<space>`.
- However my config also works well if you prefer your `<leader>` key to be `,`!
- This config also integrates well with `Neovide` if that's your cup of tea. To increase/decrease scale use `<C-->` and `<C-=>`. By default scale will be set at `0.75`.

### Colorscheme
- Right now I use Atom's One Dark colorscheme.
- You can toggle between light/dark mode with `<C-x>tt`

### Splitting Windows
- Split Horizontally: `\sh`
- Split Vertically: `\sv`
- Move between splits: `\ + hjkl`
- Resize splits: `\ + ,|.|-|=` (Same controls as vanilla Vim but `<C-w>` becomes `\`)

### Harpoon (Navigation)
Harpoon Superkey (`<HS>`) - `<leader>h`
- Quick Menu: `<leader>hm`
- Mark File: `<leader>ha`
- Next File: `<leader>hn`
- Prev File: `<leader>hp`

### Telescope
Telescope Superkey - `<leader><space>`
- Find files: `<leader><Space>f`
- Live Grep: `<leader><Space>g`
- View Buffers: `<leader><Space>>b`
- Jump List: `<leader><Space>j`
- Recent Files: `<leader><Space>o`
- Current Buffer Fuzzy Finder: `<leader><Space>c`

### ToggleTerm
Toggle Key - `<C-backtick>`
- Prefixing the Toggle key with a number will open that Terminal.
    - For example `2<C-backtick>` opens Terminal 2

### Glow
- Preview Markdown in the current buffer: `<C-x>G`

### Neotree (File Explorer)
- Toggle: `<leader>e`

### Git Blame
- Open commit in Github/GitLab - `<C-x>o`

### Fugitive 
- Launch Fugitive in a buffer: `<C-x>g`

### Mason (LSP)
- GUI: `<C-x>m`
