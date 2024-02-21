return function()
	require('colorizer').setup({
		astro = {
			mode = 'background',
			RGB = true,
			RRGGBB = true,
			names = false,
			RRGGBBAA = true,
			rgb_fn = true, -- CSS rgb() and rgba() functions
			hsl_fn = true, -- CSS hsl() and hsla() functions
			css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
		},
		css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in css.
	})
end
