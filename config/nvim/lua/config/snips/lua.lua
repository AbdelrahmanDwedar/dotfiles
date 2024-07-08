local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('lua', {
	s('describe', {
		t("describe('"),
		i(1, 'test_name'),
		t({ "', function()", '\t' }),
		i(2),
		t({ 'end)' }),
	}),
	s('it', {
		t("it('"),
		i(1, 'do_something'),
		t({ "', function ()", '\t' }),
		i(2),
		t({ '\t', 'end)' }),
	}),
})
