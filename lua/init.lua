vim.g.mapleader = ','

require('nvim-surround').setup {}
require('Comment').setup {}
require('dap').set_log_level('TRACE')

require('nvim-treesitter.configs').setup {
    ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'c_sharp' },
    highlight = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'gnn', -- set to `false` to disable one of the mappings
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm',
        }
    },
    indent = {
        enable = true
    },
    prefer_git = false,
}

local wk = require('which-key')

local modes = { 'n', 'v' }
for _, mode in ipairs(modes) do
    wk.register({
        D = { '"_d', 'Delete blackhole' },
        p = { '"+p', 'Paste from clipboard' },
        P = { '"+P', 'Paste from clipboard' },
        y = { '"+y', 'Yank to clipboard' },
        Y = { '"+Y', 'Yank to clipboard' }
    }, { mode = mode, prefix = '<leader>' })
end


wk.register({
    ['<C-h>'] = { '<C-w>h', 'Move to left window' },
    ['<C-j>'] = { '<C-w>j', 'Move to upper window' },
    ['<C-k>'] = { '<C-w>k', 'Move to down window' },
    ['<C-l>'] = { '<C-w>l', 'Move to right window' }
})
