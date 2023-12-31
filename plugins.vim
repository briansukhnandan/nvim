call plug#begin('$HOME/.config/nvim/plugged')

" General
Plug 'nvim-lualine/lualine.nvim'
Plug 'petertriho/nvim-scrollbar'
Plug 'preservim/nerdtree'
Plug 'windwp/nvim-ts-autotag'
Plug 'windwp/nvim-autopairs'

" Git
Plug 'tpope/vim-fugitive'
Plug 'f-person/git-blame.nvim'
Plug 'lewis6991/gitsigns.nvim'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-treesitter/playground'

" cmp
Plug 'arkav/lualine-lsp-progress'
Plug 'dcampos/cmp-snippy'
Plug 'dcampos/nvim-snippy'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

Plug 'kyazdani42/nvim-web-devicons'

" colorschemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'ellisonleao/gruvbox.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/sonokai'
Plug 'Mofiqul/dracula.nvim'

" language-specific plugins
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'jvirtanen/vim-hcl'

call plug#end()
