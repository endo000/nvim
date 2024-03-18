local wrap = function(func, ...)
	local args = { ... }
	return function()
		func(unpack(args))
	end
end

local keymap_group = ""
local keymap = function(opts)
	local mode = opts.mode or "n"
	opts.mapopts.desc = keymap_group .. ": " .. opts.mapopts.desc
	vim.keymap.set(mode, opts.keys, opts.func, opts.mapopts)
end

local M = {}

M.bufferline = function()
	keymap_group = "Buffer"

	keymap({ keys = "]b", func = wrap(vim.cmd, "BufferLineCycleNext"), mapopts = { desc = "Next [b]uffer" } })
	keymap({ keys = "[b", func = wrap(vim.cmd, "BufferLineCyclePrev"), mapopts = { desc = "Previous [b]uffer" } })
	keymap({
		keys = "<C-X>",
		func = wrap(vim.api.nvim_buf_delete, 0, { force = true }),
		mapopts = { desc = "[C]lose buffer" },
	})
	keymap({
		keys = "<Leader>]b",
		func = wrap(vim.cmd, "BufferLineMoveNext"),
		mapopts = { desc = "Move [b]uffer forward" },
	})
	keymap({
		keys = "<Leader>[b",
		func = wrap(vim.cmd, "BufferLineMovePrev"),
		mapopts = { desc = "Move [b]uffer backward" },
	})
	keymap({
		keys = "<Leader>bl",
		func = wrap(vim.cmd, "BufferLineCloseRight"),
		mapopts = { desc = "Close [b]uffers to the right" },
	})
	keymap({
		keys = "<Leader>bh",
		func = wrap(vim.cmd, "BufferLineCloseLeft"),
		mapopts = { desc = "Close [b]uffers to the left" },
	})
	keymap({
		keys = "<Leader>bo",
		func = wrap(vim.cmd, "BufferLineCloseOthers"),
		mapopts = { desc = "Close [o]ther [b]uffers" },
	})
end

M.todo_comments = function()
	keymap_group = "TODO"

	local todo_comments = require("todo-comments")
	keymap({ keys = "]t", func = todo_comments.jump_next, mapopts = { desc = "Next" } })
	keymap({ keys = "[t", func = todo_comments.jump_prev, mapopts = { desc = "Previous" } })
end

M.telescope = function()
	keymap_group = "Telescope"

	local builtin = require("telescope.builtin")
	keymap({ keys = "<leader>sh", func = builtin.help_tags, mapopts = { desc = "[S]earch [h]elp" } })
	keymap({ keys = "<leader>sk", func = builtin.keymaps, mapopts = { desc = "[S]earch [k]eymaps" } })
	keymap({ keys = "<leader>sf", func = builtin.find_files, mapopts = { desc = "[S]earch [f]iles" } })
	keymap({
		keys = "<leader>sc",
		func = function()
			builtin.find_files({ cwd = vim.fn.expand("%:p:h") })
		end,
		mapopts = { desc = "[S]earch Files [c]wd" },
	})
	keymap({
		keys = "<leader>ss",
		func = builtin.builtin,
		mapopts = { desc = "[S]earch [s]elect Telescope" },
	})
	keymap({
		keys = "<leader>sw",
		func = builtin.grep_string,
		mapopts = { desc = "[S]earch current [w]ord" },
	})
	keymap({ keys = "<leader>sg", func = builtin.live_grep, mapopts = { desc = "[S]earch by [g]rep" } })
	keymap({
		keys = "<leader>sd",
		func = builtin.diagnostics,
		mapopts = { desc = "[S]earch [D]iagnostics" },
	})
	keymap({ keys = "<leader>sr", func = builtin.resume, mapopts = { desc = "[S]earch [r]esume" } })
	keymap({
		keys = "<leader>s.",
		func = builtin.oldfiles,
		mapopts = { desc = '[S]earch Recent Files ("." for repeat)' },
	})
	keymap({
		keys = "<leader><leader>",
		func = builtin.buffers,
		mapopts = { desc = "[ ] Find existing buffers" },
	})
	keymap({
		keys = "<leader>/",
		func = builtin.current_buffer_fuzzy_find,
		mapopts = { desc = "[/] Fuzzily search in current buffer" },
	})

	-- open file_browser with the path of the current buffer
	keymap({
		keys = "<leader>fb",
		func = wrap(require("telescope").extensions.file_browser.file_browser, {
			path = vim.fn.expand("%:p:h"),
			select_buffer = true,
		}),
		mapopts = { desc = "[F]ile [b]rowser" },
	})
end

M.gitsigns = function()
	keymap_group = "Gitsigns"

	local gs = package.loaded.gitsigns

	keymap({ keys = "]c", func = gs.next_hunk, mapopts = { desc = "Next hunk" } })
	keymap({ keys = "[c", func = gs.prev_hunk, mapopts = { desc = "Previous hunk" } })
	keymap({ keys = "<Leader>hs", func = gs.stage_hunk, mapopts = { desc = "[S]tage [h]unk" } })
	keymap({ keys = "<Leader>hr", func = gs.reset_hunk, mapopts = { desc = "[R]eset [h]unk" } })
	keymap({
		mode = "v",
		keys = "<Leader>hs",
		func = function()
			gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end,
		mapopts = { desc = "[S]tage [h]unk" },
	})
	keymap({
		mode = "v",
		keys = "<Leader>hr",
		func = function()
			gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end,
		mapopts = { desc = "[R]eset [h]unk" },
	})

	keymap({ keys = "<Leader>hS", func = gs.stage_buffer, mapopts = { desc = "[S]tage buffer" } })
	keymap({ keys = "<Leader>hu", func = gs.undo_stage_hunk, mapopts = { desc = "[U]ndo stage [h]unk" } })
	keymap({ keys = "<Leader>hR", func = gs.reset_buffer, mapopts = { desc = "[R]eset buffer" } })
	keymap({ keys = "<Leader>hp", func = gs.preview_hunk, mapopts = { desc = "[P]review hunk" } })
	keymap({ keys = "<Leader>hb", func = wrap(gs.blame_line, { fill = true }), mapopts = { desc = "[B]lame [l]ine" } })
	keymap({ keys = "<Leader>tb", func = gs.toggle_current_line_blame, mapopts = { desc = "Current line [b]lame" } })
	keymap({ keys = "<Leader>hd", func = gs.diffthis, mapopts = { desc = "[D]iff [h]unk" } })
	keymap({ keys = "<Leader>hD", func = wrap(gs.diffthis, "~"), mapopts = { desc = "[D]iff buffer" } })
	-- TODO: fill desc
	keymap({ keys = "<Leader>td", func = gs.toggle_deleted, mapopts = { desc = "[T]oggle [d]eleted" } })
	-- Text object
	keymap({
		mode = { "o", "x" },
		keys = "ih",
		func = wrap(vim.cmd, "Gitsigns select_hunk"),
		mapopts = { desc = "Select hunk" },
	})
end

M.lsp = function(event)
	keymap_group = "LSP"

	local telescope = require("telescope.builtin")

	keymap({
		keys = "[d",
		func = vim.diagnostic.goto_prev,
		mapopts = { desc = "Previous [D]iagnostic", buffer = event.buf },
	})
	keymap({
		keys = "]d",
		func = vim.diagnostic.goto_next,
		mapopts = { desc = "Next [D]iagnostic", buffer = event.buf },
	})
	keymap({
		keys = "gd",
		func = telescope.lsp_definitions,
		mapopts = { desc = "[G]oto [D]efinition", buffer = event.buf },
	})
	keymap({
		keys = "gr",
		func = telescope.lsp_references,
		mapopts = { desc = "[G]oto [R]eferences", buffer = event.buf },
	})
	keymap({
		keys = "gI",
		func = telescope.lsp_implementations,
		mapopts = { desc = "[G]oto [I]mplementation", buffer = event.buf },
	})
	keymap({
		keys = "<Leader>D",
		func = telescope.lsp_type_definitions,
		mapopts = { desc = "Type [D]efinition", buffer = event.buf },
	})
	keymap({
		keys = "<Leader>ld",
		func = telescope.lsp_document_symbols,
		mapopts = { desc = "[D]ocument [S]ymbols", buffer = event.buf },
	})
	keymap({
		keys = "<Leader>lw",
		func = telescope.lsp_dynamic_workspace_symbols,
		mapopts = { desc = "[W]orkspace [S]ymbols", buffer = event.buf },
	})
	keymap({ keys = "<Leader>rn", func = vim.lsp.buf.rename, mapopts = { desc = "[R]e[n]ame", buffer = event.buf } })
	keymap({
		keys = "<Leader>ca",
		func = vim.lsp.buf.code_action,
		mapopts = { desc = "[C]ode [A]ction", buffer = event.buf },
	})
	keymap({ keys = "K", func = vim.lsp.buf.hover, mapopts = { desc = "Hover Documentation", buffer = event.buf } })
	keymap({
		keys = "gD",
		func = vim.lsp.buf.declaration,
		mapopts = { desc = "[G]oto [D]eclaration", buffer = event.buf },
	})
end

M.conform = function()
	keymap_group = "Conform"

	local conform = require("conform")

	keymap({
		mode = { "n", "v" },
		keys = "<Leader>fm",
		func = wrap(conform.format, { lsp_fallback = true }),
		mapopts = { desc = "[F]or[m]at" },
	})
end

M.dap = function()
	keymap_group = "DAP"

	local dap = require("dap")
	local dap_ui_widget = require("dap.ui.widgets")

	keymap({ keys = "<F5>", func = dap.continue, mapopts = { desc = "Continue" } })
	keymap({ keys = "<Leader><F5>", func = dap.restart, mapopts = { desc = "Restart" } })
	keymap({ keys = "<F10>", func = dap.step_over, mapopts = { desc = "Step over" } })
	keymap({ keys = "<F11>", func = dap.step_into, mapopts = { desc = "Step into" } })
	keymap({ keys = "<F12>", func = dap.step_out, mapopts = { desc = "Step out" } })
	keymap({ keys = "<Leader>db", func = dap.toggle_breakpoint, mapopts = { desc = "Toggle breakpoint" } })
	keymap({ keys = "<Leader>dB", func = dap.set_breakpoint, mapopts = { desc = "Set breakpoint" } })
	keymap({
		keys = "<Leader>dl",
		func = function()
			dap.set_breakpoint(nil, nil, vim.fn.input("Log point message"))
		end,
		mapopts = { desc = "Log point breakpoint" },
	})
	keymap({
		keys = "<Leader>dr",
		func = wrap(dap.repl.open, { width = 60 }, "belowright vsplit"),
		mapopts = { desc = "Open REPL" },
	})
	keymap({ keys = "<Leader>dl", func = dap.run_last, mapopts = { desc = "Run last" } })
	keymap({ mode = { "n", "v" }, keys = "<Leader>dh", func = dap_ui_widget.hover, mapopts = { desc = "Hover" } })
	keymap({ mode = { "n", "v" }, keys = "<Leader>dh", func = dap_ui_widget.preview, mapopts = { desc = "Preview" } })
	-- widgets.centered_float(widgets.frames)
	keymap({
		keys = "<Leader>df",
		func = dap_ui_widget.sidebar(dap_ui_widget.frames).open,
		mapopts = { desc = "Frames" },
	})
	keymap({
		keys = "<Leader>ds",
		func = wrap(dap_ui_widget.centered_float, dap_ui_widget.scopes),
		mapopts = { desc = "Scopes" },
	})
end

M.zenmode = function()
	keymap_group = "Zenmode"

	local zenmode = require("zen-mode")
	keymap({ keys = "<Leader>z", func = zenmode.toggle, mapopts = { desc = "Toggle" } })
end

M.trouble = function()
	keymap_group = "Trouble"

	local trouble = require("trouble")

	keymap({ keys = "<Leader>xx", func = trouble.toggle, mapopts = { desc = "Toggle" } })
	keymap({
		keys = "<Leader>xw",
		func = wrap(trouble.toggle, "workspace_diagnostics"),
		mapopts = { desc = "[W]orkspace diagnostics" },
	})
	keymap({
		keys = "<Leader>xd",
		func = wrap(trouble.toggle, "document_diagnostics"),
		mapopts = { desc = "[D]ocument diagnostics" },
	})
	keymap({ keys = "<Leader>xq", func = wrap(trouble.toggle, "quickfix"), mapopts = { desc = "[Q]uickfix" } })
	keymap({ keys = "<Leader>xl", func = wrap(trouble.toggle, "loclist"), mapopts = { desc = "[L]oclist" } })
	keymap({ keys = "<Leader>xr", func = wrap(trouble.toggle, "lsp_references"), mapopts = { desc = "[R]eferennces" } })
end

return M
