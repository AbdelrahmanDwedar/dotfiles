return function()
	local lspconfig = require('lspconfig')

	lspconfig.bashls.setup({})
	lspconfig.clangd.setup({})
	lspconfig.gopls.setup({})
	lspconfig.grammarly.setup({})
	lspconfig.jsonls.setup({})
	lspconfig.lua_ls.setup({ diagnostics = { globals = { 'vim' } } })
	lspconfig.phpactor.setup({})
	lspconfig.pyright.setup({})
	lspconfig.ruby_ls.setup({})
	lspconfig.rust_analyzer.setup({})
	lspconfig.elixirls.setup({})

	require('config.lsp.mason')
	require('config.lsp.handlers').setup()
end
