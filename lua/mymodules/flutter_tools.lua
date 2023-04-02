require('flutter-tools').setup {
    flutter_path = 'C:/Users/nsakn/fvm/versions/3.3.5/bin/flutter.bat',
    fvm = false,
    decorations = {
        statusline = {
            app_version = true,
            device = true,
        }
    },
    widget_guides = {
        enabled = true
    },
    debugger = {
        enabled = true,
        -- register_configurations = function(_)
        --     require("dap").adapters.dart = {
        --         type = "executable",
        --         -- As of this writing, this functionality is open for review in https://github.com/flutter/flutter/pull/91802
        --         command = "C:/Users/nsakn/fvm/versions/3.7.5/bin/flutter.bat",
        --         args = { "debug_adapter" }
        --     }
        --     require("dap").configurations.dart = {
        --         {
        --             type = "dart",
        --             request = "launch",
        --             name = "Launch Flutter Program",
        --             -- The nvim-dap plugin populates this variable with the filename of the current buffer
        --             program = "${file}",
        --             -- The nvim-dap plugin populates this variable with the editor's current working directory
        --             cwd = "${workspaceFolder}",
        --         }
        --     }
        -- end,
    }
}

function _G.statusLine()
    return vim.g.flutter_tools_decorations.app_version
end

vim.opt.statusline = '%!v:statusLine()'

-- require('telescope').load_extension("flutter")
-- require('telescope').extensions.flutter.fvm()
