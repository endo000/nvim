return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "c_sharp", "go" })
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      require("nvim-treesitter.install").compilers = { "gcc" }
      require("nvim-treesitter.install").prefer_git = false
    end,
  },
}
