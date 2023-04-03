-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

-- Notes
vim.g.notes_directories = { "C:/dev/notes" }
vim.g.notes_shadowdir = "C:/dev/notes/shadow"

-- Everforest theme
vim.g.everforest_background = "hard"
vim.g.everforest_better_performance = 1
vim.g.everforest_disable_italic_comment = 1

-- Test plugin
vim.g["test#dart#fluttertest#executable"] = "fvm flutter test"

-- LSP options
vim.g.diagnostics_active = true
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = true,
})
