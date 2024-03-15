return {
  'nvim-treesitter/nvim-treesitter',
  dependencies =
  {
    'RRethy/nvim-treesitter-endwise',
    'LiadOz/nvim-dap-repl-highlights',
  },
  build = ':TSUpdate',
  opts = {
    ensure_installed = { 'lua', 'go', 'dart', 'dap_repl', },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
    endwise = { enable = true },
  },
  config = function(_, opts)
    require('nvim-dap-repl-highlights').setup()
    require('nvim-treesitter.configs').setup(opts)
  end,
}
