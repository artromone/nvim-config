local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')


-- Appearence
Plug('navarasu/onedark.nvim') --- Plug('catppuccin/nvim')
Plug('nvimdev/dashboard-nvim') --------------------------------------------------- TODO!!!
-- Plug('yamatsum/nvim-nonicons')
Plug('mskelton/termicons.nvim')
Plug('mawkler/modicator.nvim')

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
Plug('sontungexpt/stcursorword')
Plug('gaborvecsei/memento.nvim')
Plug('otavioschwanck/arrow.nvim')

-- Collaborate
Plug('jbyuki/instant.nvim')

-- Code
Plug('kylechui/nvim-surround') --------------------------------------------------- LEARN!!!
Plug('numToStr/Comment.nvim')
Plug('mhartington/formatter.nvim')
Plug('debugloop/telescope-undo.nvim')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug('HiPhish/rainbow-delimiters.nvim') -- wors with treesitter
Plug('lukas-reineke/indent-blankline.nvim')
Plug('echasnovski/mini.move', { ['branch'] = 'stable' })
Plug('echasnovski/mini.pairs', { ['branch'] = 'stable' })

Plug('d86leader/vim-cpp-helper')

-- VCS
Plug('lewis6991/gitsigns.nvim') --------------------------------------------------- LEARN!!!
Plug('tpope/vim-fugitive') --------------------------------------------------- LEARN!!!

-- Build
Plug('cdelledonne/vim-cmake')

-- LSP (language server protocol)
Plug('neovim/nvim-lspconfig')
Plug('kabouzeid/nvim-lspinstall')
Plug('j-hui/fidget.nvim')
Plug('Wansmer/symbol-usage.nvim')

-- Autocompletion plugins (lsp-based)
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')


vim.call('plug#end')