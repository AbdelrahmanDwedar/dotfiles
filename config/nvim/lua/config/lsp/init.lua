local lspconfig = require('lspconfig')
lspconfig.pyright.setup({})
lspconfig.tsserver.setup({})
lspconfig.gopls.setup({})
lspconfig.svelte.setup({})
lspconfig.emmet_ls.setup({})
lspconfig.ruby_ls.setup({})
lspconfig.lua_ls.setup({
	diagnostics = {
		globals = { 'vim' },
	},
})
lspconfig.rust_analyzer.setup({})

require('config.lsp.mason')
require('config.lsp.null-ls')
require('config.lsp.handlers').setup()
