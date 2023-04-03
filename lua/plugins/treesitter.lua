return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      require("nvim-treesitter.install").compilers = { "gcc" }
      require("nvim-treesitter.install").prefer_git = false
    end,
  },
}
