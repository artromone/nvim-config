-- symbol-usage-nvim_config.lua
local M = {}

local function text_format(symbol)
    local fragments = {}

    if symbol.references then
        local usage = symbol.references <= 1 and 'usage' or 'usages'
        local num = symbol.references == 0 and 'no' or symbol.references
        table.insert(fragments, ('%s %s'):format(num, usage))
    end

    if symbol.definition then
        table.insert(fragments, symbol.definition .. ' defs')
    end

    if symbol.implementation then
        table.insert(fragments, symbol.implementation .. ' impls')
    end

    return table.concat(fragments, ', ')
end

function M.setup()
    local SymbolKind = vim.lsp.protocol.SymbolKind

    require('symbol-usage').setup({
        event = 'BufReadPre',
        text_format = text_format,

        hl = {link = 'Comment'},
        kinds = {SymbolKind.Function, SymbolKind.Method},
        kinds_filter = {},
        vt_position = 'above',
        request_pending_text = 'loading...',
        references = {enabled = true, include_declaration = false},
        definition = {enabled = true},
        implementation = {enabled = true},
        disable = {lsp = {}, filetypes = {}, cond = {}},
        symbol_request_pos = 'end'
    })
end

return M