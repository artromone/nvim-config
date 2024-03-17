local opt = vim.opt
local g = vim.g

vim.loader.enable() -- Use Lua

-- Appearance settings
local appearance = {
    colorcolumn = '100', -- Characters divider
    cursorline = true, -- Highlight the line with the cursor
    number = true, -- Enable line numbers
    relativenumber = false, -- Disable relative line numbers
    -- so = 999,                      -- Keep cursor always centered
    showmode = false, -- No things like --INSERT-- anymore
    timeoutlen = 1000, -- Time to wait for a mapped sequence to complete (in milliseconds)
    wrap = false -- No wrap
}

-- Language and spelling settings
local language = {
    spelllang = {'en_us'} -- Spelling dictionaries for English and Russian
}

-- Tab and indent settings
local tab_settings = {
    expandtab = true, -- Use spaces instead of tabs
    smartindent = true, -- Auto-indent new lines
    shiftwidth = 4, -- Shift 4 spaces when pressing tab
    tabstop = 4 -- 1 tab == 4 spaces
}

-- Search and match settings
local search_settings = {
    ignorecase = true, -- Ignore case when searching
    smartcase = true, -- Use smart case when searching
    showmatch = true -- Show matching brackets
}

-- Window and screen division settings
local window_settings = {
    splitright = true, -- Vertical splits open to the right
    splitbelow = true -- Horizontal splits open below
}

-- Other settings and features
local other_opt_settings = {
    undofile = true, -- Enable undo file
    fixeol = false, -- Do not automatically fix end-of-line (EOL) characters
    clipboard = 'unnamedplus', -- Use system clipboard for copy-paste operations
    completeopt = 'menuone,noselect', -- Enable menu-driven completion, disable automatic selection
    shortmess = "csI", -- Abbreviate messages (no intro), use insert completion
    whichwrap = "<>[]hl" -- Allow < > [ ] to wrap to the next/previous line, as well as h and l
}
local other_g_settings = {
    mapleader = ' ', -- Set mapleader symbol
    cmp_autocmd_event = '', -- Set autocmd event for completion (no event)
    -- AutoPairsFlyMode = 0 -- Dont go to prev bracket
}

-- Automatic commands
local autocmds = {
    "autocmd BufEnter * set fo-=c fo-=r fo-=o", -- Remove 'c', 'r', and 'o' flags from 'formatoptions' whenever a buffer is entered
    "autocmd BufLeave * :lua vim.cmd('silent! wa')", -- Save all buffers silently when leaving a buffer
    "autocmd VimLeave * :lua vim.cmd('wa')", -- Save all buffers when exiting Vim
    "autocmd InsertLeave * :w" -- Save the current buffer when leaving insert mode

    -- "autocmd VimEnter * PlugUpdate --sync | source $MYVIMRC"
    -- 'autocmd FileType c,cpp nnoremap <buffer> <silent> K :call coc#util#open_url(\'https://en.cppreference.com/mwiki/index.php?title=<cword>&printable=yes\')<CR>',
    -- 'autocmd FileType c,cpp setl omnifunc=coc#rpc#request',
    -- 'autocmd User coc-server-ready call CocActionAsync(\'runCommand\', \'editor.action.goToImplementation\')'
}

-- Neovide
if vim.g.neovide then
    -- vim.cmd([[
    --     augroup AutoOpenDashboard
    --     autocmd!
    --     autocmd VimEnter * Dashboard
    --     augroup END
    -- ]])
    vim.cmd([[
        augroup AutoOpenNvimTree
        autocmd!
        autocmd VimEnter * :NvimTreeRefresh | :NvimTreeToggle
        augroup END
    ]])
    vim.cmd([[
        augroup ShowIndentBlankline
            autocmd!
            autocmd FileType * IBLEnable
        augroup END
    ]])
    vim.cmd([[
    augroup EnableCursorColumn
        autocmd BufRead,BufNewFile * set cursorcolumn
    augroup END
    ]])

end

-- Applying settings
local apply_opt_settings = function(settings)
    for key, value in pairs(settings) do opt[key] = value end
end
local apply_g_settings = function(settings)
    for key, value in pairs(settings) do g[key] = value end
end

apply_opt_settings(appearance)
apply_opt_settings(language)
apply_opt_settings(tab_settings)
apply_opt_settings(search_settings)
apply_opt_settings(window_settings)
apply_opt_settings(other_opt_settings)

apply_g_settings(other_g_settings)

for _, cmd in ipairs(autocmds) do vim.cmd(cmd) end