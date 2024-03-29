# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## My specific tweaks
- I personally use the default `<leader>` key - `<space>`.
- However my config also works well if you prefer your `<leader>` key to be `,`!
- This config also integrates well with `Neovide` if that's your cup of tea. To increase/decrease scale use `<C-->` and `<C-=>`. By default scale will be set at `0.75`.

### Tab (Buffer) Management
Buffer Superkey (`<BS>`) - `<leader><Tab>`
- New Buffer: `<BS><Tab>`
- Close Buffer: `<BS>c`
- Prev Buffer: `<BS>[` (alternatively `<BS>h`)
- Next Buffer: `<BS>]` (alternatively `<BS>l`)

### Code-related
- Go to matching bracket / parentheses: `M`

### Telescope
Telescope Superkey (`<TS>`) - `<leader><space>`
- Find files: `<TS>f`
- Live Grep: `<TS>g`
- View Buffers: `<TS>b`
  - Within the buffer selector, delete buffers under the cursor with: `<C-d>`

### Glow
- Preview Markdown in the current buffer: `<leader>md`

### Fugitive 
- Launch Fugitive in a buffer: `<leader>gg`

### Glance (VSCode-like LSP Previews)
Glance Superkey (`<GS>`) - `<leader>g`
- Glance at LSP definition - `<GS>d` (to not conflict with the built-in `gd`!)
- Glance at LSP references - `<GS>r`

### Additional Plugins
- `f-person/git-blame.nvim`
- `petertriho/nvim-scrollbar`
- `windwp/nvim-ts-autotag`
- `ellisonleao/glow.nvim`
- `HiPhish/rainbow-delimiters.nvim`
- `tpope/vim-fugitive`
- `DNLHC/glance.nvim`

### Disabled Plugins
- `rcarriga/nvim-notify`
