return function()
	require('gitsigns').setup({
		-- signs = {
		-- 	add = { hl = 'GitSignsAdd', text = '▎', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
		-- 	change = { hl = 'GitSignsChange', text = '▎', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
		-- 	delete = { hl = 'GitSignsDelete', text = '󰐊', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
		-- 	topdelete = {
		-- 		hl = 'GitSignsDelete',
		-- 		text = '󰐊',
		-- 		numhl = 'GitSignsDeleteNr',
		-- 		linehl = 'GitSignsDeleteLn',
		-- 	},
		-- 	changedelete = {
		-- 		hl = 'GitSignsChange',
		-- 		text = '▎',
		-- 		numhl = 'GitSignsChangeNr',
		-- 		linehl = 'GitSignsChangeLn',
		-- 	},
		-- },
		signcolumn = true,
		numhl = false,
		linehl = false,
		word_diff = false,
		watch_gitdir = {
			interval = 1000,
			follow_files = true,
		},
		attach_to_untracked = true,
		current_line_blame = true,
		-- current_line_blame_opts = {
		-- 	virt_text = true,
		-- 	virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
		-- 	delay = 1000,
		-- 	ignore_whitespace = false,
		-- },
		-- current_line_blame_formatter_opts = {
		-- 	relative_time = false,
		-- },
		sign_priority = 6,
		update_debounce = 100,
		status_formatter = nil, -- Use default
		max_file_length = 40000,
		preview_config = {
			-- Options passed to nvim_open_win
			border = 'rounded',
			style = 'minimal',
			relative = 'cursor',
			row = 0,
			col = 1,
		},
	})

	vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'DiffAdd' })
vim.api.nvim_set_hl(0, 'GitSignsAddLn', { link = 'DiffAdd' })
vim.api.nvim_set_hl(0, 'GitSignsAddNr', { link = 'DiffAdd' })
vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'DiffChange' })
vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { link = 'DiffChange' })
vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { link = 'DiffChange' })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'DiffDelete' })
vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { link = 'DiffDelete' })
vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { link = 'DiffDelete' })
vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { link = 'DiffDelete' })
vim.api.nvim_set_hl(0, 'GitSignsTopdeleteLn', { link = 'DiffDelete' })
vim.api.nvim_set_hl(0, 'GitSignsTopdeleteNr', { link = 'DiffDelete' })

end
