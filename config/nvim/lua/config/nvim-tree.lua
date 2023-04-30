local keymap = vim.keymap.set

local function on_attach(bufnr)
	local nvimTreeApi = require('nvim-tree.api')

	local function nvimTreeOps(desc)
		return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- local function nodeClose() 
	-- 	if vim.
	-- end

	-- defaults
	keymap('n', '<C-]>', nvimTreeApi.tree.change_root_to_node,          nvimTreeOps('CD'))
	keymap('n', '<C-e>', nvimTreeApi.node.open.replace_tree_buffer,     nvimTreeOps('Open: In Place'))
	keymap('n', '<C-k>', nvimTreeApi.node.show_info_popup,              nvimTreeOps('Info'))
	keymap('n', '<C-r>', nvimTreeApi.fs.rename_sub,                     nvimTreeOps('Rename: Omit Filename'))
	keymap('n', '<C-t>', nvimTreeApi.node.open.tab,                     nvimTreeOps('Open: New Tab'))
	keymap('n', '<C-v>', nvimTreeApi.node.open.vertical,                nvimTreeOps('Open: Vertical Split'))
	keymap('n', '<C-x>', nvimTreeApi.node.open.horizontal,              nvimTreeOps('Open: Horizontal Split'))
	keymap('n', '<BS>',  nvimTreeApi.node.navigate.parent_close,        nvimTreeOps('Close Directory'))
	keymap('n', '<CR>',  nvimTreeApi.node.open.edit,                    nvimTreeOps('Open'))
	keymap('n', '<Tab>', nvimTreeApi.node.open.preview,                 nvimTreeOps('Open Preview'))
	keymap('n', '>',     nvimTreeApi.node.navigate.sibling.next,        nvimTreeOps('Next Sibling'))
	keymap('n', '<',     nvimTreeApi.node.navigate.sibling.prev,        nvimTreeOps('Previous Sibling'))
	keymap('n', '.',     nvimTreeApi.node.run.cmd,                      nvimTreeOps('Run Command'))
	keymap('n', '-',     nvimTreeApi.tree.change_root_to_parent,        nvimTreeOps('Up'))
	keymap('n', 'a',     nvimTreeApi.fs.create,                         nvimTreeOps('Create'))
	keymap('n', 'bmv',   nvimTreeApi.marks.bulk.move,                   nvimTreeOps('Move Bookmarked'))
	keymap('n', 'B',     nvimTreeApi.tree.toggle_no_buffer_filter,      nvimTreeOps('Toggle No Buffer'))
	keymap('n', 'c',     nvimTreeApi.fs.copy.node,                      nvimTreeOps('Copy'))
	keymap('n', 'C',     nvimTreeApi.tree.toggle_git_clean_filter,      nvimTreeOps('Toggle Git Clean'))
	keymap('n', '[c',    nvimTreeApi.node.navigate.git.prev,            nvimTreeOps('Prev Git'))
	keymap('n', ']c',    nvimTreeApi.node.navigate.git.next,            nvimTreeOps('Next Git'))
	keymap('n', 'd',     nvimTreeApi.fs.remove,                         nvimTreeOps('Delete'))
	keymap('n', 'D',     nvimTreeApi.fs.trash,                          nvimTreeOps('Trash'))
	keymap('n', 'E',     nvimTreeApi.tree.expand_all,                   nvimTreeOps('Expand All'))
	keymap('n', 'e',     nvimTreeApi.fs.rename_basename,                nvimTreeOps('Rename: Basename'))
	keymap('n', ']e',    nvimTreeApi.node.navigate.diagnostics.next,    nvimTreeOps('Next Diagnostic'))
	keymap('n', '[e',    nvimTreeApi.node.navigate.diagnostics.prev,    nvimTreeOps('Prev Diagnostic'))
	keymap('n', 'F',     nvimTreeApi.live_filter.clear,                 nvimTreeOps('Clean Filter'))
	keymap('n', 'f',     nvimTreeApi.live_filter.start,                 nvimTreeOps('Filter'))
	keymap('n', 'g?',    nvimTreeApi.tree.toggle_help,                  nvimTreeOps('Help'))
	keymap('n', 'gy',    nvimTreeApi.fs.copy.absolute_path,             nvimTreeOps('Copy Absolute Path'))
	keymap('n', 'H',     nvimTreeApi.tree.toggle_hidden_filter,         nvimTreeOps('Toggle Dotfiles'))
	keymap('n', 'I',     nvimTreeApi.tree.toggle_gitignore_filter,      nvimTreeOps('Toggle Git Ignore'))
	keymap('n', 'J',     nvimTreeApi.node.navigate.sibling.last,        nvimTreeOps('Last Sibling'))
	keymap('n', 'K',     nvimTreeApi.node.navigate.sibling.first,       nvimTreeOps('First Sibling'))
	keymap('n', 'm',     nvimTreeApi.marks.toggle,                      nvimTreeOps('Toggle Bookmark'))
	keymap('n', 'o',     nvimTreeApi.node.open.edit,                    nvimTreeOps('Open'))
	keymap('n', 'O',     nvimTreeApi.node.open.no_window_picker,        nvimTreeOps('Open: No Window Picker'))
	keymap('n', 'p',     nvimTreeApi.fs.paste,                          nvimTreeOps('Paste'))
	keymap('n', 'P',     nvimTreeApi.node.navigate.parent,              nvimTreeOps('Parent Directory'))
	keymap('n', 'q',     nvimTreeApi.tree.close,                        nvimTreeOps('Close'))
	keymap('n', 'r',     nvimTreeApi.fs.rename,                         nvimTreeOps('Rename'))
	keymap('n', 'R',     nvimTreeApi.tree.reload,                       nvimTreeOps('Refresh'))
	keymap('n', 's',     nvimTreeApi.node.run.system,                   nvimTreeOps('Run System'))
	keymap('n', 'S',     nvimTreeApi.tree.search_node,                  nvimTreeOps('Search'))
	keymap('n', 'U',     nvimTreeApi.tree.toggle_custom_filter,         nvimTreeOps('Toggle Hidden'))
	keymap('n', 'W',     nvimTreeApi.tree.collapse_all,                 nvimTreeOps('Collapse'))
	keymap('n', 'x',     nvimTreeApi.fs.cut,                            nvimTreeOps('Cut'))
	keymap('n', 'y',     nvimTreeApi.fs.copy.filename,                  nvimTreeOps('Copy Name'))
	keymap('n', 'Y',     nvimTreeApi.fs.copy.relative_path,             nvimTreeOps('Copy Relative Path'))
	keymap('n', '<2-LeftMouse>',  nvimTreeApi.node.open.edit,           nvimTreeOps('Open'))
	keymap('n', '<2-RightMouse>', nvimTreeApi.tree.change_root_to_node, nvimTreeOps('CD'))

	-- nvim-tree keymaps
	keymap('n', 'u', nvimTreeApi.tree.change_root_to_parent, nvimTreeOps('up a dir'))
	keymap('n', 't', nvimTreeApi.node.open.tab, nvimTreeOps('open in a new tab'))
	keymap('n', 's', nvimTreeApi.node.open.horizontal, nvimTreeOps('open in a new horizontal split'))
	keymap('n', 'v', nvimTreeApi.node.open.vertical, nvimTreeOps('open in a new vertical split'))
	keymap('n', 'C', nvimTreeApi.tree.change_root_to_node, nvimTreeOps('cd'))
	keymap('n', 'l', nvimTreeApi.node.open.edit, nvimTreeOps('open'))
	keymap('n', 'h', nvimTreeApi.node.navigate.parent_close, nvimTreeOps('close'))
end

-- open nvim tree by default
function open_nvim_tree(data)
	if vim.fn.isdirectory(data.file) == 1 and data.file == '' and vim.bo[data.buf].buftype == '' then
		vim.cmd.cd(data.file)
		require('nvim-tree.api').tree.open()
	else
		return
	end
end

require('nvim-tree').setup({
	on_attach = on_attach,
	sort_by = 'case_sensitive',
	hijack_cursor = true,
	view = {
		adaptive_size = true,
		centralize_selection = false,
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
