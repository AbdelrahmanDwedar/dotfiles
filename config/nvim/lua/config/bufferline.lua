require('bufferline').setup({
	options = {
		mode = 'buffers', -- set to "tabs" to only show tabpages instead
		themable = true,
		numbers = 'ordinal',
		close_command = 'bdelete! %d', -- can be a string | function, | false see "Mouse actions"
		right_mouse_command = 'bdelete ! %d', -- can be a string | function | false, see "Mouse actions"
		left_mouse_command = 'buffer %d', -- can be a string | function, | false see "Mouse actions"
		middle_mouse_command = nil, -- can be a string | function, | false see "Mouse actions"
		indicator = {
			icon = '▎', -- this should be omitted if indicator style is not 'icon'
			style = 'icon',
		},
		buffer_close_icon = '',
		modified_icon = '●',
		close_icon = '',
		left_trunc_marker = '',
		right_trunc_marker = '',
		--- name_formatter can be used to change the buffer's label in the bufferline.
		--- Please note some names can/will break the
		--- bufferline so use this at your discretion knowing that it has
		--- some limitations that will *NOT* be fixed.
		-- name_formatter = function(buf) -- buf contains:
		-- name                | str        | the basename of the active file
		-- path                | str        | the full path of the active file
		-- bufnr (buffer only) | int        | the number of the active buffer
		-- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
		-- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
		-- end,
		max_name_length = 22,
		max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
		truncate_names = true, -- whether or not tab names should be truncated
		tab_size = 18,
		diagnostics = 'nvim_lsp',
		diagnostics_update_in_insert = false,
		-- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
		---@diagnostic disable-next-line: unused-local
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = ' '
			for e, n in pairs(diagnostics_dict) do
				local sym = e == 'error' and ' ' or (e == 'warning' and ' ' or ' ')
				s = s .. n .. sym
			end
			return s .. '(' .. count .. ')'
		end,
		-- NOTE: this will be called a lot so don't do any heavy processing here
		custom_filter = function(buf_number, buf_numbers)
			-- filter out filetypes you don't want to see
			if vim.bo[buf_number].filetype ~= 'db' then
				return true
			end
			-- filter out by buffer name
			if vim.fn.bufname(buf_number) ~= '<buffer-name-I-dont-want>' then
				return true
			end
			-- filter out based on arbitrary rules
			-- e.g. filter out vim wiki buffer from tabline in your work repo
			if vim.fn.getcwd() == '<work-repo>' and vim.bo[buf_number].filetype ~= 'wiki' then
				return true
			end
			-- filter out by it's index number in list (don't show first buffer)
			if buf_numbers[1] ~= buf_number then
				return true
			end
		end,
		offsets = {
			{
				filetype = 'NvimTree',
				text = 'File Explorer',
				text_align = 'center',
				separator = true,
			},
		},
		color_icons = true,
		get_element_icon = function(element)
			-- element consists of {filetype: string, path: string, extension: string, directory: string}
			-- This can be used to change how bufferline fetches the icon
			-- for an element e.g. a buffer or a tab.
			-- e.g.
			local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })

			return icon, hl
			-- or
			-- local custom_map = {my_thing_ft: {icon = "my_thing_icon", hl}}
			-- return custom_map[element.filetype]
		end,
		show_buffer_icons = true, -- disable filetype icons for buffers
		show_buffer_close_icons = true,
		show_close_icon = true,
		show_tab_indicators = true,
		show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
		persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
		move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
		-- can also be a table containing 2 custom separators
		-- [focused and unfocused]. eg: { '|', '|' }
		separator_style = 'think',
		enforce_regular_tabs = true,
		always_show_bufferline = true,
		hover = {
			enabled = true,
			delay = 200,
			reveal = { 'close' },
		},
		sort_by = 'insert_after_current',
		groups = {
			options = {
				toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
			},
			items = {
				{
					name = 'Tests', -- Mandatory
					highlight = { underline = true, sp = 'blue' }, -- Optional
					priority = 2, -- determines where it will appear relative to other groups (Optional)
					icon = '', -- Optional
					matcher = function(buf) -- Mandatory
						return buf.filename:match('%_test') or buf.filename:match('%_spec')
					end,
				},
				{
					name = 'Docs',
					highlight = { undercurl = true, sp = 'green' },
					auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
					matcher = function(buf)
						return buf.filename:match('%.md') or buf.filename:match('%.txt')
					end,
					separator = { -- Optional
						style = require('bufferline.groups').separator.tab,
					},
				},
			},
		},
	},
})
