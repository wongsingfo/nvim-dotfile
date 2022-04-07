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
	'coc-highlight', 'coc-git',
	'coc-rust-analyzer',
	'coc-css',
	'coc-cmake',
	'coc-clangd',
	'coc-sql',
}

require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Run `:Copilot setup` to setup
	use 'github/copilot.vim'

	use { 'neoclide/coc.nvim', branch = 'release' }

	-- Color scheme
	use 'jacoborus/tender.vim'

	-- File manager
	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function()
			require'nvim-tree'.setup {
				view = {
					mappings = {
						list = { { key = "?", action = "toggle_help" } }
					}
				}
			}
		end
	}

	use 'tpope/vim-surround'

	-- Use `s` to move the cursor
	use 'justinmk/vim-sneak'

	use 'chrisbra/vim-commentary'

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function()
			require('lualine').setup {}
		end
	}

	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

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

	use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

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
