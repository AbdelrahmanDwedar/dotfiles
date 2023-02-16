local function open_nvim_tree()

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

require('nvim-tree').setup({
	sort_by = 'case_sensitive',
	hijack_cursor = true,
	view = {
		adaptive_size = true,
		centralize_selection = false,
		mappings = {
			list = {
				{ key = 'u', action = 'dir_up' },
				{ key = 't', action = 'tabnew' },
				{ key = 's', action = 'split' },
				{ key = 'v', action = 'vsplit' },
				{ key = 'C', action = 'cd' },
				{ key = 'l', action = 'open_node' },
				{ key = 'h', action = 'close_node' },
			},
		},
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = false,
		custom = {
			'.git',
		},
	},
})
