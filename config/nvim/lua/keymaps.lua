local keymap = vim.keymap.set
local opts = function(desc)
	return { noremap = true, silent = true, desc = desc }
end
local nor = { noremap = true, silent = false }
local telescope = require('telescope.builtin')
local multi = require('multicursors')
local indent = require('treesitter_indent_object.textobj')
local gitsigns = require('gitsigns.actions')
local neotree = require('neo-tree.command')

--Remap space as leader key
keymap('', '<Space>', '<Nop>', opts('Leader Key'))
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- NeoTree
keymap('n', '<Leader>e', function()
	neotree.execute({
		toggle = true,
		source = 'filesystem',
		position = 'left',
	})
end, opts('Open NeoTree'))
keymap('n', '<Leader><Leader>f', function()
	neotree.execute({
		toggle = false,
		source = 'filesystem',
		position = 'left',
	})
end, opts('Focus NeoTree'))
keymap('n', '<Leader><Leader>b', function()
	neotree.execute({
		toggle = true,
		source = 'buffers',
		position = 'left',
	})
end, opts('Toggle Buffers Tree'))
keymap('n', '<Leader><Leader>g', function()
	neotree.execute({
		toggle = true,
		source = 'git_status',
		position = 'left',
	})
end, opts('Open NeoTree Git Status'))
keymap('n', '<Leader>tf', function()
	neotree.execute({
		toggle = true,
		source = 'filesystem',
		position = 'float',
	})
end, opts('Toggle Float File Tree'))
keymap('n', '<Leader>tb', function()
	neotree.execute({
		toggle = true,
		source = 'buffers',
		position = 'float',
	})
end, opts('Toggle Buffers Tree'))
keymap('n', '<Leader>tg', function()
	neotree.execute({
		toggle = true,
		source = 'git_status',
		position = 'float',
	})
end, opts('Open NeoTree Git Status'))

-- Telescope
-- keymap('n', '<Leader>ft', telescope.builtin, opts('Find Telescope Mode'))
keymap('n', '<Leader>ft', telescope.live_grep, opts('Find Text'))
keymap('n', '<Leader>fb', telescope.git_branches, opts('Gind Branch'))
keymap('n', '<Leader>ff', function()
	telescope.find_files(require('telescope.themes').get_dropdown({ previewer = false }))
end, opts('Find Files'))
keymap('n', '<Leader>fk', telescope.keymaps, opts('Find Keymap'))
keymap('n', '<Leader>fg', telescope.registers, opts('Find Register'))
keymap('n', '<Leader>fs', telescope.spell_suggest, opts('Find Spelling'))
keymap('n', '<Leader>fc', telescope.colorscheme, opts('Find colorscheme'))
keymap('n', '<Leader>fm', telescope.marks, opts('Find Mark'))
keymap('n', '<Leader>fp', require('telescope').extensions.project.project, opts('Find Project'))
keymap('n', '<Leader>fw', require('telescope').extensions.git_worktree.git_worktrees, opts('Find Worktree'))
keymap({ 'n', 'i' }, '<C-p>', telescope.find_files, opts('Find Files'))

-- lsp
function LspKeymaps(ev)
	keymap('n', 'gh', function()
		vim.lsp.buf.hover({ buffer = ev.buf })
	end, opts('Hover'))
	keymap('n', 'gD', function()
		vim.lsp.buf.declaration()
	end, opts('Go To Declaration'))
	keymap('n', 'gd', function()
		telescope.lsp_definitions()
	end, opts('Go To Definition'))
	keymap('n', 'gi', function()
		telescope.lsp_implementations()
	end, opts('Find Implementations'))
	keymap('n', 'gr', function()
		telescope.lsp_references()
	end, opts('Find References'))
	keymap('n', 'gl', function()
		vim.diagnostic.open_float()
	end, opts('See Diagnostics'))
	keymap('n', '<leader>i', function()
		if require("config.formatter").filetypes[vim.bo.filetype] ~= nil then
			vim.cmd([[Format]])
		else
			vim.lsp.buf.format()
		end
	end, opts('Format'))
	keymap('n', '<leader>la', function()
		vim.lsp.buf.code_action()
	end, opts('Code Actions'))
	keymap('n', '<leader>lj', function()
		vim.diagnostic.goto_next({ buffer = ev.buf })
	end, opts('Go To Next Diagnostics Issue'))
	keymap('n', '<leader>lk', function()
		vim.diagnostic.goto_prev({ buffer = ev.buf })
	end, opts('Go To Prev Diagnostics Issue'))
	keymap('n', '<leader>lr', function()
		vim.lsp.buf.rename()
	end, opts('Rename'))
	keymap('n', '<leader>li', ':LspInfo<CR>', opts('LSP Info'))
end

-- multi-cursors
keymap({ 'n', 'v' }, '<C-n>', multi.start, opts('Start Multicursors'))
keymap({ 'n', 'v' }, '<leader>mn', multi.start, opts('Start Multicursors'))
keymap({ 'n', 'v' }, '<leader>mv', multi.search_visual, opts('Search Visual Multicursors'))
keymap({ 'n', 'v' }, '<leader>mc', multi.new_under_cursor, opts('Multi Under Cursor'))
keymap({ 'n', 'v' }, '<leader>mq', multi.exit, opts('Exit Multicursors'))
keymap({ 'n', 'v' }, '<leader>mp', multi.new_pattern, opts('Multicursors Pattern'))

-- indent selecting
keymap({ 'x', 'o' }, 'ai', indent.select_indent_outer, opts())
keymap({ 'x', 'o' }, 'aI', function()
	indent.select_indent_outer(true)
end, opts())
keymap({ 'x', 'o' }, 'ii', indent.select_indent_inner, opts())
keymap({ 'x', 'o' }, 'iI', function()
	indent.select_indent_inner(true)
end, opts())

-- Gitsigns
keymap('n', '<leader>gj', gitsigns.next_hunk, opts('Git Next'))
keymap('n', '<leader>gk', gitsigns.prev_hunk, opts('Git Prev'))
keymap('n', '<leader>gb', gitsigns.blame_line, opts('Git Blame'))
keymap('n', '<leader>gl', gitsigns.toggle_current_line_blame, opts('Toggle Line Blame'))
keymap('n', '<leader>gi', gitsigns.preview_hunk_inline, opts('Preview Inline'))
keymap('n', '<leader>gr', gitsigns.reset_hunk, opts('Git Reset'))
keymap('n', '<leader>gw', gitsigns.toggle_word_diff, opts('Word Diff'))
keymap('n', '<leader>gp', gitsigns.preview_hunk, opts('Git Preview'))

-- plenary.nvim
keymap('n', '<leader>pt', function()
	require('plenary.test_harness').test_directory(vim.fn.expand('%:p'))
end, opts('Run Current File Tests'))

-- new line
keymap({ 'n', 'i' }, '<C-Enter>', '<Esc>o<Esc>', opts())

-- remove a word backwards
keymap({ 'i', 'c' }, '<C-BS>', '<C-w>', nor)

-- Paste without counting the deleted values
keymap('n', '"p', '"0p', opts())
keymap('n', '"P', '"0P', opts())

-- selecting last change
keymap('n', 'gV', '`[v`]', opts())

-- Stay in visual mode
keymap('v', '<', '<gv', opts())
keymap('v', '>', '>gv', opts())

-- save and source
keymap('n', '<Leader><Leader>s', ':w<CR>:source %<CR>', opts('Source Current File'))
keymap('n', '<Leader><Leader>x', ':source ~/.config/nvim/init.lua<CR>', opts('Source Current File'))

-- Sorting code blocks
keymap('x', '<Leader><Leader>s', ':sort<CR>', opts('Sort Block'))

-- Edit replace selected text
keymap({ 'v', 'x' }, '<Leader>sa', ':<CR>:%s//', nor)
keymap('n', '<Leader>sa', '*:%s//', nor)

-- move text up and down
keymap('x', '<A-j>', ":move '>+1<CR>gv-gv", nor)
keymap('x', '<A-k>', ":move '<-2<CR>gv-gv", nor)
keymap('n', '<A-j>', ':m .+1<CR>==', opts())
keymap('n', '<A-k>', ':m .-2<CR>==', opts())
keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', opts())
keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', opts())

-- Splits --
-- Splits moving with ctrl + hjkl shortcuts
keymap({ 'n', 'i', 't' }, '<C-h>', '<Esc><C-w>h', opts())
keymap({ 'n', 'i', 't' }, '<C-j>', '<Esc><C-w>j', opts())
keymap({ 'n', 'i', 't' }, '<C-k>', '<Esc><C-w>k', opts())
keymap({ 'n', 'i', 't' }, '<C-l>', '<Esc><C-w>l', opts())
keymap({ 'n', 'i', 't' }, '<C-=>', '<Esc><C-w>=', opts())
-- Split resizing
keymap({ 'n', 't' }, '<C-Left>', '<Esc>:vertical resize -3<CR>', opts())
keymap({ 'n', 't' }, '<C-Right>', '<Esc>:vertical resize +3<CR>', opts())
keymap({ 'n', 't' }, '<C-Up>', '<Esc>:resize +3<CR>', opts())
keymap({ 'n', 't' }, '<C-Down>', '<Esc>:resize -3<CR>', opts())
