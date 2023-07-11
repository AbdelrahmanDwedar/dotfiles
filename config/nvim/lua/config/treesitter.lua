require('nvim-treesitter.configs').setup({
	ensure_installed = 'all', -- one of "all" or a list of languages
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { 'css' }, -- list of language that will be disabled
		additional_vim_regex_highlighting = false,
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { 'python', 'css' } },
	refactor = {
		highlight_definitions = {
			enable = true,
			-- Set to false if you have an `updatetime` of ~100.
			clear_on_cursor_move = true,
		},
		smart_rename = {
			enable = true,
			-- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
			keymaps = {
				smart_rename = 'grr',
			},
		},
	},
})

require('treesitter-context').setup({
	enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
	max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
	min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
	line_numbers = true,
	multiline_threshold = 35, -- Maximum number of lines to collapse for a single context line
	trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
	mode = 'topline', -- Line used to calculate context. Choices: 'cursor', 'topline'
	-- Separator between context and content. Should be a single character string, like '-'.
	-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
	separator = nil,
	zindex = 20, -- The Z-index of the context window
	on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
})
