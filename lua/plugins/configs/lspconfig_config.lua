-- lspconfig_config.lua
local M = {}

function M.setup()
    local lspconfig = require("lspconfig")

    local current_directory = vim.fn.getcwd()

    lspconfig.ccls.setup {
        on_attach = function(client, bufnr) end,
        filetypes = {"c", "cpp", "h"},
        root_dir = lspconfig.util.root_pattern(".git", ".hg"),
        cmd = {"ccls"},
        on_init = function(client)
            local root_dir = lspconfig.util.root_pattern(".git", ".hg")(vim.fn.expand('%:p')) or vim.loop.cwd()
            client.config.init_options.compilationDatabaseDirectory = root_dir .. "/build"
            print("Compilation database directory: " .. root_dir .. "/build")
        end,
        init_options = {
            -- compilationDatabaseDirectory = root_dir .. "/build",
            cache = {directory = '/var/cache/ccls-cache', },
        }
    }

    lspconfig.neocmake.setup {
        on_attach = function(client, bufnr) end,
        filetypes = {"cmake"},
        root_dir = lspconfig.util.root_pattern("CMakeLists.txt", ".git", ".hg"),
        cmd = {"neocmakelsp", "--stdio"},
        single_file_support = true, -- suggested
        init_options = {
            format = {enable = true},
            scan_cmake_in_package = true -- default is true
        }
    }

    -- lspconfig.jdtls.setup {
    --     on_attach = function(client, bufnr) end,
    --     filetypes = {"java"},
    --     root_dir = lspconfig.util.root_pattern("pom.xml", "gradle.build",
    --                                            ".git", ".hg"),
    --     cmd = {
    --         "/home/art/programming/.libs/jdtls/bin/jdtls", "-data",
    --         current_directory, "--add-modules=ALL-SYSTEM", "--java-debug=5005"
    --     }
    -- }

    lspconfig.pylsp.setup {
        on_attach = function(client, bufnr) end,
        filetypes = {"python"},
        root_dir = lspconfig.util.root_pattern("pyproject.toml", "setup.py",
                                               ".git", ".hg"),
        settings = {
            pylsp = {
                plugins = {
                    pylint = {
                        enabled = false,
                        args = {"--enable=F,E"}, -- (W)(E)(F)
                        threshold = "warning"
                    },
                    jedi_completion = {fuzzy = true},
                    pycodestyle = {enabled = true, maxLineLength = 120}
                }
            }
        }
    }

    lspconfig.gopls.setup {
        on_attach = function(client, bufnr) end,
        filetypes = {"go"},
        root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
        cmd = {"gopls", "-remote=auto"}
    }
end

return M