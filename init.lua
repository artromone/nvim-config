-- plugins
require('plugins/vim-plug')

local plugins_configs_dir = 'plugins/configs/'
local plugins = {
    'tagbar_config',
    'nvim-tree-lua_config',
    'nvim-cmp_config',
    'Comment_config',
    'lualine_config',
    'telescope_config',
    'lspconfig_config',
    'bufferline-nvim_config',
    'formatter-nvim_config',
    'symbol-usage-nvim_config',
    'nvim-treesitter_config',
    'fidget-nvim_config',
    'rainbow-delimiters_config',
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