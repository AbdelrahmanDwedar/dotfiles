local keymap = vim.keymap.set
local opts = function(desc)
	return { noremap = true, silent = true, desc = desc }
end
local nor = { noremap = true, silent = false }
local telescope = require('telescope.builtin')
local indent = require('treesitter_indent_object.textobj')
local gitsigns = require('gitsigns.actions')
local neotree = require('neo-tree.command')

keymap('', '<Space>', '<Nop>', opts('Leader Key'))

-- NeoTree
keymap('n', '<Leader>e', function()
	neotree.execute({
		toggle = true,
		source = 'filesystem',
		position = 'right',
	})
end, opts('Open NeoTree'))
keymap('n', '<Leader><Leader>f', function()
	neotree.execute({
		toggle = false,
		source = 'filesystem',
		position = 'right',
	})
end, opts('Focus NeoTree'))
keymap('n', '<Leader><Leader>b', function()
	neotree.execute({
		toggle = true,
		source = 'buffers',
		position = 'right',
	})
end, opts('Toggle Buffers Tree'))
keymap('n', '<Leader><Leader>g', function()
	neotree.execute({
		toggle = true,
		source = 'git_status',
		position = 'right',
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
keymap('n', '<Leader>fb', telescope.buffers, opts('Find Text'))
keymap('n', '<Leader>fg', telescope.git_branches, opts('Gind Branch'))
keymap('n', '<Leader>ff', function()
	telescope.find_files(require('telescope.themes').get_dropdown({ previewer = false }))
end, opts('Find Files'))
keymap('n', '<Leader>fk', telescope.keymaps, opts('Find Keymap'))
keymap('n', '<Leader>fr', telescope.registers, opts('Find Register'))
keymap('n', '<Leader>fs', telescope.spell_suggest, opts('Find Spelling'))
keymap('n', '<Leader>fc', telescope.colorscheme, opts('Find colorscheme'))
keymap('n', '<Leader>fm', telescope.marks, opts('Find Mark'))
keymap('n', '<Leader>fh', telescope.help_tags, opts('Find Help Tags'))
keymap('n', '<Leader>fp', require('telescope').extensions.project.project, opts('Find Project'))
keymap('n', '<Leader>fw', require('telescope').extensions.git_worktree.git_worktrees, opts('Find Worktree'))
keymap('n', '<leader>fia', telescope.symbols, opts('Find All Icons'))
keymap('n', '<leader>fin', function()
	telescope.symbols({ sources = { 'nerd' } })
end, opts('Find Nerdfonts Icons'))
keymap('n', '<leader>fie', function()
	telescope.symbols({ sources = { 'emoji' } })
end, opts('Find Emoji Icons'))
keymap('n', '<leader>fik', function()
	telescope.symbols({ sources = { 'kaomoji' } })
end, opts('Find Kaomoji Icons'))
keymap('n', '<leader>fim', function()
	telescope.symbols({ sources = { 'math' } })
end, opts('Find Math Icons'))
keymap('n', '<leader>fil', function()
	telescope.symbols({ sources = { 'latex' } })
end, opts('Find LaTeX Icons'))
keymap('n', '<leader>fig', function()
	telescope.symbols({ sources = { 'gitmoji' } })
end, opts('Find Gitmoji Icons'))
keymap('n', '<leader>fdc', function()
	require('telescope').extensions.dap.commands({})
end, opts('Find DAP Commands'))
keymap('n', '<leader>fdb', function()
	require('telescope').extensions.dap.list_breakpoints({})
end, opts('Find DAP Breakpoint'))
keymap('n', '<leader>fdv', function()
	require('telescope').extensions.dap.variales({})
end, opts('Find DAP Variales'))
keymap('n', '<leader>fdf', function()
	require('telescope').extensions.dap.frames({})
end, opts('Find DAP Frame'))
keymap({ 'n', 'x' }, '<leader>rr', function()
	require('telescope').extensions.refactoring.refactors()
end)
keymap('n' ,'<leader>fT','<cmd>TodoTelescope<CR>')

-- Trouble
keymap('n' ,'<leader>tt', '<cmd>Trouble todo<CR>', opts('Trouble: show todo list'))
keymap('n' ,'<leader>td', '<cmd>Trouble diagnostics<CR>', opts('Trouble: show todo list'))

-- refactor
-- Extract function supports only visual mode
keymap('x', '<leader>re', function()
	require('refactoring').refactor('Extract Function')
end)
keymap('x', '<leader>rf', function()
	require('refactoring').refactor('Extract Function To File')
end)
-- Extract variable supports only visual mode
keymap('x', '<leader>rv', function()
	require('refactoring').refactor('Extract Variable')
end)
-- Inline func supports only normal
keymap('n', '<leader>rI', function()
	require('refactoring').refactor('Inline Function')
end)
-- Inline var supports both normal and visual mode
keymap({ 'n', 'x' }, '<leader>ri', function()
	require('refactoring').refactor('Inline Variable')
end)
-- Extract block supports only normal mode
keymap('n', '<leader>rb', function()
	require('refactoring').refactor('Extract Block')
end)
keymap('n', '<leader>rbf', function()
	require('refactoring').refactor('Extract Block To File')
end)

-- dap
keymap('n', '<Leader>db', require('dap').toggle_breakpoint, opts())
keymap('n', '<Leader>ds', require('dap').continue, opts())
keymap('n', '<Leader>dj', require('dap').step_over, opts())
keymap('n', '<Leader>dl', require('dap').step_into, opts())

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
	keymap('n', '<leader>la', function()
		vim.lsp.buf.code_action()
	end, opts('Code Actions'))
	keymap('n', ']d', function()
		vim.diagnostic.goto_next({ buffer = ev.buf })
	end, opts('Go To Next Diagnostics Issue'))
	keymap('n', '[d', function()
		vim.diagnostic.goto_prev({ buffer = ev.buf })
	end, opts('Go To Prev Diagnostics Issue'))
	keymap('n', '<leader>lr', function()
		vim.lsp.buf.rename()
	end, opts('Rename'))
	keymap('n', '<leader>li', ':LspInfo<CR>', opts('LSP Info'))
end
keymap('n', '<Leader>i', function()
	vim.cmd([[Format]])
end, opts('Format'))

-- multi-cursors
keymap({ 'n', 'v' }, '<C-n>', ':MCstart<CR>', opts('Start Multicursors'))
keymap({ 'n', 'v' }, '<leader>mn', ':MCstart<CR>', opts('Start Multicursors'))
keymap({ 'n', 'v' }, '<leader>mv', ':MCvisual<CR>', opts('Search Visual Multicursors'))
keymap({ 'n', 'v' }, '<leader>mc', ':MCunderCursor<CR>', opts('Multi Under Cursor'))
keymap({ 'n', 'v' }, '<leader>mq', ':MCexit<CR>', opts('Exit Multicursors'))
keymap({ 'n', 'v' }, '<leader>mp', ':MCpattern<C>', opts('Multicursors Pattern'))

-- Neotest
keymap('n', '<leader>ur', function()
	require('neotest').run.run()
end, opts('Neotest: run current test'))
keymap('n', '<leader>uf', function()
	require('neotest').run.run({ vim.fn.expand('%') })
end, opts('Neotest: run tests in current file'))
keymap('n', '<leader>us', function()
	require('neotest').summary.toggle()
end)
keymap('n', '<leader>uw', function()
	require('neotest').watch.toggle()
end)
keymap('n', ']u', function()
	require('neotest').jump.next()
end)
keymap('n', '[u', function()
	require('neotest').jump.prev()
end)

-- TODO tree
keymap('n', ']t' , require("todo-comments").jump_next, opts('Todo jump next'))
keymap('n', '[t' , require("todo-comments").jump_prev, opts('Todo jump previous'))

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
keymap('n', ']g', gitsigns.next_hunk, opts('Git Next'))
keymap('n', '[g', gitsigns.prev_hunk, opts('Git Prev'))
keymap('n', '<leader>gb', gitsigns.blame_line, opts('Git Blame'))
keymap('n', '<leader>gl', gitsigns.toggle_current_line_blame, opts('Toggle Line Blame'))
keymap('n', '<leader>gi', gitsigns.preview_hunk_inline, opts('Preview Inline'))
keymap('n', '<leader>gr', gitsigns.reset_hunk, opts('Git Reset'))
keymap('n', '<leader>gw', gitsigns.toggle_word_diff, opts('Word Diff'))
keymap('n', '<leader>gp', gitsigns.preview_hunk, opts('Git Preview'))
keymap('n', '<leader>ga', gitsigns.stage_hunk, opts('Git Stage Hunk'))

-- Neogit
keymap('n', '<leader>go', function()
	require('neogit').open({ kind = 'floating' })
end, opts('NeoGit: Open'))
keymap('n', '<leader>gc', function()
	require('neogit').open({ 'commit' })
end, opts('NeoGit: Make commit'))

-- plenary.nvim
function TestKeymaps()
	keymap('n', '<leader>pt', function()
		require('plenary.test_harness').test_directory(vim.fn.expand('%:p'))
	end, opts('Run Current File Tests'))
end

-- buffers
keymap('n', 'gb', '<cmd>bnext<CR>', opts('Go to next buffer'))
keymap('n', 'gB', '<cmd>bNext<CR>', opts('Go to previous buffer'))

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
keymap('n', '<C-h>', '<Esc><C-w>h', opts())
keymap('n', '<C-j>', '<Esc><C-w>j', opts())
keymap('n', '<C-k>', '<Esc><C-w>k', opts())
keymap('n', '<C-l>', '<Esc><C-w>l', opts())
keymap('n', '<C-=>', '<Esc><C-w>=', opts())
-- Split resizing
keymap('n', '<C-Left>', '<Esc>:vertical resize -3<CR>', opts())
keymap('n', '<C-Right>', '<Esc>:vertical resize +3<CR>', opts())
keymap('n', '<C-Up>', '<Esc>:resize +3<CR>', opts())
keymap('n', '<C-Down>', '<Esc>:resize -3<CR>', opts())

-- action on entire page
keymap({ 'v', 'o' }, 'ae', ':<C-u>normal! gg0vG$<CR>', nor)

-- AI
