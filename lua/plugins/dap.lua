return {
	{
		"mfussenegger/nvim-dap",
		config = function(_, opts)
			local dap = require("dap")
			-- dap.defaults.fallback.terminal_win_cmd = "belowright 80vsplit new"
			dap.defaults.fallback.terminal_win_cmd = "belowright 10new"

			-- dap.defaults.fallback.external_terminal = {
			--   command = "tmux",
			--   args = { "split-pane", "-hc", "/home/aleksandr" },
			-- }
			-- dap.defaults.fallback.force_external_terminal = true
			-- dap.configurations.java = {
			--   {
			--     shortenCommandLine = "argfile",
			--   }
			-- }

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "dap-repl",
				group = vim.api.nvim_create_augroup("daprepl", { clear = true }),
				callback = function()
					vim.opt.number = false
					vim.opt.signcolumn = "no"
				end,
			})

			require("mappings").dap()
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {},
	},
	{
		"rcarriga/nvim-dap-ui",
		enabled = false,
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		opts = {
			layouts = {
				{
					elements = {
						{
							id = "scopes",
							size = 0.25,
						},
						{
							id = "breakpoints",
							size = 0.25,
						},
						{
							id = "repl",
							size = 0.5,
						},
					},
					position = "left",
					size = 40,
				},
				{
					elements = { {
						id = "console",
						size = 0.5,
					} },
					position = "bottom",
					size = 10,
				},
			},
		},
	},
	{
		"LiadOz/nvim-dap-repl-highlights",
	},
}
