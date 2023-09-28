return function()
	local lspconfig = require('lspconfig')

	lspconfig.bashls.setup({})
	lspconfig.clangd.setup({})
	lspconfig.elixirls.setup({})
	lspconfig.grammarly.setup({})
	lspconfig.jsonls.setup({})
	lspconfig.lua_ls.setup({ diagnostics = { globals = { 'vim' } } })
	lspconfig.phpactor.setup({})
	lspconfig.pyright.setup({})
	lspconfig.ruby_ls.setup({})

	require('config.lsp.mason')
	require('config.lsp.handlers').setup()
	require('config.lsp.go')
	require('config.lsp.rust')
end
