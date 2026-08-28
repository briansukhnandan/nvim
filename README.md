# nvim
My config that i use at work everyday 😎<br>
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
- View Marks: `<leader><leader>>m`
- Jump List: `<leader><leader>j`
- Recent Files: `<leader><leader>o`
- Current Buffer Fuzzy Finder: `<leader><leader>c`

### Aerial
- Open the Aerial Pane (default position is left): `<leader>a`
- Jumping forwards/backwards in the Aerial pane: `<Up>/<Down>`

### Glow
- Preview Markdown in the current buffer: `<C-x>Go`
- Preview this repo's `README.md` in Glow: `<C-x>Gr`

### Oil (File Explorer)
- Toggle/Go up a directory: `-`
- Go into a directory/file: `=`
- See file details in Oil buffer: `gd`

### Git Blame
- Open commit in Github/GitLab - `<C-g>o`
- Copy current line's commit SHA - `<C-g>s`
- Copy current line's commit URL - `<C-g>u`
- Open current file in browser - `<C-g>f`

### Fugitive 
- Launch Fugitive in a buffer: `<C-x>g`
- Git push --force `:Gpf`
- Git rebase (Continue) `:Grc`
- Git rebase (Abort) `:Gra`

### Diffview (GitHub/GitLab-style diffs)
Diff Superkey - `<C-x>d`
- Current `git diff` (working tree): `<C-x>dd`
- Close the diff tab: `<C-x>dc` (or `q` from inside it)
- Toggle the file panel: `<C-x>dt`
- Repo commit history: `<C-x>dh`
- Current file's history: `<C-x>df` (in visual mode: history for the selected lines)
- `git show <sha>` — prompts for a rev: `<C-x>ds` (or `:Gsh <sha>`)
- PR-style review vs the base branch: `<C-x>db` (or `:Gdb [branch]`)
- Any other rev/range: `<C-x>dr` (or `:Gdr HEAD~3`, `:Gdr a..b`, `:Gdr -- src/`)

Inside the diff view:
- Next/prev file: `<Tab>` / `<S-Tab>`
- Toggle split ⇄ unified layout: `g<C-x>`
- Stage/unstage the file or hunk: `-` / `s`
- Mark a file as reviewed: `m`
- Open the real file: `gf`
- Help for the buffer you're in: `g?`

Note: this uses `dlyongemallo/diffview-plus.nvim`, the maintained fork of
`sindrets/diffview.nvim` (upstream has had no commits since June 2024). Commands
and config are identical, so swapping back is a one-line change.

### Mason (LSP)
- GUI: `<C-x>m`

### mini.nvim
- Minimap (Commands prefixed by `<C-m>`)
  - Open: `<C-m>mo`
  - Close: `<C-m>mc`
  - Toggle: `<C-m>mt`
  - Refresh: `<C-m>mr`

### Code Formatting
- I use `conform.nvim` for my code-formatting needs.
- If you launch `neovim` from your project's root and have a prettier config file, this config should automatically acknowledge it.
- At work, I use `prettier`, so I have 2 keybinds that I personally use:
  - `<leader>pf` - Format only the current buffer
  - `:Pfa` - Format all open buffers

### Terminals
- I use the built-in neovim terminal, as it works for my use-cases.
- You can spawn + switch up to 9 terminals using `<leader>1` -> `<leader>9`.
- Note that if a terminal buffer is not already created, then using that keybind will
automatically create a new terminal buffer with that label and switch to it.

### Window Management
- To me, `<C-w>` is a bit awkward for window keybinds, so I remapped that to `,`.

### Other helpful bindings
- Seeing the path of the current buffer: `<leader>F`
- Scrolling up/down: `<A-j>/<A-k>`
- Opening the GitLab/GitHub commit under the cursor: `<C-x>o`
- Copy the current buffer's path to the system clipboard: `<leader>yp`
- Close all buffers and return to Dashboard: `<C-x>r`
- Toggle nvim-colorizer: `<C-c>ct`
