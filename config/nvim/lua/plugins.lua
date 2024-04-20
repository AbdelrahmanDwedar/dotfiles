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

	-- mason
	{
		'williamboman/mason.nvim',
	},

	-- LSP
	{
		'neovim/nvim-lspconfig',
		config = require('config.lsp'),
		event = 'VimEnter',
		dependencies = {
			'williamboman/mason-lspconfig.nvim',
		},
	},

	{
		'aca/emmet-ls',
	},

	-- Linting
	{
		'mfussenegger/nvim-lint',
		event = 'LspAttach',
		config = require('config.lint'),
		dependencies = {
			'rshkarin/mason-nvim-lint',
		},
	},

	-- Formatter
	{
		'mhartington/formatter.nvim',
		event = 'LspAttach',
	},

	-- Completion
	{
		'hrsh7th/nvim-cmp',
		event = 'InsertEnter',
		config = require('config.cmp'),
		dependencies = {
			'nvim-lua/plenary.nvim',
			-- sources
			'hrsh7th/cmp-nvim-lsp',
			{ 'hrsh7th/cmp-buffer', event = 'InsertEnter' },
			{ 'hrsh7th/cmp-path', event = 'InsertEnter' },
			{ 'hrsh7th/cmp-nvim-lua', ft = 'lua' },
			{ 'dcampos/cmp-emmet-vim', ft = { 'html', 'javascriptreact', 'typescriptreact', 'vue', 'svelte' } },
			{ 'saadparwaiz1/cmp_luasnip', event = 'InsertEnter' },
			{ 'petertriho/cmp-git', ft = 'gitcommit', config = require('config.cmp.git_config') },
			{ 'hrsh7th/cmp-cmdline', event = 'CmdlineEnter' },
			{ 'rcarriga/cmp-dap', ft = { 'dap-repl', 'dapui_watches', 'dapui_hover' } },
		},
	},

	-- refactor.nvim
	{
		'ThePrimeagen/refactoring.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-treesitter/nvim-treesitter',
		},
		config = function()
			require('refactoring').setup()
		end,
	},

	-- Snippets
	{
		'L3MON4D3/LuaSnip',
		event = 'InsertEnter',
		version = 'v2.*',
		config = require('config.luasnip'),
		build = 'make install_jsregexp',
		dependencies = {
			'rafamadriz/friendly-snippets',
		},
	},

	{
		'nvim-neotest/neotest',
		dependencies = {
			'nvim-neotest/nvim-nio',
			'nvim-lua/plenary.nvim',
			'antoinemadec/FixCursorHold.nvim',
			'nvim-treesitter/nvim-treesitter',

			-- sources
			'nvim-neotest/neotest-python',
			'nvim-neotest/neotest-go',
			'marilari88/neotest-vitest',
			'V13Axel/neotest-pest',
			'olimorris/neotest-phpunit',
		},
		config = require('config.neotest'),
	},

	{
		'NeogitOrg/neogit',
		dependencies = {
			'nvim-lua/plenary.nvim', -- required
			'sindrets/diffview.nvim', -- optional - Diff integration

			-- Only one of these is needed, not both.
			'nvim-telescope/telescope.nvim', -- optional
			'ibhagwan/fzf-lua', -- optional
		},
		config = function()
			require('neogit').setup()
		end,
	},

	-- Treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		event = 'VimEnter',
		build = 'TSUpdate',
		config = require('config.treesitter'),
		dependencies = {
			{ 'nvim-treesitter/playground', name = 'treesitter-playground', cmd = 'TSPlaygroundToggle' },
			'nvim-treesitter/nvim-treesitter-context',
			'kiyoon/treesitter-indent-object.nvim',
			'nvim-treesitter/nvim-treesitter-textobjects',
		},
	},

	-- DAP (Debugger)
	{
		'mfussenegger/nvim-dap',
		keys = {
			{ mode = 'n', '<leader>d' },
		},
		dependencies = {
			'rcarriga/nvim-dap-ui',

			-- sources
			'leoluz/nvim-dap-go',
			'mfussenegger/nvim-dap-python',
			'jbyuki/one-small-step-for-vimkind',
		},
		config = function()
			require('config.dap')
		end,
	},

	-- Telescope
	{
		'nvim-telescope/telescope.nvim',
		keys = '<leader>f',
		config = require('config.telescope'),
		dependencies = {
			'nvim-lua/plenary.nvim',
			-- extentions
			'nvim-telescope/telescope-project.nvim',
			'nvim-telescope/telescope-symbols.nvim',
			'ThePrimeagen/git-worktree.nvim',
			{
				'nvim-telescope/telescope-dap.nvim',
				config = function()
					require('telescope').load_extension('dap')
				end,
			},
		},
	},

	-- NeoTree file tree
	{
		'nvim-neo-tree/neo-tree.nvim',
		event = 'VimEnter',
		config = require('config.neotree'),
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

	-- lualine status line
	{
		'nvim-lualine/lualine.nvim',
		event = 'VimEnter',
		config = require('config.lualine'),
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
	},

	-- Bufferline (topline)
	{
		'akinsho/bufferline.nvim',
		event = 'VimEnter',
		config = require('config.bufferline'),
		version = 'v3.*',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
	},

	-- https://github.com/Bekaboo/dropbar.nvim
	{
		'Bekaboo/dropbar.nvim',
		dependencies = {
			'nvim-telescope/telescope-fzf-native.nvim',
			'nvim-tree/nvim-web-devicons',
		},
	},

	{
		'folke/noice.nvim',
		event = 'VeryLazy',
		opts = {},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			'MunifTanjim/nui.nvim',
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			'rcarriga/nvim-notify',
		},
	},

	-- Auto-pairs
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

	-- Surrounding shortcuts
	{
		'kylechui/nvim-surround',
		keys = 'ys',
		version = '*', -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require('nvim-surround').setup()
		end,
	},

	-- Commenting shortcuts
	{
		'numToStr/Comment.nvim',
		keys = 'gc',
		config = function()
			require('Comment').setup()
		end,
	},

	-- Multicursors
	{
		'smoka7/multicursors.nvim',
		keys = {
			{ mode = 'n', '<C-n>' },
			{ mode = 'v', '<C-n>' },
			{ mode = 'n', '<leader>m' },
			{ mode = 'v', '<leader>m' },
		},
		config = require('config.multicursor'),
		dependencies = {
			'smoka7/hydra.nvim',
		},
	},

	-- Which key
	{
		'folke/which-key.nvim',
		opt = true,
		config = function()
			require('which-key').setup({})
		end,
	},

	-- Gitsigns
	{
		'lewis6991/gitsigns.nvim',
		event = 'VimEnter',
		config = require('config.gitsigns'),
	},

	-- Discord Presence
	{
		'andweeb/presence.nvim',
		event = 'VimEnter',
		config = require('config.presence'),
	},

	-- Marks hightling
	{
		'chentoast/marks.nvim',
		config = require('config.marks'),
		keys = 'm',
	},

	-- editorconfig
	{
		'gpanders/editorconfig.nvim',
		event = 'VimEnter',
	},

	{
		'norcalli/nvim-colorizer.lua',
		config = function()
			require('colorizer').setup()
		end,
	},

	-- My awesome colorschemes plugin
	{
		'AbdelrahmanDwedar/awesome-nvim-colorschemes',
	},

	-- My better comments plugin
	{
		'AbdelrahmanDwedar/better-comments.nvim',
		config = function()
			require('better-comments').setup()
		end,
	},

	-- wakatime time tracker
	{
		'wakatime/vim-wakatime',
		event = 'VimEnter',
	},
}, {
	root = vim.fn.stdpath('data') .. '/lazy', -- directory where plugins will be installed
	defaults = {
		lazy = false, -- should plugins be lazy-loaded?
	},
	-- leave nil when passing the spec as the first argument to setup()
	lockfile = vim.fn.stdpath('config') .. '/lazy-lock.json', -- lockfile generated after running update.
	git = {
		-- defaults for the `Lazy log` command
		-- log = { "-10" }, -- show the last 10 commits
		log = { '-8' }, -- show commits from the last 3 days
		timeout = 120, -- kill processes that take more than 2 minutes
		url_format = 'https://github.com/%s.git',
		-- lazy.nvim requires git >=2.19.0. If you really want to use lazy with an older version,
		-- then set the below to false. This should work, but is NOT supported and will
		-- increase downloads a lot.
		filter = true,
	},
	dev = {
		-- directory where you store your local plugin projects
		path = '~/Programming/projects/extensions',
		patterns = { 'AbdelrahmanDwedar' }, -- For example {"folke"}
		fallback = true, -- Fallback to git when local plugin doesn't exist
	},
	install = {
		-- install missing plugins on startup. This doesn't increase startup time.
		missing = true,
		-- try to load one of these colorschemes when starting an installation during startup
		colorscheme = { 'habamax' },
	},
	ui = {
		-- a number <1 is a percentage., >1 is a fixed size
		size = { width = 0.8, height = 0.8 },
		wrap = true, -- wrap the lines in the ui
		-- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
		border = 'rounded',
		title = nil, ---@type string only works when border is not "none"
		title_pos = 'center', ---@type "center" | "left" | "right"
		-- Show pills on top of the Lazy window
		pills = true, ---@type boolean
		icons = {
			cmd = ' ',
			config = '',
			event = '',
			ft = ' ',
			init = ' ',
			import = ' ',
			keys = ' ',
			lazy = '󰒲 ',
			loaded = '●',
			not_loaded = '○',
			plugin = ' ',
			runtime = ' ',
			source = ' ',
			start = '',
			task = '✔ ',
			list = {
				'●',
				'➜',
				'★',
				'‒',
			},
		},
		-- leave nil, to automatically select a browser depending on your OS.
		-- If you want to use a specific browser, you can define it here
		browser = nil, ---@type string?
		throttle = 20, -- how frequently should the ui process render events
		custom_keys = {
			-- you can define custom key maps here.
			-- To disable one of the defaults, set it to false

			-- open lazygit log
			['<localleader>l'] = function(plugin)
				require('lazy.util').float_term({ 'lazygit', 'log' }, {
					cwd = plugin.dir,
				})
			end,

			-- open a terminal for the plugin dir
			['<localleader>t'] = function(plugin)
				require('lazy.util').float_term(nil, {
					cwd = plugin.dir,
				})
			end,
		},
	},
	diff = {
		-- diff command <d> can be one of:
		-- * browser: opens the github compare view. Note that this is always mapped to <K> as well,
		--   so you can have a different command for diff <d>
		-- * git: will run git diff and open a buffer with filetype git
		-- * terminal_git: will open a pseudo terminal with git diff
		-- * diffview.nvim: will open Diffview to show the diff
		cmd = 'git',
	},
	checker = {
		-- automatically check for plugin updates
		enabled = false,
		concurrency = nil, ---@type number? set to 1 to check for updates very slowly
		notify = true, -- get a notification when new updates are found
		frequency = 3600, -- check for updates every hour
	},
	change_detection = {
		-- automatically check for config file changes and reload the ui
		enabled = true,
		notify = true, -- get a notification when changes are found
	},
	performance = {
		cache = {
			enabled = true,
		},
		reset_packpath = true, -- reset the package path to improve startup time
		rtp = {
			reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
			---@type string[]
			paths = {}, -- add any custom paths here that you want to includes in the rtp
			---@type string[] list any plugins you want to disable here
			disabled_plugins = {
				-- "gzip",
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				-- "tarPlugin",
				-- "tohtml",
				-- "tutor",
				-- "zipPlugin",
			},
		},
	},
	-- lazy can generate helptags from the headings in markdown readme files,
	-- so :help works even for plugins that don't have vim docs.
	-- when the readme opens with :help it will be correctly displayed as markdown
	readme = {
		enabled = true,
		root = vim.fn.stdpath('state') .. '/lazy/readme',
		files = { 'README.md', 'lua/**/README.md' },
		-- only generate markdown helptags for plugins that dont have docs
		skip_if_doc_exists = true,
	},
	state = vim.fn.stdpath('state') .. '/lazy/state.json', -- state info for checker and other things
	build = {
		-- Plugins can provide a `build.lua` file that will be executed when the plugin is installed
		-- or updated. When the plugin spec also has a `build` command, the plugin's `build.lua` not be
		-- executed. In this case, a warning message will be shown.
		warn_on_override = true,
	},
})
