-- nvim-web-devicons_config

local M = {}

function M.setup()
    --local icons = require("nvim-web-devicons")

    --icons.setup(
    -- {
    --         color_icons = false,
    --         -- default = true,
    --         -- strict = true,

    --         -- override_by_extension = {
    --         --     ["png"] = {},
    --         --     ["txt"] = {},

    --         --     ["cpp.d"] = {},
    --         --     ["cpp.o.d"] = {},

    --         --     ["log"] = {
    --         --         icon = "",
    --         --         color = "#ffffff",
    --         --         name = "Log"
    --         --     },
    --         --     ["out"] = {
    --         --         icon = "",
    --         --         color = "#aa0000",
    --         --         name = "Out"
    --         --     },
    --         --     ["exe"] = {
    --         --         icon = "",
    --         --         color = "#aa0000",
    --         --         name = "Exe"
    --         --     },
    --         -- },

    --         -- override_by_filename = {
    --         -- },
    --     }
    --)

    require("termicons").setup()
end

return M
