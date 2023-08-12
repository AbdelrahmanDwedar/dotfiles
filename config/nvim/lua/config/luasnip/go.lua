local ls = require('config.luasnip.until')

ls.new('go', {
	ls.s('iferr', {
		ls.t({ 'if err != nil {', '\t' }),
		ls.i(1, 'return'),
		ls.t({ '', '}' }),
	}),
	ls.s('err', {
		ls.t({ 'if err != nil {', '\t' }),
		ls.i(1, 'return'),
		ls.t({ '', '}' }),
	}),
})
