# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## My specific tweaks
I personally use the default `<leader>` key - `<space>`, however my config also works well if you prefer your `<leader>` key to be `,`

### Tab (Buffer) Management
Buffer Superkey (`<BS>`) - `<leader><Tab>`
- New Buffer - `<BS><Tab>`
- Close Buffer - `<BS>c`
- Prev Buffer - `<BS>[` (alternatively `<BS>h`)
- Next Buffer - `<BS>]` (alternatively `<BS>l`)

### Telescope
Telescope Superkey (`<TS>`) - `<leader><space>`
- Find files: `<TS>f`
- Live Grep: `<TS>g`
- View Buffers: `<TS>b`

### Additional Plugins
- `f-person/git-blame.nvim`
- `petertriho/nvim-scrollbar`
- `windwp/nvim-ts-autotag`

### Disabled Plugins
- `rcarriga/nvim-notify`
