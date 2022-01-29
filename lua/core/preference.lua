local vim = vim
vim.o.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'

vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true

vim.o.scrolloff = 4
vim.o.sidescrolloff = 4
vim.o.signcolumn = 'yes'

vim.g.airline_theme = "tender"

vim.g.neovide_cursor_vfx_mode = "railgun"

vim.cmd([[
	syntax enable
	colorscheme tender
	let g:lightline = { 'colorscheme': 'tender' }
]])

