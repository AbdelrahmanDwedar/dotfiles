return function()
	local lspconfig = require('lspconfig')
	require('config.lsp.mason')

	lspconfig.clangd.setup({})
	lspconfig.elixirls.setup({})
	lspconfig.lua_ls.setup({ diagnostics = { globals = { 'vim' } } })
	lspconfig.pyright.setup({})
	lspconfig.astro.setup({})
	lspconfig.intelephense.setup({})

	require('config.lsp.mason')
	require('config.lsp.handlers').setup()
	require('config.lsp.go')
	require('config.lsp.rust')
	require('config.lsp.elixir')
end
