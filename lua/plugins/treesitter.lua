return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "vimdoc",
        "vim",
        "yaml",
        "lua",
        "json",
        "markdown",
        "c_sharp",
        "go",
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      require("nvim-treesitter.install").compilers = { "gcc" }
      require("nvim-treesitter.install").prefer_git = false
    end,
  },
}
