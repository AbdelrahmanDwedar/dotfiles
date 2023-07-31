require("github-theme").setup({
	options = {
		styles = {
			functions = "italic"
		},
		darken = {
			sidebars = {
				list = {
					{ "qf", "vista_kind", "terminal", "packer" }
				}
			}
		}
	},
	specs = {
		all = {
			error = "#ff0000",
			hint = "orange"
		}
	}
})
