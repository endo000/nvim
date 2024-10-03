return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-lua/popup.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-dap.nvim",
			"nvim-telescope/telescope-media-files.nvim",
			"crispgm/telescope-heading.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			{
				"nvim-telescope/telescope-ui-select.nvim",
			},
		},
		opts = {
			defaults = {
				file_ignore_patterns = {
					-- ".git/.*",
					-- ".dart_tool",
					-- ".gradle/",
					-- ".fvm",
					-- ".idea",
					-- "build",
				},
			},
			pickers = {
				builtin = {
					theme = "dropdown",
					previewer = false,
				},
				current_buffer_fuzzy_find = {
					theme = "ivy",
					skip_empty_lines = true,
				},
				commands = {
					theme = "ivy",
				},
				vim_options = {
					theme = "ivy",
				},
			},
			extensions = {
				file_browser = {
					theme = "ivy",
					grouped = false,
					depth = false,
					auto_depth = true,
					hidden = true,
					-- disables netrw and use telescope-file-browser in its place
					hijack_netrw = true,
				},
				dap = {
					theme = "ivy",
				},
				media_files = {
					find_cmd = "rg",
				}
			},
		},
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)
			telescope.load_extension("file_browser")
			telescope.load_extension("heading")
			-- telescope.load_extension("dap")
			telescope.load_extension("fzf")
			telescope.load_extension("ui-select")
			telescope.load_extension("flutter")
			telescope.load_extension('media_files')

			require("mappings").telescope()
		end,
	},
}
