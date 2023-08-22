-- Plugins managing by packer.nvim
return require('packer').startup(function(use)
	use('wbthomason/packer.nvim')

	-- === #### NeoVim Plugins #### === --

	-- language server protocol
	use({
		'neovim/nvim-lspconfig',
		requires = {
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
		},
	})

	-- linting & diagnostics
	use('mfussenegger/nvim-lint')

	-- formatting
	use('mhartington/formatter.nvim')

	-- neovim completion
	use({
		'hrsh7th/nvim-cmp',
		requires = {
			'nvim-lua/plenary.nvim',
			-- sources
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-nvim-lua',
			'hrsh7th/cmp-cmdline',
			'saadparwaiz1/cmp_luasnip',
			'petertriho/cmp-git',
		},
	})

	-- LuaSnip
	use({
		'L3MON4D3/LuaSnip',
		run = 'make install_jsregexp',
		requires = {
			'rafamadriz/friendly-snippets',
		},
	})

	-- neovim treesitter
	use({
		'nvim-treesitter/nvim-treesitter',
		run = 'TSUpdate',
		requires = {
			'nvim-treesitter/nvim-treesitter-context',
			'kiyoon/treesitter-indent-object.nvim',
		},
	})

	-- Telescope for navigation
	use({
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			-- extentions
			'nvim-telescope/telescope-project.nvim',
			'ThePrimeagen/git-worktree.nvim',
		},
	})

	-- neo-tree
	use({
		'nvim-neo-tree/neo-tree.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'MunifTanjim/nui.nvim',
			'nvim-tree/nvim-web-devicons',
			{
				-- only needed if you want to use the commands with "_with_window_picker" suffix
				's1n7ax/nvim-window-picker',
				tag = 'v1.*',
				config = function()
					require('window-picker').setup({
						autoselect_one = true,
						include_current = false,
						filter_rules = {
							-- filter using buffer options
							bo = {
								-- if the file type is one of following, the window will be ignored
								filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },

								-- if the buffer type is one of following, the window will be ignored
								buftype = { 'terminal', 'quickfix' },
							},
						},
						other_win_hl_color = '#e35e4f',
					})
				end,
			},
		},
	})

	-- lua status bar
	use({
		'nvim-lualine/lualine.nvim',
		requires = {
			'nvim-tree/nvim-web-devicons',
		},
	})

	-- bufferline
	use({
		'akinsho/bufferline.nvim',
		tag = 'v3.*',
		requires = {
			'kyazdani42/nvim-web-devicons',
		},
	})

	-- auto completion for {([" etc...
	use({
		'windwp/nvim-autopairs',
		config = function()
			require('nvim-autopairs').setup({})
		end,
	})

	-- shortcut to surround code with {([])} or tags etc...
	use({
		'kylechui/nvim-surround',
		opt = true,
		keys = 'ys',
		tag = '*', -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require('nvim-surround').setup()
		end,
	})

	-- For Commenting gcc & gc
	use({
		'numToStr/Comment.nvim',
		opt = true,
		keys = 'gc',
		config = function()
			require('Comment').setup()
		end,
	})

	-- multi-cursors
	use({
		'smoka7/multicursors.nvim',
		requires = {
			'smoka7/hydra.nvim',
		},
	})

	-- which key
	use({
		'folke/which-key.nvim',
		config = function()
			require('which-key').setup({})
		end,
	})

	-- git signs integration
	use('lewis6991/gitsigns.nvim')

	-- discord presence for neovim
	use('andweeb/presence.nvim')

	-- marks
	use('chentoast/marks.nvim')

	-- === #### My Plugins ### === ---

	-- best neovim colorschemes in one place
	-- use('AbdelrahmanDwedar/awesome-nvim-colorschemes')
	use('~/Programming/projects/extensions/awesome-nvim-colorschemes')

	-- better comments
	use('~/Programming/projects/extensions/better-comments.nvim')

	-- === #### Vim Script Plugins ### === ---

	-- wakatime watcher
	use('wakatime/vim-wakatime')

	-- editor config plugin for the /.editorconfig settings
	use('editorconfig/editorconfig-vim')
end)
