local lsp = require('lspconfig')

lsp.lua_ls.setup({ diagnostics = { globals = { 'vim' } } })
