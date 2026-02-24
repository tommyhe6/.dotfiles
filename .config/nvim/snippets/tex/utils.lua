local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
	s(
		{ trig = "//", snippetType = "autosnippet" },
		fmta("\\frac{<>}{<>}", {
			i(1),
			i(2),
		})
	),
	s(
		{ trig = "sq" },
		fmta("\\sqrt{<>}", {
			i(1),
		})
	),
	s(
		{ trig = "sum" },
		fmta("\\sum_{<>}^{<>} {<>}", {
			i(1, "i = 0"),
			i(2, "\\infty"),
			i(3, "a_ix_i^i"),
		})
	),
	s(
		{ trig = "prod" },
		fmta("\\prod_{<>}^{<>} {<>}", {
			i(1, "i = 0"),
			i(2, "\\infty"),
			i(3, "a_i"),
		})
	),
	s(
		{ trig = "km", snippetType = "autosnippet" },
		fmta("\\( <> \\)", {
			i(1),
		})
	),
	s(
		{ trig = "dm", snippetType = "autosnippet" },
		fmta("\\[ <> \\]", {
			i(1),
		})
	),
	s({ trig = "=>" }, t("\\implies")),
	s({ trig = "<=" }, t("\\impliedby")),
	s(
		{ trig = "hat" },
		fmta("\\widehat{<>}", {
			i(1),
		})
	),
	s(
		{ trig = "bar" },
		fmta("\\overline{<>}", {
			i(1),
		})
	),
	s(
		{ trig = "tilde" },
		fmta("\\widetilde{<>}", {
			i(1),
		})
	),
	s(
		{ trig = "^^", snippetType = "autosnippet", wordTrig = false },
		fmta("^{<>}", {
			i(1),
		})
	),
	s(
		{ trig = "__", snippetType = "autosnippet", wordTrig = false },
		fmta("_{<>}", {
			i(1),
		})
	),
	s(
		{ trig = "lim" },
		fmta("\\lim_{<> \\to <>} {<>}", {
			i(1, "n"),
			i(2, "\\infty"),
			i(3, "a_n"),
		})
	),
	s(
		{ trig = "linf" },
		fmta("\\liminf_{<> \\to <>} {<>}", {
			i(1, "n"),
			i(2, "\\infty"),
			i(3, "a_n"),
		})
	),
	s(
		{ trig = "lsup" },
		fmta("\\limsup{<> \\to <>} {<>}", {
			i(1, "n"),
			i(2, "\\infty"),
			i(3, "a_n"),
		})
	),
	s(
		{ trig = "graphics" },
		fmta("\\includegraphics[scale=0.5]{<>}", {
			i(1, "/imgs/"),
		})
	),
}
