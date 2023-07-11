-- shurtcuts
local keymap = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local opts = { noremap = true, silent = true }
local nor = { noremap = true, silent = false }

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
		require('vim.highlight').on_yank({ higroup = 'Visual', timeout = 200 })
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

augroup('autoResize', { clear = true })
autocmd('VimResized', {
	pattern = '*',
	command = 'tabdo wincmd =',
})

augroup('foldindent', { clear = true })
autocmd('FileType', {
	pattern = { 'lua', 'python', 'ruby', 'bash' },
	command = 'setlocal foldmethod=indent',
	group = 'foldindent',
})

augroup('_semicolon', { clear = true })
autocmd('FileType', {
	pattern = { 'c', 'cpp', 'rust' },
	callback = function()
		keymap('n', ';;', 'a::<Esc>', opts)
	end,
	group = '_semicolon',
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
			vim.lsp.buf.definition()
		end, opts)
		keymap('n', 'gh', function()
			vim.lsp.buf.hover({ buffer = true })
		end, opts)
		keymap('n', 'gI', function()
			vim.lsp.buf.implementation()
		end, opts)
		keymap('n', 'gR', function()
			vim.lsp.buf.references()
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
