vim.opt.number = true
vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.signcolumn = "yes:2"
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.mousemoveevent = true
vim.opt.termguicolors = true
vim.opt.conceallevel = 2

local signs = {
	Error = "",
	Warn = "",
	Info = "",
	Hint = "",
}
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

vim.keymap.set("n", "<ESC>", function()
	vim.cmd("nohlsearch")
end, { desc = "Disable highlight on search" })
