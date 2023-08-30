local ls = require('config.luasnip.until')

ls.new('lua', {
	ls.s('describe', {
		ls.t("describe('"),
		ls.i(1, 'test_name'),
		ls.t({ "', function()", '\t' }),
		ls.i(2),
		ls.t({ 'end)' }),
	}),
	ls.s('it', {
		ls.t("it('"),
		ls.i(1, 'do_something'),
		ls.t({ "', function ()", '\t' }),
		ls.i(2),
		ls.t({ '\t', 'end)' }),
	}),
})
