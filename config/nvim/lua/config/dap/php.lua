local dap = require('dap')

dap.adapters.php = {
	type = 'executable',
  command = '~/.local/share/nvim/mason/bin/php-debug-adapter',
	args = {},
}

dap.configurations.php = {
	{
		type = 'php',
		request = 'launch',
		name = 'Listen for Xdebug',
		port = 9000,
	},
}
