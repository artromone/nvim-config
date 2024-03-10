-- arrow-nvim_config

local M = {}

function M.setup()
    require('arrow').setup({
    show_icons = true,
    leader_key = ';'
  })
end

return M
