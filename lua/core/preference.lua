local vim = vim

-- Download nerd font from
-- https://www.nerdfonts.com/font-downloads
vim.cmd([[
	set guifont=Cousine\ NF:h14:antialias
]])

vim.o.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'

vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true

vim.o.scrolloff = 4
vim.o.sidescrolloff = 4
vim.o.signcolumn = 'yes'

vim.g.airline_theme = "tender"
-- Automatically displays all buffers when there's only one tab open.
vim.g['airline#extensions#tabline#enabled'] = 1

vim.g.neovide_cursor_vfx_mode = "railgun"

vim.cmd([[
	syntax enable
	colorscheme tender
	let g:lightline = { 'colorscheme': 'tender' }
]])

