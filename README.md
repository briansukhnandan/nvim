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

### Telescope
Telescope Superkey - `<leader><leader>`
- Find files: `<leader><leader>f`
- Live Grep: `<leader><leader>g`
- View Buffers: `<leader><leader>>b`
- Jump List: `<leader><leader>j`
- Recent Files: `<leader><leader>o`
- Current Buffer Fuzzy Finder: `<leader><leader>c`

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
- Git push --force `:Gpf`
- Git rebase (Interactive) `:Gri`
- Git rebase (Continue) `:Grc`
- Git rebase (Abort) `:Gra`

### Mason (LSP)
- GUI: `<C-x>m`

### Other helpful bindings
- Seeing the path of the current buffer: `<leader>F`
- Scrolling up/down: `<A-j>/<A-k>`
- Opening the GitLab/GitHub commit under the cursor: `<C-x>o`
- Copy the current buffer's path to the system clipboard: `<leader>yp`
