local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local lsp = vim.lsp.buf

local telescope = require('telescope.builtin')

local default_opts = {noremap = true, silent = true}


-- map('', '<up>', ':echoe "Use k !!!"<CR>', default_opts)
-- map('', '<down>', ':echoe "Use j !!!"<CR>', default_opts)
-- map('', '<left>', ':echoe "Use h !!!"<CR>', default_opts)
-- map('', '<right>', ':echoe "Use l !!!"<CR>', default_opts)


-- General
map('i', 'jj', '<Esc>', {noremap = true})


-- Navigation
map('n', '<Tab>', ':BufferLineCycleNext<CR>', default_opts)
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', default_opts)

map('n', '<F6>', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', default_opts)
map('n', '<F8>', ':TagbarToggle<CR>', default_opts)

map("n", "<leader>u", "<cmd>Telescope undo<cr>", default_opts)

map('n', '<leader>ff', telescope.find_files, {})
map('n', '<leader>fg', telescope.live_grep, {})
map('n', '<leader>fb', telescope.buffers, {})
map('n', '<leader>fh', telescope.help_tags, {})


-- Code
map('i', '<C-Space>', 'v:lua.require"cmp".complete()', default_opts)

map('n', '<C-s>', ':FormatWrite<CR>:w<CR>',  default_opts)
map('i', '<C-s>', '<esc>:FormatWrite<CR>:w<CR>', default_opts)
map('n', '<Leader>f', ':FormatWrite<CR>:w<CR>', default_opts)


-- Lsp
autocmd('LspAttach', {
  group = augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Включаем автодополнение по нажатию <C-x><C-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Локальные отображения для буфера
    local opts = { buffer = ev.buf }

    map('n', 'gD', lsp.declaration, opts)
    map('n', 'gd', lsp.definition, opts)
    map('n', 'gi', lsp.implementation, opts)
    map('n', 'gr', lsp.references, opts)

    map('n', 'K', lsp.hover, opts)
    map('n', '<C-k>', lsp.signature_help, opts)

    map('n', '<space>wa', lsp.add_workspace_folder, opts)
    map('n', '<space>wr', lsp.remove_workspace_folder, opts)
    map('n', '<space>wl', function() 
      print(vim.inspect(lsp.list_workspace_folders())) 
    end, opts)

    map('n', '<space>D', lsp.type_definition, opts)
    map('n', '<space>rn', lsp.rename, opts)
    map({ 'n', 'v' }, '<space>ca', lsp.code_action, opts)
   
    -- map('n', '<space>f', function()
    --   lsp.format { async = true }
    -- end, opts)
  end,
})


-- Neovide
if vim.g.neovide then
  vim.g.neovide_scale_factor = 0.7 * vim.g.neovide_scale_factor

    map({ "n", "v" }, "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
    map({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
    map({ "n" , "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
end