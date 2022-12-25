require('presence'):setup({
	auto_update = true,
	neovim_image_text = "NeoVim",
	main_image = "neovim",
	client_id = "793271441293967371", -- Use your own Discord application client id (not recommended)
	log_level = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
	debounce_timeout = 10,
	enable_line_number = false,
	blacklist = {},
	buttons = false,

	-- Rich Presence text options
	editing_text = "Editing %s",
	file_explorer_text = "Browsing %s",
	git_commit_text = "Committing changes",
	plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
	reading_text = "Reading %s",
	workspace_text = "Project: %s",
})
