require('better-comment').Setup({
	tags = {
		-- ! comment
		{
			name = '!',
			fg = '#FF2D00',
			bg = '',
			bold = false,
			virtual_text = '',
		},

		-- ? comment
		{
			name = '?',
			fg = '#3498DB',
			bg = '',
			bold = false,
			virtual_text = '',
		},

		-- // comment
		{
			name = '//',
			fg = '#474747',
			bg = '',
			bold = false,
			virtual_text = '',
		},

		-- todo:
		{
			name = 'todo',
			fg = '#FF8C00',
			bg = '',
			bold = true,
			virtual_text = '',
		},

		-- TODO
		{
			name = 'TODO',
			fg = '#FF8C00',
			bg = '',
			bold = true,
			virtual_text = '',
		},

		-- * list
		-- * of
		-- * items
		{
			name = '*',
			fg = '#98C379',
			bg = '',
			bold = false,
			virtual_text = '',
		},
	},
})
