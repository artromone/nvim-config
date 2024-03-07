local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')


-- Theme
Plug('navarasu/onedark.nvim') --- Plug('catppuccin/nvim')
Plug('nvimdev/dashboard-nvim') --------------------------------------------------- TODO!!!

-- Plugin manager: vim-plug
Plug('junegunn/vim-plug', { ['do'] = ':PlugUpgrade' })

-- Navigation and viewing
Plug('preservim/tagbar', { ['on'] = 'TagbarToggle' }) --------------------------------------------------- TODO!!!
Plug('nvim-tree/nvim-web-devicons') -- for nvim-tree
Plug('nvim-tree/nvim-tree.lua', { ['on'] = 'NvimTreeToggle' })
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-lua/plenary.nvim') -- for nvim-telescope/telescope.nvim
Plug('nvim-telescope/telescope.nvim')
Plug('akinsho/bufferline.nvim', { ['tag'] = '*' })
Plug('folke/which-key.nvim') --------------------------------------------------- LEARN!!!

-- Code
Plug('tpope/vim-surround') --------------------------------------------------- LEARN!!!
Plug('numToStr/Comment.nvim') --------------------------------------------------- LEARN!!!
Plug('mhartington/formatter.nvim')
Plug('debugloop/telescope-undo.nvim')
Plug('Wansmer/symbol-usage.nvim')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug('HiPhish/rainbow-delimiters.nvim') -- wors with treesitter
Plug('lukas-reineke/indent-blankline.nvim')

-- Mini
------ Plug('echasnovski/mini.align', { ['branch'] = 'stable' })
Plug('echasnovski/mini.move', { ['branch'] = 'stable' })
Plug('echasnovski/mini.pairs', { ['branch'] = 'stable' })

-- VCS
Plug('lewis6991/gitsigns.nvim')
Plug('tpope/vim-fugitive')

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