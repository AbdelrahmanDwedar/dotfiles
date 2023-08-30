require('mason-nvim-dap').setup({
	ensure_installed = { 'python', 'delve' },
	automatic_installation = true,

	handlers = {
		function(config)
			-- all sources with no handler get passed here

			-- Keep original functionality
			require('mason-nvim-dap').default_setup(config)
		end,
		python = function(config)
			config.adapters = {
				type = 'executable',
				command = '/usr/bin/python3',
				args = {
					'-m',
					'debugpy.adapter',
				},
			}
			require('mason-nvim-dap').default_setup(config) -- don't forget this!
		end,
		go = function(config)
			config.adapter = {
				type = 'executable',
				command = 'delve.adapter',
			}
			require('mason-nvim-dap').default_setup(config) -- don't forget this!
		end,
	},
})
