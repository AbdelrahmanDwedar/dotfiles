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

-- nvim-tree
-- autocmd('VimEnter', {
-- 	pattern = '*',
-- 	callback = require('config.nvim-tree').open_nvim_tree,
-- })
