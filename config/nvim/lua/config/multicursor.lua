local multi = require('multicursors')
local N = require('multicursors.normal_mode')

multi.setup({
	normal_keys = {
		['<C-/>'] = {
			method = function()
				require('multicursors.utils').call_on_selections(function(selection)
					vim.api.nvim_win_set_cursor(0, { selection.row + 1, selection.col + 1 })
					local line_count = selection.end_row - selection.row + 1
					vim.cmd('normal ' .. line_count .. 'gcc')
				end)
			end,
			opts = { desc = 'comment selections' },
		},
		['<C-n>'] = {
			method = N.find_next,
			opts = { desc = 'Find next' },
		},
		['<C-N>'] = {
			method = N.find_prev,
			opts = { desc = 'Find prev' },
		},
		['<C-c>'] = { method = nil, opts = { desc = 'exit' } },
	},
})
