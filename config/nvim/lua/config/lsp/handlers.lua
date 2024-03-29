local M = {}

M.capabilities = require('cmp_nvim_lsp').default_capabilities()

M.setup = function()
	local signs = {
		{ name = 'DiagnosticSignError', text = '' },
		{ name = 'DiagnosticSignWarn', text = '' },
		{ name = 'DiagnosticSignHint', text = '' },
		{ name = 'DiagnosticSignInfo', text = '' },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
	end

	local config = {
		on_attach = M.on_attach,
		virtual_text = true,
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		inlay_hints = true,
		float = {
			focusable = true,
			style = 'minimal',
			border = 'rounded',
			source = 'always',
			header = '',
			prefix = '',
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = 'rounded',
	})
	vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = 'rounded',
	})
end

M.on_attach = function(client, bufnr)
	local status_ok, illuminate = pcall(require, 'illuminate')
	if not status_ok then
		return
	end

	illuminate.on_attach(client)

	if client.server_capabilities.inlayHintProvider then
		vim.lsp.inlay_hint(bufnr, true)
	end
end

return M
