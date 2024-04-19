return function()
	require('neotest').setup({
		adapters = {
			require('neotest-vitest')({}),
			require('neotest-python')({
				dap = { justMyCode = false },
				args = { '--log-level', 'DEBUG' },
				runner = 'pytest',
				python = '.venv/bin/python',
				pytest_discover_instances = true,
			}),
			require('neotest-go')({
				experimental = {
					test_table = true,
				},
			}),
			require('neotest-pest')({
				ignore_dirs = { 'vendor', 'node_modules' },
				root_ignore_files = { 'phpunit-only.tests' },
				test_file_suffixes = { 'Test.php', '_test.php', 'PestTest.php' },
				sail_enabled = true,
				sail_executable = 'vendor/bin/sail',
				sail_project_path = '/var/www/html',
				pest_cmd = 'vendor/bin/pest',
				parallel = 16,
				compact = false,
			}),
		},
	})
end
