return {
  -- Update colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
    },
  },

  -- Colorschemes
  { "sainnhe/everforest", lazy = true },
  { "morhetz/gruvbox", lazy = true },
  { "nanotech/jellybeans.vim", lazy = true },
  { "cocopon/iceberg.vim", lazy = true },

  -- Framework tools
  {
    "fatih/vim-go",
    build = ":GoUpdateBinaries",
  },

  -- Git
  { "tpope/vim-fugitive" },

  -- Test
  { "vim-test/vim-test" },

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = { ".fvm", ".dart_tool", ".git", "android", "ios", "build", ".idea", "assets", "%.meta" },
      },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
  },
}
