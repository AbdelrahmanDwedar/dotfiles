return function()
	require('lint').linters_by_ft = {
		markdown = { 'markdownlint' },
		yaml = { 'actionlint' },
		python = { 'mypy', 'pylint' },
		-- ruby = { 'ruby' },
		php = { 'phpstan' },
	}

	require("config.lint.mason")
end
