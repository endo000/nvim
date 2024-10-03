return {
	{
		"nvim-java/nvim-java",
		dependencies = {
			"nvim-java/lua-async-await",
			"nvim-java/nvim-java-core",
			"nvim-java/nvim-java-test",
			"nvim-java/nvim-java-dap",
			"nvim-java/nvim-java-refactor",
			"MunifTanjim/nui.nvim",
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{
				"williamboman/mason.nvim",
				opts = {
					registries = {
						"github:nvim-java/mason-registry",
						"github:mason-org/mason-registry",
					},
				},
			},
		},
	},
	{
		"akinsho/flutter-tools.nvim",
		opts = {
			fvm = true,
			closing_tags = {
				enabled = false,
			},
			debugger = {
				enabled = true,
			},
		},
	},
	{
		"benlubas/molten-nvim",
		build = ":UpdateRemotePlugins",
		config = function() end,
	},
	{
		"GCBallesteros/jupytext.nvim",
		opts = {},
	},
	{
		"leoluz/nvim-dap-go",
		opts = {},
	},
}
