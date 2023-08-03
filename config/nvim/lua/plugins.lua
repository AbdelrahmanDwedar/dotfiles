---@diagnostic disable: undefined-global
-- Plugins managing by packer.nvim
return require('packer').startup(function()
	use('wbthomason/packer.nvim')

	-- === #### NeoVim plugins #### === --

	-- language server protocol
	use({
		'neovim/nvim-lspconfig',
		requires = {
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
		},
	})

	-- null-ls formatting
	use({
		'jose-elias-alvarez/null-ls.nvim',
		on_attach = function(client, bufnr)
			if client.supports_method('textDocument/formatting') then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd('BufWritePre', {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.formatting_sync()
					end,
				})
			end
		end,
	})

	-- neovim completion
	use({
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-nvim-lua',
			'hrsh7th/cmp-cmdline',
			'saadparwaiz1/cmp_luasnip',
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

	-- git signs integration
	use('lewis6991/gitsigns.nvim')

	-- lua status bar
	use('nvim-lualine/lualine.nvim')

	-- auto completion for {([" etc...
	use({
		'windwp/nvim-autopairs',
		config = function()
			require('nvim-autopairs').setup({})
		end,
	})

	-- Telescope for navigation
	use({
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			-- extentions
			'nvim-telescope/telescope-project.nvim',
		},
	})

	-- better comments
	use('Djancyp/better-comments.nvim')

	-- discord presence for neovim
	use('andweeb/presence.nvim')

	-- NeoVim Tree written in lua
	use('kyazdani42/nvim-tree.lua')

	-- For Commenting gcc & gc
	use({
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end,
	})

	-- shortcut to surround code with {([])} or tags etc...
	use({
		'kylechui/nvim-surround',
		tag = '*', -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require('nvim-surround').setup()
		end,
	})

	-- bufferline
	use({
		'akinsho/bufferline.nvim',
		tag = 'v3.*',
	})

	-- web devicons
	use('kyazdani42/nvim-web-devicons')

	-- marks
	use('chentoast/marks.nvim')

	-- multi-cursors
	use({
		'smoka7/multicursors.nvim',
		requires = {
			'smoka7/hydra.nvim',
		},
	})

	-- best neovim colorschemes in one place
	-- use('AbdelrahmanDwedar/awesome-nvim-colorschemes')
	use('~/Programming/projects/extentions/awesome-nvim-colorschemes')

	-- === #### Native vim plugins ### === ---

	-- wakatime watcher
	use('wakatime/vim-wakatime')

	-- editor config plugin for the /.editorconfig settings
	use('editorconfig/editorconfig-vim')
end)
