local M = {}

M.tmux_navigator = {
  plugin = true,

  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
  }
}

M.telescope = {
  n = {
    ["<leader>sd"] = {
      function()
        require('telescope.builtin').diagnostics({ bufnr = 0 })
      end,
      "document diagnostics"
    },
    ["<leader>sD"] = {
      function()
        require('telescope.builtin').diagnostics()
      end,
      "workspace diagnostics"
    },
    ["gr"] = {
      function()
        require('telescope.builtin').lsp_references()
      end,
      "workspace diagnostics"
    },
  }
}

M.general = {
  n = {
    ["tw"] = { "<cmd> set wrap! <CR>", "toggle wrap" }
  }
}

M.lspconfig = {
  plugin = true,

  n = {
    ["ld"] = {
      function ()
        vim.diagnostic.show()
      end,
      "show diagnostic",
    }

  }
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>dus"] = {
      function()
        local widgets = require("dap.ui.widgets");
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    },
    ["<leader>du"] = { function() require("dapui").toggle({}) end, "Dap UI" },
    ["<leader>de"] = { function() require("dapui").eval() end, "Eval" },

    ["<leader>dB"] = {
      function()
        require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: '))
      end,
      "Breakpoint Condition",
    },
    ["<leader>db"] = {
      function() require("dap").toggle_breakpoint() end, "Toggle Breakpoint",
    },
    ["<leader>dc"] = {
      function() require("dap").continue() end,
      "Continue",
    },
    ["<leader>dC"] = {
      function() require("dap").run_to_cursor() end,
      "Run to Cursor",
    },
    ["<leader>dg"] = {
      function() require("dap").goto_() end,
      "Go to line (no execute)",
    },
    ["<leader>di"] = {
      function() require("dap").step_into() end,
      "Step Into",
    },
    ["<leader>dj"] = {
      function() require("dap").down() end,
      "Down",
    },
    ["<leader>dk"] = {
      function() require("dap").up() end,
      "Up",
    },
    ["<leader>dl"] = {
      function() require("dap").run_last() end,
      "Run Last",
    },
    ["<leader>do"] = {
      function() require("dap").step_out() end,
      "Step Out",
    },
    ["<leader>dO"] = {
      function() require("dap").step_over() end,
      "Step Over",
    },
    ["<leader>dp"] = {
      function() require("dap").pause() end,
      "Pause",
    },
    ["<leader>dr"] = {
      function() require("dap").repl.toggle() end,
      "Toggle REPL",
    },
    ["<leader>ds"] = {
      function() require("dap").session() end,
      "Session",
    },
    ["<leader>dt"] = {
      function() require("dap").terminate() end,
      "Terminate",
    },
    ["<leader>dw"] = {
      function() require("dap.ui.widgets").hover() end,
      "Widgets",
    },
  }
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require("dap-go").debug_test()
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function()
        require("dap-go").debug_last()
      end,
      "Debug last go test"
    }
  }
}

return M
