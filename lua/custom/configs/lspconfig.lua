local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
})

-- lspconfig.eslint.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
-- })

lspconfig.gopls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      }
    }
  }
})

lspconfig.denols.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
})

-- require('mason-lspconfig').setup_handlers({
--   function(server)
--     lspconfig[server].setup({
--       on_attach = on_attach,
--       capabilities = capabilities,
--     })
--   end,
--
--   ["gopls"] = function()
--     lspconfig["gopls"].setup({
--       on_attach = on_attach,
--       capabilities = capabilities,
--       cmd = { "gopls" },
--       filetypes = { "go", "gomod", "gowork", "gotmpl" },
--       root_dir = util.root_pattern("go.work", "go.mod", ".git"),
--       settings = {
--         gopls = {
--           completeUnimported = true,
--           usePlaceholders = true,
--           analyses = {
--             unusedparams = true,
--           }
--         }
--       }
--     })
--   end
-- })
