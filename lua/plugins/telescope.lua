return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      'nvim-telescope/telescope-dap.nvim',
      'crispgm/telescope-heading.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
      {
        'nvim-telescope/telescope-ui-select.nvim'
      },
    },
    opts = {
      pickers = {
        builtin = {
          theme = 'dropdown',
          previewer = false,
        },
        current_buffer_fuzzy_find = {
          theme = 'ivy',
          skip_empty_lines = true,
        },
        commands = {
          theme = 'ivy',
        }
      },
      extensions = {
        file_browser = {
          theme = 'ivy',
          grouped = false,
          depth = false,
          auto_depth = true,
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
        },
      },
    },
    config = function(_, opts)
      local telescope = require('telescope')
      telescope.setup(opts)
      telescope.load_extension('file_browser')
      telescope.load_extension('heading')
      telescope.load_extension('dap')
      telescope.load_extension('fzf')
      telescope.load_extension('ui-select')
      telescope.load_extension('flutter')

      require('mappings').telescope()
    end,
  },
}
