return {
  "mfussenegger/nvim-dap",

  opts = function(_, opts)
    local dap = require("dap")
    vim.keymap.set("n", "<F29>", function() dap.restart() end, { desc = "Debugger: Restart (CTRL+F5)" })
    vim.keymap.set("n", "<Leader>dr", function() dap.run_last() end, { desc = "Debugger: Run Last" })

    return opts
  end,
}
