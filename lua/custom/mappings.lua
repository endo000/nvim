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
    -- "<cmd> Telescope diagnostics bufnr=0 <CR>",
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

-- M.lspconfig = {
--   plugin = true,
--
--   n = {
--     ["gr"] = ""
--   }
-- }

return M
