local plugins = {
  {
    "christoomey/vim-tmux-navigator",
    keys = { "<C-h>", "<C-j>", "<C-k>", "<C-l>" },
    config = function()
      require("core.utils").load_mappings("tmux_navigator")
    end
  },
  {
    "lambdalisue/suda.vim",
    cmd = { "SudaWrite", "SudaRead" }
  },
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G" }
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = true,
  },
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { enable = true },
      renderer = {
        icons = {
          show = { git = true }
        }
      }
    }
  },

  {
    "zbirenbaum/copilot.lua",
    build = ":Copilot auth",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = false,
        auto_trigger = true
      },
      panel = {
        enabled = false,
        keymap = { accept = "<leader>co" }
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        config = true,
      },
      {
        "jose-elias-alvarez/null-ls.nvim",
        opts = function()
          return require("custom.configs.null-ls")
        end
      },
    },
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end
  },
  {
    "williamboman/mason.nvim",
    opts = function()
      return require("custom.configs.mason")
    end
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "zbirenbaum/copilot-cmp",
      config = true
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = "copilot" }
      }))
    end
  },


  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = {
        "go",
        "dart",
        "javascript",
        "python",
      }
    }
  },

  {
    "mfussenegger/nvim-dap",
    ft = 'dart',
    config = function()
      -- local dap = require('dap')
      -- dap.adapters.dart = {
      --   type = "executable",
      --   command = "node",
      --   args = { "/home/aleksandr/dev/Dart-Code/out/dist/debug.js", "flutter" }
      -- }
      -- dap.configurations.dart = {
      --   {
      --     type = "dart",
      --     request = "launch",
      --     name = "Launch flutter",
      --     dartSdkPath = "/home/aleksandr/fvm/version/2.5.3/bin/cache/dart-sdk/",
      --     flutterSdkPath = "/home/aleksandr/fvm/versions/2.5.3/",
      --     program = "${workspaceFolder}/lib/main.dart",
      --     cwd = "${workspaceFolder}",
      --   }
      -- }
    end
  },

  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    opts = {
      dap_configurations = {
        {
          type = "go",
          name = "cico-backend",
          args = { "serve" },
          program = "/home/aleksandr/dev/cico-backend",
          request = "launch",
        },
      },
    },
    init = function()
      require("core.utils").load_mappings("dap_go")
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        config = true,
      },
    },
    init = function()
      require("core.utils").load_mappings("dap")
    end
  },

  {
    "olexsmir/gopher.nvim",
    build = ":GoInstallDeps",
    ft = "go",
    config = true,
  },
  {
    'akinsho/flutter-tools.nvim',
    ft = "dart",
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = function()
      return require("custom.configs.flutter-tools")
    end,
    config = function(_, opts)
      require("core.utils").load_mappings("lspconfig")
      require("flutter-tools").setup(opts)
      require("telescope").load_extension("flutter")
    end
  },
  {
    "elkowar/yuck.vim",
    ft = "yuck",
  }
}

return plugins
