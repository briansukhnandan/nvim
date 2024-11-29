call plug#begin('$HOME/.config/nvim/plugged')

Plug 'nvim-tree/nvim-web-devicons' " eye candy
Plug 'nvim-neo-tree/neo-tree.nvim' " file explorer
Plug 'MunifTanjim/nui.nvim' " UI Library
Plug 'nvimdev/dashboard-nvim' " Startup Dashboard
Plug 'navarasu/onedark.nvim' " Atom colorscheme
Plug 'tpope/vim-fugitive' " Git wrapper
Plug 'nvim-lualine/lualine.nvim' " Status line
Plug 'petertriho/nvim-scrollbar' " Scrollbar
Plug 'nvim-lua/plenary.nvim' " Util lib for other plugins
Plug 'nvim-telescope/telescope.nvim' " File and fuzzy finder
Plug 'lewis6991/gitsigns.nvim' " Git signs in buffer
Plug 'echasnovski/mini.nvim' " A collection of useful plugins
Plug 'https://github.com/f-person/git-blame.nvim' " Need be said?
Plug 'https://github.com/j-hui/fidget.nvim' " LSP status on file open
Plug 'ellisonleao/glow.nvim' " Preview Markdown
Plug 'justinmk/vim-sneak' " Jump to any point visible with 3 keystrokes
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'} " Better terminal configs

" LSP/cmp
Plug 'nvim-treesitter/nvim-treesitter' 
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-vsnip'
Plug 'williamboman/mason-lspconfig.nvim' " Easy config for Mason and LSP
Plug 'williamboman/mason.nvim' " Easily manage LSP servers
Plug 'neovim/nvim-lspconfig' " lsp
Plug 'hrsh7th/cmp-nvim-lsp' " LSP cmp
Plug 'hrsh7th/cmp-buffer' " Current buffer cmp
Plug 'hrsh7th/cmp-path' " Systen path cmp
Plug 'hrsh7th/cmp-cmdline' " cmp for the cmdline
Plug 'hrsh7th/nvim-cmp' " cmp itself
Plug 'hrsh7th/cmp-nvim-lsp-signature-help' " See function signatures as typing
Plug 'dnlhc/glance.nvim' " See VSCode like LSP info

call plug#end()
