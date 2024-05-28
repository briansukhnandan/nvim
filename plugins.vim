call plug#begin('$HOME/.config/nvim/plugged')

Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvimdev/dashboard-nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'tpope/vim-fugitive'
Plug 'nvim-lualine/lualine.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'petertriho/nvim-scrollbar'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'tpope/vim-commentary'
Plug 'nvim-lualine/lualine.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'cohama/lexima.vim'
Plug 'https://github.com/f-person/git-blame.nvim'
Plug 'windwp/nvim-ts-autotag'
Plug 'sindrets/diffview.nvim'
Plug 'ellisonleao/glow.nvim'
Plug 'justinmk/vim-sneak'

" LSP/cmp
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-vsnip'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'williamboman/mason.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'

call plug#end()
