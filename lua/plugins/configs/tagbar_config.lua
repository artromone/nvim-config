-- tagbar_config.lua

local M = {}

function M.setup()
    -- vim.cmd("autocmd VimEnter *.cpp,*.h TagbarToggle")
    vim.g.tagbar_compact = 1
    vim.g.tagbar_sort = 0
end

return M