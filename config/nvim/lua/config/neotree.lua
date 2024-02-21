return function()
	require('neo-tree').setup({
		source_selector = {
			winbar = true,
			statusline = false,
		},
		sources = {
			'filesystem',
			'buffers',
			'git_status',
			'document_symbols',
		},
		close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
		popup_border_style = 'rounded',
		enable_git_status = true,
		enable_diagnostics = true,
		enable_normal_mode_for_inputs = false, -- Enable normal mode for input dialogs.
		open_files_do_not_replace_types = { 'terminal', 'trouble', 'qf' }, -- when opening files, do not use windows containing these filetypes or buftypes
		sort_case_insensitive = false, -- used when sorting files and directories in the tree
		sort_function = nil, -- use a custom function for sorting files and directories in the tree
		-- sort_function = function (a,b)
		--       if a.type == b.type then
		--           return a.path > b.path
		--       else
		--           return a.type > b.type
		--       end
		--   end , -- this sorts files and directories descendantly
		default_component_configs = {
			container = {
				enable_character_fade = true,
			},
			indent = {
				indent_size = 2,
				padding = 1, -- extra padding on left hand side
				-- indent guides
				with_markers = true,
				indent_marker = ' ',
				last_indent_marker = ' ',
				highlight = 'NeoTreeIndentMarker',
				-- expander config, needed for nesting files
				with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
				expander_collapsed = '',
				expander_expanded = '',
				expander_highlight = 'NeoTreeExpander',
			},
			icon = {
				folder_closed = '',
				folder_open = '',
				folder_empty = '',
				-- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
				-- then these will never be used.
				default = '',
				highlight = 'NeoTreeFileIcon',
			},
			modified = {
				symbol = '+',
				highlight = 'NeoTreeModified',
			},
			name = {
				trailing_slash = true,
				use_git_status_colors = true,
				highlight = 'NeoTreeFileName',
			},
			git_status = {
				symbols = {
					-- Change type
					added = '✚', -- or "✚", but this is redundant info if you use git_status_colors on the name
					modified = '', -- or "", but this is redundant info if you use git_status_colors on the name
					deleted = '✖', -- this can only be used in the git_status source
					renamed = '󰁕', -- this can only be used in the git_status source
					-- Status type
					untracked = '',
					ignored = '',
					unstaged = '󰄱',
					staged = '',
					conflict = '',
				},
			},
		},
		-- A list of functions, each representing a global custom command
		-- that will be available in all sources (if not overridden in `opts[source_name].commands`)
		-- see `:h neo-tree-custom-commands-global`
		commands = {},
		window = {
			position = 'right',
			width = 30,
			mapping_options = {
				noremap = true,
				nowait = true,
			},
			mappings = {
				['<space>'] = { 'toggle_node', nowait = false },
				['<2-LeftMouse>'] = 'open',
				['<cr>'] = 'open',
				['<esc>'] = 'cancel', -- close preview or floating neo-tree window
				['P'] = { 'toggle_preview', config = { use_float = true } },
				['l'] = 'open',
				['h'] = 'close_node',
				['s'] = 'open_split',
				['v'] = 'open_vsplit',
				['t'] = 'open_tabnew',
				['w'] = 'open_with_window_picker',
				['z'] = 'close_all_nodes',
				['Z'] = 'expand_all_nodes',
				['a'] = { 'add', config = { show_path = 'relative' } },
				['A'] = { 'add_directory', config = { show_path = 'relative' } }, -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
				['d'] = 'delete',
				['r'] = { 'rename', config = { show_path = 'relative' } },
				['y'] = 'copy_to_clipboard',
				['x'] = 'cut_to_clipboard',
				['p'] = 'paste_from_clipboard',
				['c'] = { 'copy', config = { show_path = 'relative' } },
				['m'] = { 'move', config = { show_path = 'relative' } }, -- takes text input for destination, also accepts the optional config.show_path option like "add".
				['q'] = 'close_window',
				['R'] = 'refresh',
				['?'] = 'show_help',
				['<'] = 'prev_source',
				['>'] = 'next_source',
			},
		},
		nesting_rules = {},
		filesystem = {
			filtered_items = {
				visible = false, -- when true, they will just be displayed differently than normal items
				hide_dotfiles = true,
				hide_gitignored = true,
				hide_hidden = true, -- only works on Windows for hidden files/directories
				hide_by_name = {
					--"node_modules"
				},
				hide_by_pattern = { -- uses glob style patterns
					--"*.meta",
					--"*/src/*/tsconfig.json",
				},
				always_show = { -- remains visible even if other settings would normally hide it
					--".gitignored",
				},
				never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
					--".DS_Store",
					--"thumbs.db"
				},
				never_show_by_pattern = { -- uses glob style patterns
					--".null-ls_*",
				},
			},
			follow_current_file = {
				enabled = false, -- This will find and focus the file in the active buffer every time
				--               -- the current file is changed while the tree is open.
				leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
			},
			group_empty_dirs = true, -- when true, empty folders will be grouped together
			hijack_netrw_behavior = 'open_current', -- netrw disabled, opening a directory opens neo-tree
			-- in whatever position is specified in window.position
			-- "open_current",  -- netrw disabled, opening a directory opens within the
			-- window like netrw would, regardless of window.position
			-- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
			use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
			-- instead of relying on nvim autocmd events.
			window = {
				mappings = {
					['<bs>'] = 'navigate_up',
					['.'] = 'set_root',
					['H'] = 'toggle_hidden',
					['/'] = 'fuzzy_finder',
					['D'] = 'fuzzy_finder_directory',
					['#'] = 'fuzzy_sorter', -- fuzzy sorting using the fzy algorithm
					-- ["D"] = "fuzzy_sorter_directory",
					['f'] = 'filter_on_submit',
					['<c-x>'] = 'clear_filter',
					['[g'] = 'prev_git_modified',
					[']g'] = 'next_git_modified',
				},
				fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
					['<down>'] = 'move_cursor_down',
					['<C-n>'] = 'move_cursor_down',
					['<up>'] = 'move_cursor_up',
					['<C-p>'] = 'move_cursor_up',
				},
			},

			commands = {}, -- Add a custom command or override a global one using the same function name
		},
		buffers = {
			follow_current_file = {
				enabled = true, -- This will find and focus the file in the active buffer every time
				--              -- the current file is changed while the tree is open.
				leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
			},
			group_empty_dirs = true, -- when true, empty folders will be grouped together
			show_unloaded = true,
			window = {
				mappings = {
					['bd'] = 'buffer_delete',
					['<bs>'] = 'navigate_up',
					['C'] = 'set_root',
				},
			},
		},
		git_status = {
			window = {
				position = 'float',
				mappings = {
					['A'] = 'git_add_all',
					['gu'] = 'git_unstage_file',
					['ga'] = 'git_add_file',
					['gr'] = 'git_revert_file',
					['gc'] = 'git_commit',
					['gp'] = 'git_push',
					['gg'] = 'git_commit_and_push',
				},
			},
		},
		event_handlers = {
			{
				event = 'neo_tree_window_after_open',
				handler = function(args)
					if args.position == 'left' or args.position == 'right' then
						vim.cmd('wincmd =')
					end
				end,
			},
			{
				event = 'neo_tree_window_after_close',
				handler = function(args)
					if args.position == 'left' or args.position == 'right' then
						vim.cmd('wincmd =')
					end
				end,
			},
		},
	})
end
