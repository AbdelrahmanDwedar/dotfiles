local keymap = vim.keymap.set

local function on_attach(bufnr)
	local nvimTreeApi = require('nvim-tree.api')

	local function nvimTreeOps(desc)
		return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- local function nodeClose() 
	-- 	if vim.
	-- end

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
