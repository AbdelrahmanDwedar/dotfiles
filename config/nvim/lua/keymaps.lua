local opts = { noremap = true, silent = true }
local nor = { noremap = true, silent = false }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- nvim tree (lua) fast access shortcuts
keymap('n', '<Leader>e', require('nvim-tree.api').tree.toggle, opts)
keymap('n', '<Leader><Leader>f', require('nvim-tree.api').tree.focus, opts)

-- Telescope
keymap('n', '<Leader>tt', ':Telescope ', nor)
keymap('n', '<Leader>fb', function()
	require('telescope.builtin').git_branches()
end, opts)
keymap('n', '<Leader>ff', function()
	require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ previewer = false }))
end, opts)
keymap('n', '<Leader>fg', function()
	require('telescope.builtin').registers()
end, opts)
keymap('n', '<Leader>fs', function()
	require('telescope.builtin').spell_suggest()
end, opts)
keymap('n', '<Leader>fc', function()
	require('telescope.builtin').colorscheme()
end, opts)
keymap('n', '<Leader>fm', function()
	require('telescope.builtin').marks()
end, opts)
keymap('n', '<Leader>fp', function()
	require('telescope.builtin').extensions.project.project()
end, opts)
keymap({ 'n', 'i' }, '<C-p>', function()
	require('telescope.builtin').find_files()
end, opts)

-- vim multi corsur
keymap({ 'n', 'v' }, '<C-c>', ':VMClear<CR>', opts)

-- new line
keymap({ 'n', 'i' }, '<C-Enter>', '<Esc>o<Esc>', opts)

-- remove a word backwards
keymap({ 'i', 'c' }, '<C-BS>', '<C-w>', nor)

-- Paste without counting the deleted values
keymap('n', '"p', '"0p', opts)
keymap('n', '"P', '"0P', opts)

-- add semicolon in the end
keymap('n', '<Leader>;', 'A;<Esc>', opts)
keymap('x', '<Leader>;', ':norm A;<Esc>', opts)

-- arrows for gj & gk (when using warping mode)
keymap('n', '<Down>', 'gj', opts)
keymap('n', '<Up>', 'gk', opts)

-- selecting last change
keymap('n', 'gV', '`[v`]', opts)

-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- save and source
keymap('n', '<Leader><Leader>x', ':w<CR>:source %<CR>', opts)

-- Sorting code blocks
keymap('x', '<Leader><Leader>s', ':!sort<CR>', opts)

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
