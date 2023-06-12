local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local opts = {
  sources = {
    formatting.gofumpt,
    formatting.goimports_reviser,
    formatting.golines,
    diagnostics.shellcheck,
    code_actions.shellcheck,
    formatting.shellharden,
    formatting.shfmt,
    -- diagnostics.mypy,
    -- diagnostics.ruff,
    formatting.black,
    diagnostics.hadolint
  }
}
return opts
