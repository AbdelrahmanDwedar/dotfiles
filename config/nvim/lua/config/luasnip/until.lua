local ls = require("luasnip")

-- some shorthands...
local M = {}

M.new = ls.add_snippets
M.s = ls.snippet
M.sn = ls.snippet_node
M.t = ls.text_node
M.i = ls.insert_node
M.f = ls.function_node
M.c = ls.choice_node
M.d = ls.dynamic_node
M.r = ls.restore_node
M.l = require("luasnip.extras").lambda
M.rep = require("luasnip.extras").rep
M.p = require("luasnip.extras").partial
M.m = require("luasnip.extras").match
M.n = require("luasnip.extras").nonempty
M.dl = require("luasnip.extras").dynamic_lambda
M.fmt = require("luasnip.extras.fmt").fmt
M.fmta = require("luasnip.extras.fmt").fmta
M.types = require("luasnip.util.types")
M.conds = require("luasnip.extras.conditions")
M.conds_expand = require("luasnip.extras.conditions.expand")

return M
