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
    {
  "kevinhwang91/nvim-ufo",
  dependencies = "kevinhwang91/promise-async",
  event = "VeryLazy",
  opts = {
    -- INFO: Uncomment to use treeitter as fold provider, otherwise nvim lsp is used
    -- provider_selector = function(bufnr, filetype, buftype)
    --   return { "treesitter", "indent" }
    -- end,
    open_fold_hl_timeout = 400,
    close_fold_kinds = { "imports", "comment" },
    preview = {
      win_config = {
        border = { "", "─", "", "", "", "─", "", "" },
        -- winhighlight = "Normal:Folded",
        winblend = 0,
      },
      mappings = {
        scrollU = "<C-u>",
        scrollD = "<C-d>",
        jumpTop = "[",
        jumpBot = "]",
      },
    },
  },
  init = function()
    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
    vim.o.foldcolumn = "1" -- '0' is not bad
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  end,
  config = function(_, opts)
    local handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local totalLines = vim.api.nvim_buf_line_count(0)
      local foldedLines = endLnum - lnum
      local suffix = ("  %d %d%%"):format(foldedLines, foldedLines / totalLines * 100)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0
      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, { chunkText, hlGroup })
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          -- str width returned from truncate() may less than 2nd argument, need padding
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end
      local rAlignAppndx =
        math.max(math.min(vim.opt.textwidth["_value"], width - 1) - curWidth - sufWidth, 0)
      suffix = (" "):rep(rAlignAppndx) .. suffix
      table.insert(newVirtText, { suffix, "MoreMsg" })
      return newVirtText
    end
    opts["fold_virt_text_handler"] = handler
    require("ufo").setup(opts)
    vim.keymap.set("n", "zR", require("ufo").openAllFolds)
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
    vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
    vim.keymap.set("n", "K", function()
      local winid = require("ufo").peekFoldedLinesUnderCursor()
      if not winid then
        -- vim.lsp.buf.hover()
        vim.cmd [[ Lspsaga hover_doc ]]
      end
    end)
  end,
},
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
    -- 'peterhoeg/vim-qml', -- QML syntax
    -- {
    --     'dense-analysis/ale', -- QML diagnostics
    --     config = function()
    --         local g = vim.g

    --         g.ale_enabled = 1
    --         g.ale_fix_on_save = 1
    --         g.ale_sign_error = '✗'
    --         g.ale_sign_warning = ''
    --         g.ale_sign_column_always = 1
    --         g.ale_completion_enabled = 1

    --         g.ale_virtualtext_cursor = 1
    --         g.ale_virtualtext_prefix = '>>'

    --         -- Убедитесь, что виртуальный текст включен для QML
    --         g.ale_virtualtext = 1

    --         g.ale_linters = { qml = {'qmllint'}, python = {'flake8'} }
    --         -- g.ale_fixers = { qml = {'qmlfmt'} }
    --     end
    -- },

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
