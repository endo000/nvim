local opts = {
  -- debugger = {
               -- integrate with nvim dap + install dart code debugger
    -- enabled = false,
    -- register_configurations = function(paths)
      -- require("dap").configurations.dart = {
        -- {
          -- cwd = "/home/aleksandr/dev/coci-admin-panel-flutter",
          -- dartSdkPath = "/home/aleksandr/fvm/versions/3.3.10/bin/cache/dart-sdk",
          -- flutterSdkPath = "/home/aleksandr/fvm/versions/3.3.10",
          -- name = "Launch current file",
          -- program = "${file}",
          -- request = "launch",
          -- type = "dart"
        -- }
      -- }
    -- end,
  -- },
  debugger = {
    enabled = true;
  },
  fvm = true, -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
}

return opts
