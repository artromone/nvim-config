-- nvim-treesitter_config.lua

local M = {}

function M.setup()
    vim.opt.runtimepath:append("~/.config/nvim/utils/parsers")
    require "nvim-treesitter.configs".setup {
        ensure_installed = {
            "c", "lua", "vim", "vimdoc", "query",
            "cpp",
            "java",
            "go"
        },
        sync_install = false,
        auto_install = true,
        ignore_install = {},
        parser_install_dir = "~/.config/nvim/utils/parsers",
        highlight = {
            enable = true,
            -- disable = {},
            disable = function(lang, buf)
                local max_filesize = 100 * 1024 -- 100 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    return true
                end
            end,
            additional_vim_regex_highlighting = false
        }
    }
end

return M
