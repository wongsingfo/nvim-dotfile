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

-- map('n', '<C-t>', 'NvimTreeToggle<CR>', opt)

map('i', '<c-space>', 'coc#refresh()', opt_expr)

wk.register({
	f = {
		name = 'Telescope',
	},
}, { prefix = '<leader>' })

map('n', '<c-p>', '<cmd>Telescope find_files<CR>', opt)
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', opt)
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', opt)
map('n', '<leader>ft', '<cmd>Telescope help_tags<CR>', opt)

wk.register({
	t = {
		name = 'NvimTree',
	},
}, { prefix = '<leader>' })

map('n', '<c-n>', '<cmd>NvimTreeToggle<CR>', opt)
map('n', '<leader>tr', '<cmd>NvimTreeRefresh<CR>', opt)
map('n', '<leader>tn', '<cmd>NvimTreeFindFile<CR>', opt)

wk.register({
	["<c-n>"] = "NvimTreeTreeToggle",
	["<c-p>"] = "Telescope find_files",
	["<c-space>"] = "Coc refresh"
}, { prefix = '?' })

