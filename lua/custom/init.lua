-- vim.opt.colorcolumn = "80"
vim.opt.wrap = false

vim.cmd [[
  augroup custom_indentation
    autocmd Filetype java setlocal ts=4 sw=4 sts=0 expandtab
  augroup END
]]
