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

local general_group = augroup('_general_settings', { clear = true })
autocmd('FileType', {
	pattern = { 'qf', 'help', 'man', 'lspinfo' },
	callback = function()
		keymap('n', 'q', ':close<CR>', opts)
	end,
	group = general_group,
})
autocmd('TextYankPost', {
	pattern = '*',
	callback = function()
		vim.highlight.on_yank({ higroup = 'Visual', timeout = 200 })
	end,
	group = general_group,
})
autocmd('BufWinEnter', {
	pattern = '*',
	command = 'set formatoptions-=cro',
	group = general_group,
})
autocmd('FileType', {
	pattern = 'qf',
	command = 'set nobuflisted',
	group = general_group,
})

local fast_group = augroup('_fast', { clear = true })
autocmd('FileType', {
	pattern = { 'gitcommit', 'markdown' },
	command = 'setlocal wrap',
	group = fast_group,
})

local lsp_group = augroup('lsp', { clear = true })
autocmd('LspAttach', {
	callback = LspKeymaps,
	group = lsp_group,
})

autocmd({ 'BufWritePost', 'BufWinEnter' }, {
	callback = function()
		---@diagnostic disable-next-line: different-requires
		require('lint').try_lint()
	end,
})

autocmd('BufEnter', {
	pattern = '*_spec.lua',
	callback = TestKeymaps,
})
