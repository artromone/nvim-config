-- plugins
-- require('plugins/vim-plug')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('plugins/lazy')


local plugins_configs_dir = 'plugins/configs/'
local plugins = {   
    -- 'dashboard-nvim_config',
    'modicator-nvim_config',

    'aerial_config',
    'nvim-web-devicons_config',
    'nvim-tree-lua_config',
    'lualine_config',
    'telescope-nvim_config',
    -- 'bufferline-nvim_config',
    -- 'which-key-nvim_config',
    'stcursorword_config',
    'memento_config',
    'arrow-nvim_config',
    'nvim-ufo_config',

    'nvim-surround_config',
    'Comment_config',
    'formatter-nvim_config',
    'nvim-treesitter_config',
    'rainbow-delimiters_config',
    'indent-blankline_config',
    'mini-nvim_config',
    'neodev_config', -- must be done before lsp!

    'vim-cpp-helper-vim_config',

    'gitsigns-nvim_config',

    'cmake-tools-nvim_config',

    'nvim-dap_config',
    'nvim-dap-ui_config',

    'lspconfig_config',
    'fidget-nvim_config',
    'symbol-usage-nvim_config',

    'nvim-cmp_config',
}

for _, module_name in ipairs(plugins) do
    require(plugins_configs_dir .. module_name).setup()
end


-- theme
require('theme/onedark').use()

-- settings
require('settings/general')

-- keymap
require('keymaps/keymaps')
