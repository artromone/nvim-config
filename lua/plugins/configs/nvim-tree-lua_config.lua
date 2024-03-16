-- nvim-tree.lua_config.lua
local M = {}

function M.setup()

    require'nvim-tree'.setup {
        sort = {sorter = "case_sensitive"},
        view = {width = 30},
        renderer = {group_empty = true},
        disable_netrw = false,
        hijack_netrw = true,
    }
    local api = require("nvim-tree.api")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.opt.termguicolors = true

    function change_root_to_cwd()
        local cwd = vim.fn.getcwd()
        require("nvim-tree.api").tree.change_root(cwd)
    end
    vim.cmd [[ autocmd DirChanged * call v:lua.change_root_to_cwd() ]]

    function find_file_on_bufenter() require("nvim-tree.api").tree.find_file() end
    vim.cmd [[ autocmd BufEnter * call v:lua.find_file_on_bufenter() ]]

end

return M
