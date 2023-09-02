local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
		},
	},
	{ 'mfussenegger/nvim-lint' },
	{ 'mhartington/formatter.nvim' },
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'nvim-lua/plenary.nvim',
			-- sources
			'hrsh7th/cmp-nvim-lsp',
			{ 'hrsh7th/cmp-buffer', event = 'InsertEnter' },
			{ 'hrsh7th/cmp-path', event = 'InsertEnter' },
			{ 'hrsh7th/cmp-nvim-lua', ft = 'lua' },
			{ 'saadparwaiz1/cmp_luasnip', event = 'InsertEnter' },
			{ 'petertriho/cmp-git', ft = 'gitcommit', config = require('config.cmp.git_config') },
			{ 'hrsh7th/cmp-cmdline', event = 'CmdlineEnter' },
			{ 'rcarriga/cmp-dap', ft = { 'dap-repl', 'dapui_watches', 'dapui_hover' } },
		},
	},
	{
		'L3MON4D3/LuaSnip',
		build = 'make install_jsregexp',
		dependencies = {
			'rafamadriz/friendly-snippets',
		},
	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = 'TSUpdate',
		config = require('config.treesitter'),
		dependencies = {
			{ 'nvim-treesitter/playground', name = 'treesitter-playground', cmd = 'TSPlaygroundToggle' },
			'nvim-treesitter/nvim-treesitter-context',
			'kiyoon/treesitter-indent-object.nvim',
			'nvim-treesitter/nvim-treesitter-textobjects',
		},
	},
	{
		'mfussenegger/nvim-dap',
		keys = {
			{ mode = 'n', '<leader>db' },
			{ mode = 'n', '<leader>ds' },
			{ mode = 'n', '<leader>dj' },
			{ mode = 'n', '<leader>dl' },
		},
		dependencies = {
			'jay-babu/mason-nvim-dap.nvim',
			'rcarriga/nvim-dap-ui',
		},
		config = function()
			require('config.dap')
			-- DapKeymaps()
		end,
	},
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
			-- extentions
			'nvim-telescope/telescope-project.nvim',
			'nvim-telescope/telescope-symbols.nvim',
			'ThePrimeagen/git-worktree.nvim',
			{
				'nvim-telescope/telescope-dap.nvim',
				keys = {
					{ mode = 'n', '<leader>db' },
					{ mode = 'n', '<leader>ds' },
					{ mode = 'n', '<leader>dj' },
					{ mode = 'n', '<leader>dl' },
				},
				-- config = require('telescope').load_extension('dap'),
			},
		},
	},
	{
		'nvim-neo-tree/neo-tree.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'MunifTanjim/nui.nvim',
			'nvim-tree/nvim-web-devicons',
			{
				-- only needed if you want to use the commands with "_with_window_picker" suffix
				's1n7ax/nvim-window-picker',
				version = 'v1.*',
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
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
	},
	{
		'akinsho/bufferline.nvim',
		version = 'v3.*',
		requires = {
			'kyazdani42/nvim-web-devicons',
		},
	},
	{
		'windwp/nvim-autopairs',
		keys = {
			{ mode = 'i', '(' },
			{ mode = 'i', '[' },
			{ mode = 'i', '"' },
			{ mode = 'i', "'" },
			{ mode = 'i', '`' },
		},
		config = function()
			require('nvim-autopairs').setup()
		end,
	},
	{
		'kylechui/nvim-surround',
		keys = 'ys',
		version = '*', -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require('nvim-surround').setup()
		end,
	},
	{
		'numToStr/Comment.nvim',
		keys = 'gc',
		config = function()
			require('Comment').setup()
		end,
	},
	{
		'smoka7/multicursors.nvim',
		keys = {
			{ mode = 'n', '<C-n>' },
			{ mode = 'v', '<C-n>' },
			{ mode = 'n', '<leader>mn' },
			{ mode = 'v', '<leader>mn' },
			{ mode = 'n', '<leader>mv' },
			{ mode = 'v', '<leader>mv' },
			{ mode = 'n', '<leader>mc' },
			{ mode = 'v', '<leader>mc' },
			{ mode = 'n', '<leader>mq' },
			{ mode = 'v', '<leader>mq' },
			{ mode = 'n', '<leader>mp' },
			{ mode = 'v', '<leader>mp' },
		},
		config = require('config.multicursor'),
		dependencies = {
			'smoka7/hydra.nvim',
		},
	},
	{
		'folke/which-key.nvim',
		opt = true,
		config = function()
			require('which-key').setup({})
		end,
	},
	{ 'lewis6991/gitsigns.nvim' },
	{ 'andweeb/presence.nvim' },
	{ 'chentoast/marks.nvim', config = require('config.marks'), keys = 'm' },

	{ dir = '~/Programming/projects/extensions/awesome-nvim-colorschemes' },
	{ dir = '~/Programming/projects/extensions/better-comments.nvim' },
	{ 'wakatime/vim-wakatime' },
	{ 'editorconfig/editorconfig-vim' },
})
