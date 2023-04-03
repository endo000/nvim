return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      dap.set_log_level("TRACE")

      dap.adapters.flutter = {
        type = "executable",
        command = "node",
        args = { "C:/tools/Dart-Code/out/dist/debug.js", "flutter" },
      }
      dap.adapters.flutter_test = {
        type = "executable",
        command = "node",
        args = { "C:/tools/Dart-Code/out/dist/debug.js", "flutter_test" },
      }

      -- require("dap.ext.vscode").load_launchjs()

      dap.configurations.dart = {
        {
          type = "flutter",
          request = "launch",
          name = "Launch flutter",
          dartSdkPath = "C:/Users/nsakn/fvm/versions/2.5.3/bin/cache/dart-sdk/",
          flutterSdkPath = "C:/Users/nsakn/fvm/versions/2.5.3/",
          program = "${workspaceFolder}/lib/main.dart",
          cwd = "${workspaceFolder}",
        },
        {
          type = "flutter_test",
          request = "launch",
          name = "Launch flutter test",
          dartSdkPath = "C:/Users/nsakn/fvm/versions/2.5.3/bin/cache/dart-sdk/",
          flutterSdkPath = "C:/Users/nsakn/fvm/versions/2.5.3/",
          program = "${workspaceFolder}/${file}",
          cwd = "${workspaceFolder}",
        },
      }
    end,
    keys = function()
      local dap = require("dap")
      return {
        { "<leader>dc", dap.continue, desc = "DAP continue" },
        { "<leader>ds", dap.step_over, desc = "DAP step over" },
        { "<leader>di", dap.step_into, desc = "DAP step into" },
        { "<leader>do", dap.step_out, desc = "DAP step out" },
        { "<F5>", dap.continue, desc = "DAP continue" },
        { "<F10>", dap.step_over, desc = "DAP step over" },
        { "<F11>", dap.step_into, desc = "DAP step into" },
        { "<F12>", dap.step_out, desc = "DAP step out" },
        { "<leader>db", dap.toggle_breakpoint, desc = "DAP toggle breakpoint" },
      }
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    keys = {
      {
        "<leader>du",
        function()
          require("dapui").toggle()
        end,
        desc = "DAP UI toggle",
      },
    },
    config = true,
  },
  {
    "Weissle/persistent-breakpoints.nvim",
    enabled = false,
    dependencies = { "mfussenegger/nvim-dap" },
    opts = {
      load_breakpoints_event = { "BufReadPost" },
    },
    keys = {
      {
        "<leader>db",
        function()
          require("persistent-breakpoints.api").toggle_breakpoint()
        end,
        desc = "DAP toggle breakpoint",
      },
    },
  },
}
