local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node

ls.add_snippets('php', {
	s('relation', {
		t('public function '),
		i(1, 'relationshipName'), -- Function name placeholder
		t('(): '),
		i(2, 'RelationType'), -- Relation type placeholder
		t(' {'),
		t({ '', '    return $this->' }), -- Newline and indentation
		i(3, 'relationMethod'), -- Relation method placeholder (e.g., hasOne, belongsTo)
		t('('),
		i(4, 'RelatedModel'), -- Related model class placeholder
		t('::class);'),
		t({ '', '}' }), -- Closing brace with newline
	}),
})

local validation_rule_choice = function(pos)
    return c(pos, {
        t("'accepted'"),
        t("'active_url'"),
        t("'after:date'"),
        t("'after_or_equal:date'"),
        t("'alpha'"),
        t("'alpha_dash'"),
        t("'alpha_num'"),
        t("'array'"),
        t("'bail'"),
        t("'before:date'"),
        t("'before_or_equal:date'"),
        t("'between:min,max'"),
        t("'boolean'"),
        t("'confirmed'"),
        t("'date'"),
        t("'date_equals:date'"),
        t("'date_format:format'"),
        t("'different:field'"),
        t("'digits:value'"),
        t("'digits_between:min,max'"),
        t("'dimensions'"),
        t("'distinct'"),
        t("'email'"),
        t("'ends_with:value'"),
        t("'exists:table,column'"),
        t("'file'"),
        t("'filled'"),
        t("'gt:field'"),
        t("'gte:field'"),
        t("'image'"),
        t("'in:values'"),
        t("'in_array:anotherfield.*'"),
        t("'integer'"),
        t("'ip'"),
        t("'ipv4'"),
        t("'ipv6'"),
        t("'json'"),
        t("'lt:field'"),
        t("'lte:field'"),
        t("'max:value'"),
        t("'mimetypes:value'"),
        t("'mimes:value'"),
        t("'min:value'"),
        t("'not_in:values'"),
        t("'not_regex:pattern'"),
        t("'nullable'"),
        t("'numeric'"),
        t("'password'"),
        t("'present'"),
        t("'regex:pattern'"),
        t("'required'"),
        t("'required_if:anotherfield,value'"),
        t("'required_unless:anotherfield,value'"),
        t("'required_with:fields'"),
        t("'required_with_all:fields'"),
        t("'required_without:fields'"),
        t("'required_without_all:fields'"),
        t("'same:field'"),
        t("'size:value'"),
        t("'starts_with:value'"),
        t("'string'"),
        t("'timezone'"),
        t("'unique:table,column'"),
        t("'url'"),
        t("'uuid'")
    })
end

ls.add_snippets("php", {
    s("validation", {
        t("$validator = Validator::make($request->all(), ["),
        t({"", "    '"}), i(1, "field1"), t("' => ["), validation_rule_choice(2), t(", "), validation_rule_choice(3), t("],"),
        t({"", "    '"}), i(4, "field2"), t("' => ["), validation_rule_choice(5), t(", "), validation_rule_choice(6), t("],"),
        t({"", "    // Add more fields here", "])->validated();", ""}),
    }),
})

local http_method_choice = c(1, {
    t("get"),
    t("post"),
    t("put"),
    t("patch"),
    t("delete"),
})

ls.add_snippets('php', {
    s("route", {
        t("Route::"), i(1, "method"), t("('/"), i(2, "route_path"), t("', ["), i(3, "controller"), t("::class, '"), i(4, "controller_method"), t("']);"),
    }),
})

ls.add_snippets("php",{
    s("route_group", {
        t("Route::group(['prefix' => '"), i(1, "prefix"), t("', 'middleware' => ['"), i(2, "middleware"), t("']], function () {"),
        t("","\tRoute::"), i(3, "http_method"), t("('/"), i(4, "route_path"), t("', ["), i(5, "controller"), t("::class, '"), i(6, "method"), t("']);"),
        t("","\n\t// Add more routes here"),
        t("\n});"),
    }),
})

ls.add_snippets(
	'php',
	{
		s('$attribute',{
			t('$'),
			i('guarded'),
			t(' = ['),
			t('\n//', '\n];')
		})
	}
)
