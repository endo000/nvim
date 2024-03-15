return {
	bufferline = function()
		vim.keymap.set("n", "]b", function()
			vim.cmd("BufferLineCycleNext")
		end, { desc = "Buffer: Next buffer" })
		vim.keymap.set("n", "[b", function()
			vim.cmd("BufferLineCyclePrev")
		end, { desc = "Buffer: Previous buffer" })
		vim.keymap.set("n", "<C-X>", function()
			vim.api.nvim_buf_delete(0, { force = true })
		end, { desc = "Buffer: Close buffer" })

		vim.keymap.set("n", "<Leader>]b", function()
			vim.cmd("BufferLineMoveNext")
		end, { desc = "Buffer: Move buffer forward" })
		vim.keymap.set("n", "<Leader>[b", function()
			vim.cmd("BufferLineMovePrev")
		end, { desc = "Buffer: Move buffer backward" })

		vim.keymap.set("n", "<Leader>bl", function()
			vim.cmd("BufferLineCloseRight")
		end, { desc = "Buffer: Close buffers to the right" })
		vim.keymap.set("n", "<Leader>bh", function()
			vim.cmd("BufferLineCloseLeft")
		end, { desc = "Buffer: Close buffers to the left" })
		vim.keymap.set("n", "<Leader>bo", function()
			vim.cmd("BufferLineCloseOthers")
		end, { desc = "Buffer: Close other buffers" })
	end,

	todo_comments = function()
		local todo_comments = require("todo-comments")
		vim.keymap.set("n", "]t", todo_comments.jump_next, { desc = "TODO: Next" })
		vim.keymap.set("n", "[t", todo_comments.jump_prev, { desc = "TODO: Previous" })
	end,

	telescope = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Telescope: [S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Telescope: [S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Telescope: [S]earch [F]iles" })
		vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "Telescope: [S]earch [S]elect Telescope" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Telescope: [S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Telescope: [S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Telescope: [S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Telescope: [S]earch [R]esume" })
		vim.keymap.set(
			"n",
			"<leader>s.",
			builtin.oldfiles,
			{ desc = 'Telescope: [S]earch Recent Files ("." for repeat)' }
		)
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Telescope: [ ] Find existing buffers" })
		vim.keymap.set(
			"n",
			"<leader>/",
			builtin.current_buffer_fuzzy_find,
			{ desc = "Telescope: [/] Fuzzily search in current buffer" }
		)

		-- vim.api.nvim_set_keymap("n", "<space>fb", ":Telescope file_browser<CR>", { noremap = true })
		-- open file_browser with the path of the current buffer
		vim.keymap.set("n", "<space>fb", function()
			require("telescope").extensions.file_browser.file_browser({
				path = vim.fn.expand("%:p:h"),
				select_buffer = true,
			})
		end, {
			desc = "File browser",
			noremap = true,
		})
	end,

	gitsigns = function()
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		-- Actions
		map("n", "<leader>hs", gs.stage_hunk)
		map("n", "<leader>hr", gs.reset_hunk)
		map("v", "<leader>hs", function()
			gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)
		map("v", "<leader>hr", function()
			gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)
		map("n", "<leader>hS", gs.stage_buffer)
		map("n", "<leader>hu", gs.undo_stage_hunk)
		map("n", "<leader>hR", gs.reset_buffer)
		map("n", "<leader>hp", gs.preview_hunk)
		map("n", "<leader>hb", function()
			gs.blame_line({ full = true })
		end)
		map("n", "<leader>tb", gs.toggle_current_line_blame)
		map("n", "<leader>hd", gs.diffthis)
		map("n", "<leader>hD", function()
			gs.diffthis("~")
		end)
		map("n", "<leader>td", gs.toggle_deleted)

		-- Text object
		map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
	end,

	lsp = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		local telescope = require("telescope.builtin")
		map("gd", telescope.lsp_definitions, "[G]oto [D]efinition")
		map("gr", telescope.lsp_references, "[G]oto [R]eferences")
		map("gI", telescope.lsp_implementations, "[G]oto [I]mplementation")
		map("<leader>D", telescope.lsp_type_definitions, "Type [D]efinition")
		map("<leader>ld", telescope.lsp_document_symbols, "[D]ocument [S]ymbols")
		map("<leader>lw", telescope.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
		map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
		map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
		map("K", vim.lsp.buf.hover, "Hover Documentation")
		map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		map("[d", vim.diagnostic.goto_prev, "Previous [D]iagnostic")
		map("]d", vim.diagnostic.goto_next, "Next [D]iagnostic")
	end,

	conform = function()
		vim.keymap.set({ "n", "v" }, "<leader>fm", function()
			require("conform").format({ lsp_fallback = true })
		end, { desc = "[F]or[m]at" })
	end,

	dap = function()
		local dap = require("dap")
		local dap_ui_widget = require("dap.ui.widgets")
		vim.keymap.set("n", "<F5>", function()
			dap.continue()
		end, { desc = "DAP continue" })
		vim.keymap.set("n", "<Leader><F5>", function()
			dap.restart()
		end, { desc = "DAP restart" })
		vim.keymap.set("n", "<F10>", function()
			dap.step_over()
		end, { desc = "DAP step over" })
		vim.keymap.set("n", "<F11>", function()
			dap.step_into()
		end, { desc = "DAP step into" })
		vim.keymap.set("n", "<F12>", function()
			dap.step_out()
		end, { desc = "DAP step out" })
		vim.keymap.set("n", "<Leader>db", function()
			dap.toggle_breakpoint()
		end, { desc = "DAP toggle breakpoint" })
		vim.keymap.set("n", "<Leader>dB", function()
			dap.set_breakpoint()
		end, { desc = "DAP set breakpoint" })
		vim.keymap.set("n", "<Leader>dl", function()
			dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end, { desc = "DAP log point breakpoint" })
		vim.keymap.set("n", "<Leader>dr", function()
			dap.repl.open({
				width = 60,
			}, "belowright vsplit")
		end, { desc = "DAP open repl" })
		vim.keymap.set("n", "<Leader>dl", function()
			dap.run_last()
		end, { desc = "DAP run last" })
		vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
			dap_ui_widget.hover()
		end, { desc = "DAP hover" })
		vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
			dap_ui_widget.preview()
		end, { desc = "DAP preview" })
		vim.keymap.set("n", "<Leader>df", function()
			-- widgets.centered_float(widgets.frames)
			local frames = dap_ui_widget.sidebar(dap_ui_widget.frames)
			frames.open()
		end, { desc = "DAP frames" })
		vim.keymap.set("n", "<Leader>ds", function()
				dap_ui_widget.centered_float(dap_ui_widget.scopes)
		end, { desc = "DAP scopes" })
	end,

	dapui = function() end,
}
