local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local opts = {
  debug = true,
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
    diagnostics.hadolint,
    -- code_actions.eslint,
    -- diagnostics.eslint,
    -- formatting.eslint,
    -- code_actions.xo,
    -- diagnostics.xo,
    -- formatting.xo,
    formatting.demo_fmt,
  }
}
return opts
