-- memento_config.lua
local M = {}

function M.setup()
    vim.g.memento_history = 28
	vim.g.memento_shorten_path = false
	vim.g.memento_window_width = 100
	vim.g.memento_window_height = 30
end

return M