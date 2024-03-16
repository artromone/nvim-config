-- lualine_config.lua
local M = {}

function M.setup()
    require("lualine").setup {
        options = {
            icons_enabled = true,
            theme = "auto",
            component_separators = {left = "", right = ""},
            section_separators = {left = "", right = ""},
            disabled_filetypes = {"NvimTree", "tagbar", "aerial"},
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {statusline = 1000, tabline = 1000, winbar = 1000}
        },
        sections = {
            lualine_a = {"branch"},
            lualine_b = {
                "diff", "filename", {
                    "diagnostics",
                    sources = {
                        "nvim_diagnostic", "nvim_lsp",
                        "nvim_workspace_diagnostic"
                    },
                    symbols = {error = " ", warn = " ", info = " "}
                    -- diagnostics_color = {
                    --     -- Same values as the general color option can be used here.
                    --     error = "DiagnosticError", -- Changes diagnostics' error color.
                    --     warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
                    --     info = "DiagnosticInfo", -- Changes diagnostics' info color.
                    --     hint = "DiagnosticHint" -- Changes diagnostics' hint color.
                    -- },
                    --  colored = true
                }
            },
            lualine_c = {{"aerial", dense = true, colored = true}},
            lualine_x = {

                {
                    function()
                        local msg = "No Active Lsp"
                        local buf_ft = vim.api
                                           .nvim_buf_get_option(0, "filetype")
                        local clients = vim.lsp.get_active_clients()
                        if next(clients) == nil then
                            return msg
                        end
                        for _, client in ipairs(clients) do
                            local filetypes = client.config.filetypes
                            if filetypes and vim.fn.index(filetypes, buf_ft) ~=
                                -1 then
                                return client.name
                            end
                        end
                        return msg
                    end,
                    -- icon = ' ',
                    color = {}
                }, "encoding", "filesize"
            },
            lualine_y = {"progress"},
            lualine_z = {"location"}
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {"filename"},
            lualine_x = {"location"},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
    }
end

return M
