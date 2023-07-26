local null_ls = require('null-ls')

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		diagnostics.commitlint,
		diagnostics.eslint,
		diagnostics.markdownlint,
		diagnostics.mypy,
		formatting.beautysh,
		formatting.black,
		formatting.clang_format,
		formatting.goimports,
		formatting.jq,
		formatting.markdownlint,
		formatting.pint,
		formatting.phpcsfixer,
		formatting.prettier,
		formatting.rubyfmt,
		formatting.stylua,
	},
})
