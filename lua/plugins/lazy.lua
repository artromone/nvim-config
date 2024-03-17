--[[Install lazy]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    --[[Settings]]
    defaults = {
        -- Plugins will load during startup.
        -- If you know what you're doing, you can set this to `true` to have all your plugins lazy-loaded by default.
        lazy = false,
        -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
        -- have outdated releases, which may break your Neovim install.
        version = false -- always use the latest git commit
        -- version = "*", -- try installing the latest stable version for plugins that support semver
    },
    checker = {enabled = true}, -- Automatically check for plugin updates

    --[[Nvim]]
    "dstein64/vim-startuptime", -- Measures startup time of Neovim

    --[[Appearance]]
    "navarasu/onedark.nvim", -- Colorscheme
    -- "catppuccin/nvim", -- Colorscheme
    -- "AlexvZyl/nordic.nvim", -- Colorscheme
    "mskelton/termicons.nvim", -- Icons
    "mawkler/modicator.nvim", -- Cursor line color
    -- 'nvimdev/dashboard-nvim', -- Dashboard
    -- 'yamatsum/nvim-nonicons', -- Icons

    --[[Navigation and viewing]]
    "stevearc/aerial.nvim", -- File structure
    {"nvim-tree/nvim-web-devicons", lazy = true}, -- Icons for whole nvim
    "nvim-tree/nvim-tree.lua", -- File tree
    "nvim-lualine/lualine.nvim", -- Statusline
    "nvim-lua/plenary.nvim", -- Utility functions
    "nvim-telescope/telescope.nvim", -- Superior navigation
    "cljoly/telescope-repo.nvim", -- Telescope extension for finding repositories
    {"folke/which-key.nvim", lazy = true}, -- Keybindings cheatsheet
    "sontungexpt/stcursorword", -- Underline current word under cursor
    "gaborvecsei/memento.nvim", -- Navigate in last edited positions
    "otavioschwanck/arrow.nvim", -- Bookmark files
    "kevinhwang91/nvim-ufo", -- Folding
    "kevinhwang91/promise-async", -- Thing for nvim-ufo

    --[[Collaborate]]
    -- "jbyuki/instant.nvim", -- Collaborative editing

    --[[Code]]
    "kylechui/nvim-surround", -- Text surroundings manipulation
    "numToStr/Comment.nvim", -- Commenting plugin
    "mhartington/formatter.nvim", -- Code format
    "debugloop/telescope-undo.nvim", -- Undo history navigation with Telescope
    "nvim-treesitter/nvim-treesitter", -- Syntax highlighting and code analysis
    "HiPhish/rainbow-delimiters.nvim", -- Perfect nabigation with color parentheses
    "lukas-reineke/indent-blankline.nvim", -- Indentation navigation
    "echasnovski/mini.move", -- Move lines and blocks of text
    "echasnovski/mini.pairs", -- Auto pairing of brackets, quotes, etc
    "folke/neodev.nvim", -- Signature and docs help

    "d86leader/vim-cpp-helper", -- Helper functions for C++ development

    --[[Version Control Systems]]
    "lewis6991/gitsigns.nvim", -- Git signs in the gutter
    "tpope/vim-fugitive", -- Git wrapper
    "rbong/vim-flog", -- Git log browser
    "FabijanZulj/blame.nvim", -- Git blame information

    --[[Build]]
    "cdelledonne/vim-cmake", -- CMake integration

    --[[Debugging]]
    "mfussenegger/nvim-dap", -- Debug Adapter Protocol client
    "rcarriga/nvim-dap-ui", -- Debug Adapter Protocol UI

    --[[Language Server Protocol]]
    "neovim/nvim-lspconfig", -- Configuration for built-in LSP client
    "kabouzeid/nvim-lspinstall", -- Commands for language servers
    "j-hui/fidget.nvim", -- UI for code actions
    "Wansmer/symbol-usage.nvim", -- Display function usage

    --[[Autocompletion plugins (LSP-based)]]
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- LSP completion source for nvim-cmp
            "hrsh7th/cmp-buffer", -- Buffer completion source for nvim-cmp
            "hrsh7th/cmp-path", -- Path completion source for nvim-cmp
            "hrsh7th/cmp-cmdline", -- Command-line completion source for nvim-cmp
            "hrsh7th/nvim-cmp" -- Completion plugin
        }
    }
})
