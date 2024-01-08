require ('mason-nvim-lint').setup({
    ensure_installed = {
		'eslint_d',
		'pylint',
		'mypy',
		'phpstan',
		'actionlint',
		'markdownlint',
	},
	automatic_installation = true,
})
