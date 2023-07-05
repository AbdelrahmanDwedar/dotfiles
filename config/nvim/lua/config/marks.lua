require('marks').setup({
	default_mappings = true,
	-- builtin_marks = { '.', '<', '>', '^', "'" },
	builtin_marks = {},
	cyclic = true, -- whether movements cycle back to the beginning/end of buffer. default true
	force_write_shada = false, -- whether the shada file is updated after modifying uppercase marks. default false
	refresh_interval = 250,
	sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
	excluded_filetypes = {}, -- disables mark tracking for specific filetypes. default {}
	mappings = {},

	-- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
	-- sign/virttext. Bookmarks can be used to group together positions and quickly move
	-- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
	-- default virt_text is "".
})
