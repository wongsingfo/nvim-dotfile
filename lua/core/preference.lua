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
vim.o.wrap = false

vim.o.scrolloff = 4
vim.o.sidescrolloff = 4
vim.o.signcolumn = 'yes'

vim.o.splitbelow = true
vim.o.splitright = true

-- Bufferline needs this to work
vim.o.termguicolors = true

vim.g.neovide_cursor_vfx_mode = "railgun"

vim.cmd([[
	syntax enable
	colorscheme tender
	let g:lightline = { 'colorscheme': 'tender' }
]])

