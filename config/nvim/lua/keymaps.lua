local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local nor = { noremap = true, silent = false }
local telescope = require('telescope.builtin')
local multi = require('multicursors')
local indent = require('treesitter_indent_object.textobj')
local gitsigns = require('gitsigns.actions')

--Remap space as leader key
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- nvim tree (lua) fast access shortcuts
keymap('n', '<Leader>e', require('nvim-tree.api').tree.toggle, opts)
keymap('n', '<Leader><Leader>f', require('nvim-tree.api').tree.focus, opts)

-- Telescope
keymap('n', '<Leader>ft', telescope.builtin, opts)
keymap('n', '<Leader>fb', telescope.git_branches, opts)
keymap('n', '<Leader>ff', function()
	telescope.find_files(require('telescope.themes').get_dropdown({ previewer = false }))
end, opts)
keymap('n', '<Leader>fk', telescope.keymaps, opts)
keymap('n', '<Leader>fg', telescope.registers, opts)
keymap('n', '<Leader>fs', telescope.spell_suggest, opts)
keymap('n', '<Leader>fc', telescope.colorscheme, opts)
keymap('n', '<Leader>fm', telescope.marks, opts)
keymap('n', '<Leader>fp', function()
	require('telescope').extensions.project.project()
end, opts)
keymap({ 'n', 'i' }, '<C-p>', telescope.find_files, opts)

-- lsp
function LspKeymaps(ev)
	keymap('n', 'gh', function()
		vim.lsp.buf.hover({ buffer = ev.buf })
	end, opts)
	keymap('n', 'gD', function()
		vim.lsp.buf.declaration()
	end, opts)
	keymap('n', 'gd', function()
		telescope.lsp_definitions()
	end, opts)
	keymap('n', 'gi', function()
		telescope.lsp_implementations()
	end, opts)
	keymap('n', 'gr', function()
		telescope.lsp_references()
	end, opts)
	keymap('n', 'gl', function()
		vim.diagnostic.open_float()
	end, opts)
	keymap('n', '<leader>i', function()
		vim.lsp.buf.format({ async = true, buffer = ev.buf })
	end, opts)
	keymap('n', '<leader>la', function()
		vim.lsp.buf.code_action()
	end, opts)
	keymap('n', '<leader>lj', function()
		vim.diagnostic.goto_next({ buffer = ev.buf })
	end, opts)
	keymap('n', '<leader>lk', function()
		vim.diagnostic.goto_prev({ buffer = ev.buf })
	end, opts)
	keymap('n', '<leader>lr', function()
		vim.lsp.buf.rename()
	end, opts)
	keymap('n', '<leader>li', ':LspInfo<CR>', opts)
end

-- multi-cursors
keymap({ 'n', 'v' }, '<C-n>', multi.start, opts)
keymap({ 'n', 'v' }, '<leader>mn', multi.start, opts)
keymap({ 'n', 'v' }, '<leader>mv', multi.search_visual, opts)
keymap({ 'n', 'v' }, '<leader>mc', multi.new_under_cursor, opts)
keymap({ 'n', 'v' }, '<leader>mq', multi.exit, opts)
keymap({ 'n', 'v' }, '<leader>mp', multi.new_pattern, opts)

-- indent selecting
keymap({ 'x', 'o' }, 'ai', indent.select_indent_outer, opts)
keymap({ 'x', 'o' }, 'aI', function()
	indent.select_indent_outer(true)
end, opts)
keymap({ 'x', 'o' }, 'ii', indent.select_indent_inner, opts)
keymap({ 'x', 'o' }, 'iI', function()
	indent.select_indent_inner(true)
end, opts)

-- Gitsigns
keymap('n', '<leader>gj', gitsigns.next_hunk, opts)
keymap('n', '<leader>gk', gitsigns.prev_hunk, opts)
keymap('n', '<leader>gb', gitsigns.blame_line, opts)
keymap('n', '<leader>gl', gitsigns.toggle_current_line_blame, opts)
keymap('n', '<leader>gi', gitsigns.preview_hunk_inline, opts)
keymap('n', '<leader>gr', gitsigns.reset_hunk, opts)
keymap('n', '<leader>gw', gitsigns.toggle_word_diff, opts)
keymap('n', '<leader>gp', gitsigns.preview_hunk, opts)

-- new line
keymap({ 'n', 'i' }, '<C-Enter>', '<Esc>o<Esc>', opts)

-- remove a word backwards
keymap({ 'i', 'c' }, '<C-BS>', '<C-w>', nor)

-- Paste without counting the deleted values
keymap('n', '"p', '"0p', opts)
keymap('n', '"P', '"0P', opts)

-- selecting last change
keymap('n', 'gV', '`[v`]', opts)

-- Stay in visual mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- save and source
keymap('n', '<Leader><Leader>x', ':w<CR>:source %<CR>', opts)

-- Sorting code blocks
keymap('x', '<Leader><Leader>s', ':sort<CR>', opts)

-- Edit replace selected text
keymap({ 'v', 'x' }, '<Leader>sa', ':<CR>:%s//', nor)
keymap('n', '<Leader>sa', '*:%s//', nor)

-- move text up and down
keymap('x', '<A-j>', ":move '>+1<CR>gv-gv", nor)
keymap('x', '<A-k>', ":move '<-2<CR>gv-gv", nor)
keymap('n', '<A-j>', ':m .+1<CR>==', opts)
keymap('n', '<A-k>', ':m .-2<CR>==', opts)
keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', opts)
keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', opts)

-- Tabs shortcuts
keymap('n', '<Leader>tf', ':tabfind ', nor)
keymap('n', '<Leader>td', ':tabclose<CR>', opts)
keymap('n', '<Leader>tn', ':tabnew<CR>', opts)

-- Splits --
-- Splits moving with ctrl + hjkl shortcuts
keymap({ 'n', 'i', 't' }, '<C-h>', '<Esc><C-w>h', opts)
keymap({ 'n', 'i', 't' }, '<C-j>', '<Esc><C-w>j', opts)
keymap({ 'n', 'i', 't' }, '<C-k>', '<Esc><C-w>k', opts)
keymap({ 'n', 'i', 't' }, '<C-l>', '<Esc><C-w>l', opts)
keymap({ 'n', 'i', 't' }, '<C-=>', '<Esc><C-w>=', opts)
-- Split resizing
keymap({ 'n', 't' }, '<C-Left>', '<Esc>:vertical resize +3<CR>', opts)
keymap({ 'n', 't' }, '<C-Right>', '<Esc>:vertical resize -3<CR>', opts)
keymap({ 'n', 't' }, '<C-Up>', '<Esc>:resize +3<CR>', opts)
keymap({ 'n', 't' }, '<C-Down>', '<Esc>:resize -3<CR>', opts)
