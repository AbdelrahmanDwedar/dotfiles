return function()
	local action_layout = require('telescope.actions.layout')
	local actions = require('telescope.actions')

	require('telescope').setup({
		defaults = {
			mappings = {
				i = {
					['<C-h>'] = 'which_key',
					['?'] = action_layout.toggle_preview,
					['<C-j>'] = actions.move_selection_next,
					['<C-k>'] = actions.move_selection_previous,
				},
			},
		},
		pickers = {
			find_files = {
				prompt_prefix = '🔍 ',
			},
			git_branches = {
				prompt_prefix = '🔍 ',
			},
			marks = {
				prompt_prefix = '🔍 ',
			},
		},
		extensions = {
			project = {
				base_dirs = {
					{ '~/Programming/projects/', max_depth = 3 },
				},
				hidden_files = true, -- default: false
				theme = 'dropdown',
				order_by = 'asc',
				sync_with_nvim_tree = true, -- default false
			},
		},
	})

	require('telescope').load_extension('project')
	require('telescope').load_extension('git_worktree')
	require('telescope').load_extension('refactoring')
end
