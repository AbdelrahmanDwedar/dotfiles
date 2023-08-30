local cmp = require('cmp')

local snip_status_ok, luasnip = pcall(require, 'luasnip')
if not snip_status_ok then
	return
end

require('luasnip/loaders/from_vscode').lazy_load()

local check_backspace = function()
	local col = vim.fn.col('.') - 1
	return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

-- 󰃐 󰆩 󰙅 󰛡  󰅲 some other good icons
local kind_icons = {
	Text = '󰉿',
	Method = 'm',
	Function = '󰊕',
	Constructor = '',
	Field = '',
	Variable = '󰆧',
	Class = '󰌗',
	Interface = '',
	Module = '',
	Property = '',
	Unit = '',
	Value = '󰎠',
	Enum = '',
	Keyword = '󰌋',
	Snippet = '',
	Color = '󰏘',
	File = '󰈙',
	Reference = '',
	Folder = '󰉋',
	EnumMember = '',
	Constant = '󰇽',
	Struct = '',
	Event = '',
	Operator = '󰆕',
	TypeParameter = '󰊄',
}

cmp.setup({
	enabled = function()
		return vim.api.nvim_buf_get_option(0, 'buftype') ~= 'prompt' or require('cmp_dap').is_dap_buffer()
	end,

	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		fields = { 'kind', 'abbr', 'menu' },
		format = function(entry, vim_item)
			vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
			vim_item.menu = ({
				nvim_lsp = '[LSP]',
				luasnip = '[Snippet]',
				buffer = '[File]',
				path = '[Path]',
			})[entry.source.name]
			return vim_item
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<C-j>'] = cmp.mapping.select_next_item(),
		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, {
			'i',
			's',
		}),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			'i',
			's',
		}),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
		{ name = 'buffer' },
		{ name = 'path' },
		{ name = 'luasnip', option = { sow_autosnippets = true, use_show_condition = true } },
	}),
	experimental = {
		ghost_text = true,
	},
})

require('config.cmp.git')
require('config.cmp.lsp')
require('config.cmp.cmdline')
require('config.cmp.dap')
