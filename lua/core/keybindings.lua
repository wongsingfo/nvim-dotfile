local vim = vim
local wk = require('which-key')

-- How Leader key works
-- https://learnvimscriptthehardway.stevelosh.com/chapters/06.html
vim.g.mapleader = " "
vim.g.maplocalleader = ","

local map = vim.api.nvim_set_keymap
local opt = {
	noremap = true,
	silent = true,
}
local opt_expr = {
	noremap = true,
	silent = true,
	expr = true,
};

wk.register({
	p = {
		name = 'Telescope and Diffview',
		d = ':DiffviewOpen d4a7b0d HEAD~1',
		D = ':DiffviewFileHistory paths',
		c = ':DiffviewClose',
	},
	n = {
		name = 'NvimTree',
	},
	b = {
		name = 'BufferLine',
	},
	s = {
		name = 'Neomux',
	},
}, { prefix = '<leader>' })

-- Coc
map('i', '<c-space>', 'coc#refresh()', opt_expr)
-- Telescope
map('n', '<c-p>', '<cmd>Telescope find_files<CR>', opt)
map('n', '<leader>pg', '<cmd>Telescope live_grep<CR>', opt)
map('n', '<leader>pb', '<cmd>Telescope buffers<CR>', opt)
map('n', '<leader>pt', '<cmd>Telescope help_tags<CR>', opt)
-- Diffview
map('n', '<leader>pd', '<cmd>DiffviewOpen<CR>', opt)
map('n', '<leader>pD', '<cmd>DiffviewFileHistory<cr>', opt)
map('n', '<leader>pr', '<cmd>DiffviewRefresh<cr>', opt)
map('n', '<leader>pc', '<cmd>DiffviewClose<cr>', opt)
-- NvimTree
map('n', '<c-n>', '<cmd>NvimTreeToggle<CR>', opt)
map('n', '<leader>nr', '<cmd>NvimTreeRefresh<CR>', opt)
map('n', '<leader>nf', '<cmd>NvimTreeFindFile<CR>', opt)
-- Terminal
map('n', '<c-m>', '<cmd>ToggleTerm<CR>', opt)
-- BufferLine
map('n', '<leader>bn', '<cmd>BufferLineCycleNext<cr>', opt)
map('n', '<leader>bp', '<cmd>BufferLineCyclePrev<cr>', opt)
map('n', '<leader>bl', '<cmd>BufferLineMoveNext<cr>', opt)
map('n', '<leader>bh', '<cmd>BufferLineMovePrev<cr>', opt)
map('n', '<leader>bb', '<cmd>BufferLinePick<cr>', opt)
map('n', '<leader>bc', '<cmd>BufferLinePickClose<cr>', opt)
for i = 1, 9 do
	map('n', '<c-'..i..'>', '<cmd>BufferLineGoToBuffer '..i..'<cr>', opt)
end

wk.register({
	["<c-n>"] = "NvimTreeToggle",
	["<c-p>"] = "Telescope find_files",
	["<c-m>"] = "ToggleTerm",
	["<c-space>"] = "Coc refresh",
	["<c-num>"] = "Switch BufferLine",
	["<c-s>"] = "Exit insert mode in neomux",
	["<c-e>"] = "Resize window",
}, { prefix = '?' })

