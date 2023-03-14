local vim = vim
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Need to install ripgrpe
-- https://github.com/BurntSushi/ripgrep
--   <choco|brew> install ripgrep
--   curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
--   sudo dpkg -i ripgrep_13.0.0_amd64.deb
-- Install fd-find
--   sudo apt install fd-find

-- Find extension: https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
-- Language servers: https://github.com/neoclide/coc.nvim/wiki/Language-servers
-- See related issue: https://github.com/neoclide/coc.nvim/issues/560
vim.g.coc_global_extensions = {
	'coc-highlight',
	'coc-git',
	'coc-rust-analyzer',
	'coc-prettier',
	'coc-cmake',
	'coc-clangd',
	'coc-sql',
	'coc-tsserver',
	'coc-pyright',
	'coc-emmet',
	'coc-go',
}

require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Run `:Copilot setup` to setup
	use 'github/copilot.vim'

	use { 'neoclide/coc.nvim', branch = 'release' }

	-- Color scheme
	-- use 'jacoborus/tender.vim'
	use 'morhetz/gruvbox'

	use 'tpope/vim-vinegar'

	use 'tpope/vim-surround'

	-- Use `s` to move the cursor
	-- use 'justinmk/vim-sneak'
	-- use 'easymotion/vim-easymotion'
	use {
		'phaazon/hop.nvim',
		branch = 'v2',
		config = function()
			require'hop'.setup {}
		end
	}

	-- use 'chrisbra/vim-commentary'
	use 'tomtom/tcomment_vim'

	use {
		'nvim-lualine/lualine.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function()
			require('lualine').setup {}
		end
	}

	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'}, { "kdheepak/lazygit.nvim" } },
		config = function()
			require("telescope").load_extension("lazygit")
		end,
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
		config = function ()
			require 'nvim-treesitter.configs'.setup {
				auto_install = true,
				highlight = {
					enable = true,

					-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
					-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
					-- Using this option may slow down your editor, and you may see some duplicate highlights.
					-- Instead of true it can also be a list of languages
					additional_vim_regex_highlighting = false,
				},
			}
		end
	}

	-- See the context
	use {
		'nvim-treesitter/nvim-treesitter-context',
		config = function()
			require'treesitter-context'.setup{}
		end
	}

	use 'liuchengxu/vista.vim'

	use {
		'folke/which-key.nvim',
		config = function()
			require'which-key'.setup { }
		end
	}

	use {
		'akinsho/bufferline.nvim',
		requires = 'kyazdani43/nvim-web-devicons',
		config = function()
			require('bufferline').setup {}
		end
	}

	use {
		'sindrets/diffview.nvim',
		requires = 'nvim-lua/plenary.nvim'
	}

	use {
		'goolord/alpha-nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function()
			require'alpha'.setup(require'alpha.themes.startify'.config)
		end
	}

	-- Stabilize buffer content on window open/close events
	use {
		"luukvbaal/stabilize.nvim",
		config = function() require("stabilize").setup() end
	}

	-- WindowResizer
	use 'simeji/winresizer'

	-- Adjust shiftwidth and expandtab
	use 'tpope/vim-sleuth'

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
