require('nvim-web-devicons').setup({
	override = {
		svg = {
			icon = '󰜡',
			color = '#FFB13B',
			cterm_color = '214',
			name = 'Svg',
		},
	},
	color_icons = true,
	default = false,
	strict = false,
	override_by_filename = {
		['.gitignore'] = {
			icon = '',
			color = '#f1502f',
			name = 'Gitignore',
		},
	},
	override_by_extension = {
		['log'] = {
			icon = '',
			color = '#81e043',
			name = 'Log',
		},
	},
})
