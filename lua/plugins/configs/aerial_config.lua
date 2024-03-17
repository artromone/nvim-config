-- aerial_config.lua
local M = {}

function M.setup()
    require("aerial").setup({
        on_attach = function(bufnr)
            vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", {buffer = bufnr})
            vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", {buffer = bufnr})
        end,
        layout = {min_width = 25},
        filter_kind = {
            "Class", "Constructor", "Enum", "Function", "Interface", "Module",
            "Method", "Struct"
        },
        icons = {},
        open_automatic = true,
        close_automatic_events = {'unsupported'},
    })
end

return M