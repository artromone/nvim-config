-- nvim-dap_config
local M = {}

function M.setup()
    local dap = require("dap")

    dap.adapters.cppdbg = {
        type = 'executable',
        command = 'gdb',
        name = "cppdbg",
        args = {},
        attach = {pidProperty = "pid", pidSelect = "ask"},
        env = {LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"}
    }

    dap.configurations.cpp = {
        {
            name = "Launch",
            type = "cppdbg",
            request = "launch",
            program = function()
                return vim.fn.input('Path to executable: ',
                                    vim.fn.getcwd() .. '/', 'file')
            end,
            args = {},
            cwd = "${workspaceFolder}",
            stopAtEntry = false,
            env = {},
            externalConsole = false,
            MIMode = "gdb",
            setupCommands = {
                {
                    description = "Enable pretty-printing for gdb",
                    text = "-enable-pretty-printing",
                    ignoreFailures = true
                }
            }
        }
    }
end

return M
