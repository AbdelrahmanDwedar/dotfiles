-- Plugins managing by packer.nvim 
return require('packer').startup(function()

	use 'wbthomason/packer.nvim'

	-- === #### NeoVim plugins #### === --

	-- language server protocol 
	use {
		"neovim/nvim-lspconfig",
		requires = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"jose-elias-alvarez/null-ls.nvim"
		}
	}

	-- neovim completion
	use {
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"saadparwaiz1/cmp_luasnip"
		}
	}

	use	{
		"L3MON4D3/LuaSnip", 
		tag = "vCurrentMajor.*"
	}

	-- neovim treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = "TSUpdate"
	}

	-- git signs integration 
	use "lewis6991/gitsigns.nvim"

	-- lua status bar
	use { 
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function() require('lualine').setup {} end
	}

	-- auto completion for {([" etc...
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}

	use "Djancyp/better-comments.nvim"

	-- discord presence for neovim
	use 'andweeb/presence.nvim'

	-- Telescope for navigation
	use {
		'nvim-telescope/telescope.nvim',
		requires = { 
			'nvim-lua/plenary.nvim',
			-- extentions
			'nvim-telescope/telescope-project.nvim'
		}
	}

	-- NeoVim Tree written in lua
	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons',
	}

	  -- For Commenting gcc & gc
	use {
		'numToStr/Comment.nvim',
		config = function() require('Comment').setup() end
	}

	-- shortcut to surround code with {([])} or tags etc...
	use {
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function() require("nvim-surround").setup() end
	}

	-- colorizing for hex and other color formats
	use {
		'norcalli/nvim-colorizer.lua',
		config = function() 
			require 'colorizer'.setup()
		end
	}

	-- bufferline
	use {
		'akinsho/bufferline.nvim', 
		tag = "v3.*", 
		requires = 'kyazdani42/nvim-web-devicons'
	}

	-- best neovim colorschemes in one place
	use 'AbdelrahmanDwedar/awesome-nvim-colorschemes'

	-- === #### Native vim plugins ### === ---

	-- wakatime watcher
	use 'wakatime/vim-wakatime'

	-- multi cursors visualy
	use 'mg979/vim-visual-multi'

	-- editor config plugin for the /.editorconfig settings
	use 'editorconfig/editorconfig-vim'


end)


