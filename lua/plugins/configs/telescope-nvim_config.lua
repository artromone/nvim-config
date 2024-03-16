-- telescope-nvim_config.lua
local M = {}

function M.setup()
    -- Подключаем Telescope
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    -- Настройка команды для отображения открытых буферов
    telescope.setup {
        defaults = {
            mappings = {
                i = {["<C-x>"] = false, ["<C-q>"] = actions.send_to_qflist},
                n = {["<C-x>"] = false, ["<C-q>"] = actions.send_to_qflist}
            }
        },
        extensions = {
            repo = {
                list = {
                    fd_opts = {"--no-ignore-vcs"},
                    search_dirs = {"~/programming"}
                }
            }
        }
    }

    require("telescope").load_extension "repo"
end

-- Функция для отображения всех открытых буферов
function TelescopeBuffers()
    require('telescope.builtin').buffers {
        show_all_buffers = true,
        sort_lastused = true,
        sort_mru = true,
        ignore_current_buffer = true
    }
end

return M
