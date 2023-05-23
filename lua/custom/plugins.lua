local plugins = {
  { "williamboman/mason-lspconfig.nvim" },
  { "tpope/vim-fugitive",               cmd = { "Git", "G" } },
  {
    "christoomey/vim-tmux-navigator",
    keys = { "<C-h>", "<C-j>", "<C-k>", "<C-l>" },
    config = function()
      require("core.utils").load_mappings("tmux_navigator")
    end
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
  },
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls"
      }
    },
  },
  {
    'akinsho/flutter-tools.nvim',
    ft = "dart",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    opts = {
      fvm = true,
    },
    config = function(_, opts)
      require("core.utils").load_mappings("lspconfig")
      require("flutter-tools").setup(opts)
      require("telescope").load_extension("flutter")
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { enable = true },
      renderer = { icons = { show = { git = true } } }
    }
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = {
        enabled = true,
        keymap = { accept = "<leader>co" }
      },
    },
  },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   lazy = false,
  --   config = true,
  -- },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   opts = function(_, opts)
  --     vim.list_extend(opts.sources, { name = "copilot" })
  --   end
  -- }
}

return plugins
