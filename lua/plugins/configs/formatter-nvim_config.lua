-- formatter-nvim_config.lua

local M = {}

function M.setup()
    require('formatter').setup({
        filetype = {
            cpp = {
                function()
                    return {
                        exe = "clang-format",
                        args = { "-style=file" },
                        stdin = true,
                        cwd = vim.fn.expand("~/programming/"),
                    }
                end,
            },
            java = {
                function()
                    return {
                        exe = "java",
                        args = {
                            "-jar",
                            "~/.config/nvim/utils/format/google-java-format.jar",
                            vim.api.nvim_buf_get_name(0)
                        },
                        stdin = true,
                        cwd = vim.fn.expand("~"),
                    }
                end,
            },
            python = {
                function()
                    return {
                        exe = "black",
                        args = { "-" },
                        stdin = true,
                    }
                end,
            },
            go = {
                function()
                    return {
                        exe = "gofmt",
                        stdin = true,
                    }
                end,
            },
            lua = {
                function()
                    return {
                        exe = "lua-format",
                        args = { "-" },
                        stdin = true,
                    }
                end,
            },
        }
    })
end

return M
