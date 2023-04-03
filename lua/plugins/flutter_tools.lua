return {
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    opts = {
      flutter_path = "C:/Users/nsakn/fvm/versions/2.5.3/bin/flutter.bat",
      fvm = false,
      decorations = {
        statusline = {
          app_version = true,
          device = true,
        },
      },
      widget_guides = {
        enabled = true,
      },
      debugger = {
        enabled = false,
        register_configurations = function(_)
          local dap = require("dap")
          dap.adapters.dart = {
            type = "executable",
            command = "node",
            args = { "C:/tools/Dart-Code/out/dist/debug.js", "flutter" },
          }
          require("dap.ext.vscode").load_launchjs()
        end,
      },
    },
  },
}
