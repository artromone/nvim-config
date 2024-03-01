-- lspconfig_config.lua

local M = {}

function M.setup()
    local lspconfig = require("lspconfig")

    local current_directory = vim.fn.getcwd()

    lspconfig.clangd.setup {
        on_attach = function(client, bufnr) end,
        filetypes = {"c", "cpp", "h"},
        root_dir = lspconfig.util.root_pattern("CMakeLists.txt", ".git", ".hg"),
        cmd = {
            "clangd",
            "--clang-tidy",
            "--background-index",
            "--completion-style=detailed",
            "--suggest-missing-includes",
            "--header-insertion=never",
            "--cross-file-rename"
        },
    }

    lspconfig.jdtls.setup {
        on_attach = function(client, bufnr) end,
        filetypes = {"java"},
        root_dir = lspconfig.util.root_pattern("pom.xml", "gradle.build", ".git", ".hg"),
        cmd = {
            "/home/art/programming/.libs/jdtls/bin/jdtls",
            "-data", current_directory,
            "--add-modules=ALL-SYSTEM",
            "--java-debug=5005",
        },
    }

    lspconfig.gopls.setup {
        on_attach = function(client, bufnr) end,
        filetypes = {"go"},
        root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
        cmd = {"gopls", "-remote=auto"},
    }
end

return M