local servers = {
	'bashls',
	'clangd',
	'gopls',
	'grammarly',
	'pyright',
	'elixirls',
}

require('mason').setup({
	ui = {
		border = 'rounded',
		icons = {
			package_installed = '✓',
			package_pending = '➜',
			package_uninstalled = '✗',
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
})
require('mason-lspconfig').setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig = require('lspconfig')

for _, server in pairs(servers) do
	local opts = {
		on_attach = require('config.lsp.handlers').on_attach,
		capabilities = require('config.lsp.handlers').capabilities,
	}

	server = vim.split(server, '@')[1]

	lspconfig[server].setup(opts)
end
