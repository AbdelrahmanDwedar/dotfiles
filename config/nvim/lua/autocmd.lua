-- shurtcuts
local keymap = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local opts = { noremap = true, silent = true }

autocmd('BufWinEnter', {
	callback = function()
		vim.cmd([[highlight Todo none]])
	end,
})

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
	command = 'w | source % | PackerCompile',
	group = 'packer',
})

augroup('lsp', { clear = true })
autocmd('LspAttach', {
	callback = LspKeymaps,
})
