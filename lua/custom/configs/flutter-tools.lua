local opts = {
  debugger = { -- integrate with nvim dap + install dart code debugger
    enabled = true,
  },
  fvm = true, -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
}

return opts
