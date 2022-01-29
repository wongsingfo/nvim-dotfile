local vim = vim

vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
