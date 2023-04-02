require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls',
        'csharp_ls',
        'jsonls',
        -- 'gopls',
        -- 'golangci_lint_ls',
    }
})


local lsp = require('lsp-zero').preset({})
lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr }
    local wk = require('which-key')
    wk.register({
        g = {
            name = 'LSP',
            D = { vim.lsp.buf.declaration, 'Declaration' },
            d = { vim.lsp.buf.definition, 'Definition' },
            i = { vim.lsp.buf.implementation, 'Implementation' },
            s = { vim.lsp.buf.signature_help, 'Signature help' },
            o = { vim.lsp.buf.type_definition, 'Type definition' },
            r = { vim.lsp.buf.references, 'References' },
        },
        ['<leader>'] = {
            w = {
                name = 'Workspace',
                a = { vim.lsp.buf.add_workspace_folder, 'Add workspace folder' },
                r = { vim.lsp.buf.remove_workspace_folder, 'Remove workspace folder' },
                l = { function() print(vim.inspect(vim.lsp.list_workspace_folders())) end, 'List workspace folders' },
            },
            ['fd'] = {
                function()
                    vim.lsp.buf.format { async = true }
                end, 'Format'
            },
            ['rn'] = { vim.lsp.buf.rename, 'Rename' },
            ['ca'] = { vim.lsp.buf.code_action, 'Code action' },
            e = { vim.diagnostic.open_float, 'Diagnostic float' },
            q = { vim.diagnostic.setloclist, 'Set location list' }
        },
        K = { vim.lsp.buf.hover, 'Hover' },
        ['[d'] = { vim.diagnostic.goto_prev, 'Previous diagnostic' },
        [']d'] = { vim.diagnostic.goto_next, 'Next diagnostic' },
    }, opts)
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
lsp.setup()

local cmp = require('cmp')
cmp.setup({
    sources = {
        { name = 'copilot' },
        { name = 'nvim_lsp' },
    },
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false
        }),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
})

vim.g.diagnostics_active = true
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = true,
    }
)
