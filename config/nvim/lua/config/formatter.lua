local M = {}

--local util = require('formatter.util')

M.filetypes = {
	lua = {
		require('formatter.filetypes.lua').stylua,
	},

	c = {
		require('formatter.filetypes.c').clangformat,
	},

	cpp = {
		require('formatter.filetypes.cpp').clangformat,
	},

	elixir = {
		require('formatter.filetypes.elixir').mixformat,
	},

	go = {
		require('formatter.filetypes.go').goimports,
	},

	rust = {
		require('formatter.filetypes.rust').rustfmt,
	},

	sql = {
		require('formatter.filetypes.sql').pgformat,
	},

	zig = {
		require('formatter.filetypes.zig').zigfmt,
	},

	python = {
		require('formatter.filetypes.python').black,
	},

	php = {
		require('formatter.util').copyf(function()
			return {
				exe = 'pint',
				stdin = false,
				ignore_exitcode = true,
			}
		end),
	},

	ruby = {
		require('formatter.util').copyf(function()
			return {
				exe = 'rubyfmt',
				stdin = false,
				ignore_exitcode = true,
			}
		end),
	},
	sh = {
		require('formatter.util').copyf(function()
			return {
				exe = 'beautysh',
				stdin = false,
				ignore_exitcode = true,
			}
		end),
	},

	-- Use the special "*" filetype for defining formatter configurations on
	-- any filetype
	['*'] = {
		-- "formatter.filetypes.any" defines default configurations for any
		-- filetype
		require('formatter.filetypes.any').remove_trailing_whitespace,
	},
}

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require('formatter').setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = M.filetypes,
})

return M
