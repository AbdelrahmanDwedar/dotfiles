local lsp = require('lspconfig')

-- GoLang
lsp.gopls.setup({
	cmd = { 'gopls' },
	settings = {
		gopls = {
			experimentalPostfixCompletions = true,
			analyses = {
				unusedparams = true,
				shadow = true,
			},
			staticcheck = true,
			hints = {
				assignVariableTypes = false, -- TODO: set this to true later
				compositeLiteralFields = true,
				compositeLiteralTypes = false,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		},
	},
	init_options = {
		usePlaceholders = true,
	},
})
