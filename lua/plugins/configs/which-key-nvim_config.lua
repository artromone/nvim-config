-- which-key-nvim_config

local M = {}

function M.setup()	
	vim.o.timeout = true
    vim.o.timeoutlen = 300
    
    require("which-key").setup()
end

return M
