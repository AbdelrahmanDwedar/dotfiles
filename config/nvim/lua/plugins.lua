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
			'hrsh7th/cmp-nvim-lsp',
			{ 'hrsh7th/cmp-buffer', event = 'InsertEnter' },
			{ 'hrsh7th/cmp-path', event = 'InsertEnter' },
			{ 'hrsh7th/cmp-nvim-lua', ft = 'lua' },
			{ 'saadparwaiz1/cmp_luasnip', event = 'InsertEnter' },
			{ 'petertriho/cmp-git', ft = 'gitcommit', config = require('config.cmp.git_config') },
			{ 'hrsh7th/cmp-cmdline', event = 'CmdlineEnter' },
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
		config = require('config.treesitter'),
		requires = {
			{ 'nvim-treesitter/playground', as = 'treesitter-playground', cmd = 'TSPlaygroundToggle' },
			'nvim-treesitter/nvim-treesitter-context',
			'kiyoon/treesitter-indent-object.nvim',
			'nvim-treesitter/nvim-treesitter-textobjects',
		},
	})

	use({
		'mfussenegger/nvim-dap',
		-- keys = '<leader>ds',
		requires = {
			'jay-babu/mason-nvim-dap.nvim',
			'rcarriga/nvim-dap-ui',
			'rcarriga/cmp-dap',
		},
	})

	-- Telescope for navigation
	use({
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			-- extentions
			'nvim-telescope/telescope-project.nvim',
			'nvim-telescope/telescope-dap.nvim',
			'nvim-telescope/telescope-symbols.nvim',
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
		keys = {
			{ 'i', '{' },
			{ 'i', '(' },
			{ 'i', '[' },
			{ 'i', '"' },
			{ 'i', "'" },
			{ 'i', '`' },
		},
		config = function()
			require('nvim-autopairs').setup()
		end,
	})

	-- shortcut to surround code with {([])} or tags etc...
	use({
		'kylechui/nvim-surround',
		keys = 'ys',
		tag = '*', -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require('nvim-surround').setup()
		end,
	})

	-- For Commenting gcc & gc
	use({
		'numToStr/Comment.nvim',
		keys = 'gc',
		config = function()
			require('Comment').setup()
		end,
	})

	-- multi-cursors
	use({
		'smoka7/multicursors.nvim',
		keys = {
			{ 'n', '<C-n>' },
			{ 'v', '<C-n>' },
			{ 'n', '<leader>mn' },
			{ 'v', '<leader>mn' },
			{ 'n', '<leader>mv' },
			{ 'v', '<leader>mv' },
			{ 'n', '<leader>mc' },
			{ 'v', '<leader>mc' },
			{ 'n', '<leader>mq' },
			{ 'v', '<leader>mq' },
			{ 'n', '<leader>mp' },
			{ 'v', '<leader>mp' },
		},
		config = require('config.multicursor'),
		requires = {
			'smoka7/hydra.nvim',
		},
	})

	-- which key
	use({
		'folke/which-key.nvim',
		opt = true,
		config = function()
			require('which-key').setup({})
		end,
	})

	-- git signs integration
	use('lewis6991/gitsigns.nvim')

	-- discord presence for neovim
	use('andweeb/presence.nvim')

	-- marks
	use({ 'chentoast/marks.nvim', config = require('config.marks'), keys = 'm' })

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
