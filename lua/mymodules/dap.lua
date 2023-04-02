local dap = require('dap')
local dapui = require('dapui')

dapui.setup {}

dap.adapters.dart = {
    type = "executable",
    command = "node",
    args = {"C:/tools/Dart-Code/out/dist/debug.js", "flutter"}
}
dap.configurations.dart = {
    {
        type = "dart",
        request = "launch",
        name = "Launch flutter",
        dartSdkPath = "C:/Users/nsakn/fvm/version/2.5.3/bin/cache/dart-sdk/",
        flutterSdkPath = "C:/Users/nsakn/fvm/versions/2.5.3/",
        program = "${workspaceFolder}/lib/main.dart",
        cwd = "${workspaceFolder}",
    }
}

require('persistent-breakpoints').setup ({
    load_breakpoints_event = { 'BufReadPost' }
})

local bp = require('persistent-breakpoints.api')
local wk = require('which-key')
wk.register({
    d = {
        name = 'DAP',
        b = { bp.toggle_breakpoint, 'Toggle breakpoint', },
        c = { dap.continue, 'DAP continue', },
        s = { dap.step_over, 'DAP step over', },
        u = { dapui.toggle, 'DAP UI toggle', }
    }
}, { prefix = "<leader>" })
