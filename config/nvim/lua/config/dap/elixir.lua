local dap = require('dap')

dap.adapters.mix_task = {
	type = 'executable',
  command = '~/.local/share/nvim/mason/bin/elixir-ls-debugger',
	args = {},
}

dap.configurations.elixir = {
	{
		type = 'mix_task',
		name = 'mix test',
		task = 'test',
		taskArgs = { '--trace' },
		request = 'launch',
		startApps = true, -- for Phoenix projects
		projectDir = '${workspaceFolder}',
		requireFiles = {
			'test/**/test_helper.exs',
			'test/**/*_test.exs',
		},
	},
}
