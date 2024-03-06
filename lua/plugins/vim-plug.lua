local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')


-- Theme
Plug('navarasu/onedark.nvim')
--- Plug('catppuccin/nvim')

-- Plugin manager: vim-plug
Plug('junegunn/vim-plug', { ['do'] = ':PlugUpgrade' })

-- Navigation and viewing
Plug('preservim/tagbar', { ['on'] = 'TagbarToggle' })
Plug('nvim-tree/nvim-web-devicons') -- for nvim-tree
Plug('nvim-tree/nvim-tree.lua', { ['on'] = 'NvimTreeToggle' })
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-lua/plenary.nvim') -- for nvim-telescope/telescope.nvim
Plug('nvim-telescope/telescope.nvim')
Plug('akinsho/bufferline.nvim', { ['tag'] = '*' })

-- Code
Plug('tpope/vim-surround')
Plug('numToStr/Comment.nvim')
Plug('mhartington/formatter.nvim')
Plug('debugloop/telescope-undo.nvim')
Plug('Wansmer/symbol-usage.nvim')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug('HiPhish/rainbow-delimiters.nvim') -- wors with treesitter
Plug('lewis6991/gitsigns.nvim')
Plug('lukas-reineke/indent-blankline.nvim')

-- LSP (language server protocol)
Plug('neovim/nvim-lspconfig')
Plug('kabouzeid/nvim-lspinstall')
Plug('j-hui/fidget.nvim')

-- Autocompletion plugins (lsp-based)
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')


vim.call('plug#end')