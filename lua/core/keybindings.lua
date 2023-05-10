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
		name = 'Telescope Diffview PasteCode',
		d = ':DiffviewOpen',
		D = ':DiffviewFileHistory paths',
		c = ':DiffviewClose',
		p = 'set paste',
	},
	n = {
		name = 'NvimTree BufferLine',
	},
	w = {
		name = 'WindowResizer',
	},
	g = {
		name = 'Coc',
	},
	t = {
		name = 'Textmode',
	},
	l = {
		name = 'Lazygit',
	},
}, { prefix = '<leader>' })

-- Coc
map('i', '<c-space>', 'coc#refresh()', opt_expr)
map('n', '<leader>gc', '<cmd>CocList<cr>', opt)
map('n', 'gd', '<cmd>call CocActionAsync("jumpDefinition")<CR>', opt)
-- map('n', 'gp', '<cmd>call CocActionAsync("jumpDefinition", ":vsp")<CR>', opt)
map('n', 'gp', '<cmd>call CocActionAsync("jumpDefinition", ":tabnew")<CR>', opt)
map('n', 'gD', '<cmd>call CocActionAsync("jumpDeclaration")<CR>', opt)
map('n', '<leader>gr', '<cmd>call CocActionAsync("rename")<CR>', opt)
map('n', '<leader>gR', '<cmd>call CocActionAsync("refactor")<CR>', opt)
map('n', '<leader>gs', '<cmd>CocCommand clangd.switchSourceHeader<CR>', opt)
map('n', 'gr', '<cmd>call CocActionAsync("jumpReferences")<CR>', opt)
map('n', '<leader>gF', '<cmd>call CocActionAsync("format")<CR>', opt)
vim.cmd[[
	nmap <leader>gx  <Plug>(coc-codeaction-cursor)
	nmap <leader>gX  <Plug>(coc-fix-current)
	xmap <leader>gf  <Plug>(coc-format-selected)
	nmap <leader>gf  <Plug>(coc-format-selected)
	nmap <silent> <leader>gN <Plug>(coc-diagnostic-prev)
	nmap <silent> <leader>gn <Plug>(coc-diagnostic-next)
	xmap if <Plug>(coc-funcobj-i)
	omap if <Plug>(coc-funcobj-i)
	xmap af <Plug>(coc-funcobj-a)
	omap af <Plug>(coc-funcobj-a)
	xmap ic <Plug>(coc-classobj-i)
	omap ic <Plug>(coc-classobj-i)
	xmap ac <Plug>(coc-classobj-a)
	omap ac <Plug>(coc-classobj-a)
	
	nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
	inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
	vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
]]
map('n', 'K', '<cmd>lua show_documentation()<cr>', opt)
function show_documentation()
	local filetype = vim.bo.filetype
	if filetype == "vim" or filetype == "help" then
		vim.api.nvim_command("h " .. vim.fn.expand("<cword>"))
	elseif vim.fn["coc#rpc#ready"]() then
		vim.fn.CocActionAsync("doHover")
	else
		vim.api.nvim_command(
		"!" .. vim.bo.keywordprg .. " " .. vim.fn.expand("<cword>")
		)
	end
end
-- Telescope
map('n', '<c-p>', '<cmd>Telescope buffers<CR>', opt)
map('n', '<leader>pf', '<cmd>Telescope find_files<CR>', opt)
map('n', '<leader>pg', '<cmd>Telescope live_grep<CR>', opt)
map('n', '<leader>ps', '<cmd>Telescope grep_string<CR>', opt)
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
-- Vista
map('n', '<leader>vi', '<cmd>Vista!!<CR>', opt)
-- BufferLine
map('n', '<leader>nn', '<cmd>BufferLineCycleNext<cr>', opt)
map('n', '<leader>np', '<cmd>BufferLineCyclePrev<cr>', opt)
map('n', '<leader>nl', '<cmd>BufferLineMoveNext<cr>', opt)
map('n', '<leader>nh', '<cmd>BufferLineMovePrev<cr>', opt)
map('n', '<leader>nb', '<cmd>BufferLinePick<cr>', opt)
map('n', '<leader>nc', '<cmd>BufferLinePickClose<cr>', opt)
for i = 1, 9 do
	map('n', '<leader>n'..i, '<cmd>BufferLineGoToBuffer '..i..'<cr>', opt)
end
-- Tab naviagtion
map('n', 'tj', '<cmd>tabnext<cr>', opt)
map('n', 'tk', '<cmd>tabprevious<cr>', opt)
map('n', 'tn', '<cmd>tabnew<cr>', opt)
map('n', 'tc', '<cmd>tabclose<cr>', opt)
-- Window resizer
vim.g.winresizer_start_key = '<leader>ww'
-- Neomux
vim.cmd[[
:tnoremap <expr> <C-V> '<C-\><C-N>"'.nr2char(getchar()).'pi'
]]
-- Hop
-- map('', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
-- map('', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
-- map('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>", {})
-- map('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>", {})
map('', 's', "<cmd>HopChar1MW<cr>", opt)
map('o', 'Z', "<cmd>HopChar1MW<cr>", opt)
-- paste code
map('n', '<leader>pp', '<cmd>set paste<cr>"*p<cmd>set nopaste<cr>', opt)
-- Lazygit
-- https://github.com/jesseduffield/lazygit/blob/master/docs/keybindings/Keybindings_en.md
map('n', '<leader>lg', '<cmd>LazyGit<cr>', opt)

wk.register({
	["<c-n>"] = "NvimTreeToggle",
	["<c-p>"] = "Telescope find_files",
	["<c-space>"] = "Coc refresh",
	["<c-num>"] = "Switch BufferLine",
	["<c-s>"] = "Exit insert mode in neomux",
	["<c-v>"] = "Paste reg in terminal mode",
}, { prefix = '?' })

-- Copy to clipboard
vim.keymap.set('n', '<leader>c', require('osc52').copy_operator, {expr = true})
vim.keymap.set('n', '<leader>cc', '<leader>c_', {remap = true})
vim.keymap.set('v', '<leader>c', require('osc52').copy_visual)

map('n', '<leader>tm', '<cmd>lua toggle_textmode()<cr>', opt)
function toggle_textmode()
	local enabled = not vim.wo.spell
	vim.wo.wrap = enabled
	vim.wo.spell = enabled
	vim.wo.linebreak = enabled
end

local chatgpt = require("chatgpt")
wk.register({
	p = {
		name = "ChatGPT",
		e = {
			function()
				chatgpt.edit_with_instructions()
			end,
			"Edit with instructions",
		},
	},
}, {
	prefix = "<leader>",
	mode = "v",
})
