local vim = vim
-- Darwin / Linux / Windows
local os_name = vim.loop.os_uname().sysname

-- Download nerd font from
-- https://www.nerdfonts.com/font-downloads
vim.cmd([[
	set guifont=Cousine\ NF:h12:antialias
	set mouse=a
]])

vim.o.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'

vim.o.number = true
-- vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.wrap = false

-- vim.o.scrolloff = 4
-- vim.o.sidescrolloff = 4
vim.o.signcolumn = 'yes'

vim.o.splitbelow = true
vim.o.splitright = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Bufferline needs this to work
vim.o.termguicolors = true

vim.g.neovide_cursor_vfx_mode = "railgun"

vim.cmd([[
	syntax enable
	colorscheme tender
	let g:lightline = { 'colorscheme': 'tender' }
	set colorcolumn=80
]])

