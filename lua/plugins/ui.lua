return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd("colorscheme tokyonight")
		end,
	},
	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 1000,
			fps = 60,
		},
		config = function(_, opts)
			local notify = require("notify")
			notify.setup(opts)
			vim.notify = notify
		end,
	},
	{
		"stevearc/dressing.nvim",
		dependencies = "nvim-telescope/telescope.nvim",
		opts = {
			input = {
				insert_only = false,
			},
			select = {
				-- backend = {},
				telescope = require("telescope.themes").get_ivy({
					layout_config = {
						height = 10,
					},
				}),
			},
		},
	},
	{
		"gelguy/wilder.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			modes = { ":" },
		},
		config = function(_, opts)
			local wilder = require("wilder")
			wilder.setup(opts)
			wilder.set_option(
				"renderer",
				wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
					highlighter = wilder.basic_highlighter(),
					highlights = {
						accent = wilder.make_hl(
							"WilderAccent",
							"Pmenu",
							{ { a = 1 }, { a = 1 }, { foreground = "#79a6da" } }
						),
					},
					left = { " ", wilder.popupmenu_devicons() },
					right = { " ", wilder.popupmenu_scrollbar() },
				}))
			)
		end,
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				separator_style = "slant",
				diagnostics = "nvim_lsp",
				hover = {
					enabled = true,
					delay = 0,
					reveal = { "close" },
				},
				custom_filter = function(buf, buf_nums)
					do
						return true
					end

					if string.find(vim.fn.bufname(buf), "[dap-terminal]", 0, true) then
						return false
					end

					return true
				end,
			},
		},
		config = function(_, opts)
			require("bufferline").setup(opts)
			require("mappings").bufferline()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {},
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup(nil, {
				css = true,
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
		config = function(_, opts)
			local todo_comments = require("todo-comments")
			todo_comments.setup(opts)
			require("mappings").todo_comments()
		end,
	},
	{
		"onsails/lspkind.nvim",
		config = function()
			require("lspkind").init({
				symbol_map = {
					Copilot = "",
				},
			})

			vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
		end,
	},
	{
		"folke/zen-mode.nvim",
		opts = {
			plugins = {
				tmux = { enabled = true }, -- disables the tmux statusline
				kitty = {
					enabled = true,
					font = "+2", -- font size increment
				},
			},
		},
		config = function(_, opts)
			require("zen-mode").setup(opts)
			require("mappings").zenmode()
		end,
	},
	{
		"folke/twilight.nvim",
		opts = {},
	},
	-- {
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	main = "ibl",
	-- 	---@module "ibl"
	-- 	---@type ibl.config
	-- 	opts = {},
	-- },
}
