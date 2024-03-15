return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
  },
  'folke/neodev.nvim',
  'tpope/vim-sleuth',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {},
  },
  {
    'numToStr/Comment.nvim',
    lazy = false,
    opts = {},
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      on_attach = function(bufnr)
        require('mappings').gitsigns()
      end
    },
  },
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<c-h>',  '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>',  '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>',  '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>',  '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },
  {
    "lambdalisue/suda.vim",
    cmd = { "SudaWrite", "SudaRead" }
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
    'epwalsh/obsidian.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    ft = 'markdown',
    opts = {
      workspaces = {
        {
          name = 'obsidian',
          path = '~/dev/obsidian',
        },
      }
    }
  },
}
