local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local lsp = vim.lsp.buf

local telescope = require('telescope.builtin')

local default_opts = {noremap = true, silent = true}


-- General

-- map('i', 'jj', '<Esc>', {noremap = true})

map('', '<up>', ':echoe "Use k !!!"<CR>', default_opts)
map('', '<down>', ':echoe "Use j !!!"<CR>', default_opts)
map('', '<left>', ':echoe "Use h !!!"<CR>', default_opts)
map('', '<right>', ':echoe "Use l !!!"<CR>', default_opts)

map('i', '<A-h>', '<Esc>hli', default_opts)
map('i', '<A-l>', '<Esc>lli', default_opts)
map('i', '<A-j>', '<Esc>jli', default_opts)
map('i', '<A-k>', '<Esc>kli', default_opts)

map('n', '<C-h>', '<C-w>h', default_opts)
map('n', '<C-j>', '<C-w>j', default_opts)
map('n', '<C-k>', '<C-w>k', default_opts)
map('n', '<C-l>', '<C-w>l', default_opts)


-- Navigation
map('n', '<C-P>', ':BufferLineCycleNext<CR>', default_opts)
map('n', '<C-N>', ':BufferLineCyclePrev<CR>', default_opts)

map('n', '<F6>', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', default_opts)
map('n', '<F8>', ':AerialToggle<CR>', default_opts)

map("n", "<leader>u", "<cmd>Telescope undo<CR>", default_opts)

map('n', '<leader>ff', telescope.find_files, default_opts)
map('n', '<leader>fg', telescope.live_grep, default_opts)
map('n', '<leader>fh', telescope.help_tags, default_opts)

map('n', '<F3>', ':vsplit<CR>', default_opts)
map('n', '<F4>', ':split<CR>', default_opts)

-- map('n', '<leader>;', telescope.buffers, {})
map('n', '<F2>', ":lua require'telescope'.extensions.repo.list{pattern=[[^.hg$|^.git$]]}<CR>", default_opts)
map("n", ";", "<cmd>lua require('memento').toggle()<CR>", default_opts)
map('n', '<leader>;', telescope.buffers, default_opts)


-- Code
map('i', '<C-Space>', 'v:lua.require"cmp".complete()', default_opts)

map('n', '<C-s>', ':w<CR>',  default_opts)
map('i', '<C-s>', '<esc><CR>:w<CR>', default_opts)
map('n', '<Leader>f', ':w!<CR>:FormatWrite<CR>', default_opts)


-- Build
map("n", "<leader>c", ":CMakeToggle<CR>", default_opts)


-- Lsp
autocmd('LspAttach', {
    group = augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Включаем автодополнение по нажатию <C-x><C-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Локальные отображения для буфера
        local opts = {buffer = ev.buf}

        map('n', 'gD', lsp.declaration, opts)
        map('n', 'gd', lsp.definition, opts)
        map('n', 'gi', lsp.implementation, opts)
        map('n', 'gr', lsp.references, opts)

        map('n', 'H', lsp.hover, opts)
        map('n', '<A-h>', lsp.signature_help, opts)

        map('n', '<space>wa', lsp.add_workspace_folder, opts)
        map('n', '<space>wr', lsp.remove_workspace_folder, opts)
        map('n', '<space>wl',
            function() print(vim.inspect(lsp.list_workspace_folders())) end,
            opts)

        -- map('n', '<space>D', lsp.type_definition, opts)
        map('n', '<space>rn', lsp.rename, opts)
        -- map({ 'n', 'v' }, '<space>ca', lsp.code_action, opts)

        -- map('n', '<space>f', function()
        --   lsp.format { async = true }
        -- end, opts)
    end
})


-- Neovide
if vim.g.neovide then
    vim.g.neovide_scale_factor = 0.7 * vim.g.neovide_scale_factor

    map({"n", "v"}, "<C-+>",
        ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
    map({"n", "v"}, "<C-->",
        ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
    map({"n", "v"}, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
end