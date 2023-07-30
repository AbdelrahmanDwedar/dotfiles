-- shurtcuts
local telescope = require('telescope.builtin')
local keymap = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local opts = { noremap = true, silent = true }

augroup('_general_settings', { clear = true })
autocmd('FileType', {
	pattern = { 'qf', 'help', 'man', 'lspinfo' },
	callback = function()
		keymap('n', 'q', ':close<CR>', opts)
	end,
	group = '_general_settings',
})
autocmd('TextYankPost', {
	pattern = '*',
	callback = function()
		vim.highlight.on_yank({ higroup = 'Visual', timeout = 200 })
	end,
	group = '_general_settings',
})
autocmd('BufWinEnter', {
	pattern = '*',
	command = 'set formatoptions-=cro',
	group = '_general_settings',
})
autocmd('FileType', {
	pattern = 'qf',
	command = 'set nobuflisted',
	group = '_general_settings',
})

augroup('_fast', { clear = true })
autocmd('FileType', {
	pattern = { 'gitcommit', 'markdown' },
	command = 'setlocal wrap',
	group = '_fast',
})
autocmd('FileType', {
	pattern = { 'gitcommit', 'markdown' },
	command = 'setlocal spell',
	group = '_fast',
})

-- packer
augroup('packer', { clear = true })
autocmd('VimLeavePre', {
	pattern = '*',
	command = 'PackerSync',
	group = 'packer',
})
autocmd('BufWritePost', {
	pattern = 'plugins.lua',
	command = 'source % | PackerCompile',
	group = 'packer',
})

augroup('lsp', { clear = true })
autocmd('LspAttach', {
	callback = function(ev)
		keymap('n', 'gD', function()
			vim.lsp.buf.declaration()
		end, opts)
		keymap('n', 'gd', function()
			telescope.lsp_definitions()
		end, opts)
		keymap('n', 'gh', function()
			vim.lsp.buf.hover({ buffer = true })
		end, opts)
		keymap('n', 'gI', function()
			telescope.lsp_implementations()
		end, opts)
		keymap('n', 'gR', function()
			telescope.lsp_references()
		end, opts)
		keymap('n', 'gl', function()
			vim.diagnostic.open_float()
		end, opts)
		keymap('n', '<leader>i', function()
			vim.lsp.buf.format({ async = true, buffer = true })
		end, opts)
		keymap('n', '<leader>la', function()
			vim.lsp.buf.code_action()
		end, opts)
		keymap('n', '<leader>lj', function()
			vim.diagnostic.goto_next({ buffer = 0 })
		end, opts)
		keymap('n', '<leader>lk', function()
			vim.diagnostic.goto_prev({ buffer = 0 })
		end, opts)
		keymap('n', '<leader>lr', function()
			vim.lsp.buf.rename()
		end, opts)
		keymap('n', '<leader>ls', function()
			vim.lsp.buf.signature_help()
		end, opts)
		keymap('n', '<leader>lq', function()
			vim.diagnostic.setloclist()
		end, opts)
		keymap('n', '<leader>li', '<cmd>LspInfo<cr>', opts)
		keymap('n', '<leader>lI', '<cmd>LspInstallInfo<cr>', opts)
	end,
})
