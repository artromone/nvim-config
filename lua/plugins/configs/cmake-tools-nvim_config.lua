-- cmake-tools-nvim_config
local M = {}

function M.setup()
    vim.g.cmake_link_compile_commands = 1
    vim.g.cmake_build_dir_location = 'build'
    vim.g.cmake_build_options = {'-j20'}
end

return M
