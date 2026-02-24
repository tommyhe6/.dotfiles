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
		{ trig = "(.)bb", regTrig = true, wordTrig = true, snippetType = "autosnippet" },
		fmta("\\mathbb{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
		})
	),
	s(
		{ trig = "(.)cc", regTrig = true, wordTrig = true, snippetType = "autosnippet" },
		fmta("\\mathcal{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
		})
	),
	s(
		{ trig = "(.)bf", regTrig = true, wordTrig = true, snippetType = "autosnippet" },
		fmta("\\mathbf{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
		})
	),
	s(
		{ trig = "(.)rm", regTrig = true, wordTrig = true, snippetType = "autosnippet" },
		fmta("\\mathrm{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
		})
	),
	s(
		{ trig = "(.)sf", regTrig = true, wordTrig = true, snippetType = "autosnippet" },
		fmta("\\mathsf{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
		})
	),
	s(
		{ trig = "(.)fk", regTrig = true, wordTrig = true, snippetType = "autosnippet" },
		fmta("\\mathfrak{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
		})
	),
	s(
		{ trig = "(.)bbm", regTrig = true, wordTrig = true, snippetType = "autosnippet" },
		fmta("\\mathbbm{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
		})
	),
	s({ trig = ";a", snippetType = "autosnippet" }, {
		t("\\alpha"),
	} ),
	s({ trig = ";b", snippetType = "autosnippet" }, {
		t("\\beta"),
	} ),
	s({ trig = ";g", snippetType = "autosnippet" }, {
		t("\\gamma"),
	} ),
	s({ trig = ";G", snippetType = "autosnippet" }, {
		t("\\Gamma"),
	} ),
	s({ trig = ";d", snippetType = "autosnippet" }, {
		t("\\delta"),
	} ),
	s({ trig = ";D", snippetType = "autosnippet" }, {
		t("\\Delta"),
	} ),
	s({ trig = ";e", snippetType = "autosnippet" }, {
		t("\\varepsilon"),
	} ),
	s({ trig = ";z", snippetType = "autosnippet" }, {
		t("\\zeta"),
	} ),
	s({ trig = ";y", snippetType = "autosnippet" }, {
		t("\\eta"),
	} ),
	s({ trig = ";t", snippetType = "autosnippet" }, {
		t("\\theta"),
	} ),
	s({ trig = ";T", snippetType = "autosnippet" }, {
		t("\\Theta"),
	} ),
	s({ trig = ";i", snippetType = "autosnippet" }, {
		t("\\iota"),
	} ),
	s({ trig = ";k", snippetType = "autosnippet" }, {
		t("\\kappa"),
	} ),
	s({ trig = ";l", snippetType = "autosnippet" }, {
		t("\\lambda"),
	} ),
	s({ trig = ";L", snippetType = "autosnippet" }, {
		t("\\Lambda"),
	} ),
	s({ trig = ";m", snippetType = "autosnippet" }, {
		t("\\mu"),
	} ),
	s({ trig = ";n", snippetType = "autosnippet" }, {
		t("\\nu"),
	} ),
	s({ trig = ";x", snippetType = "autosnippet" }, {
		t("\\xi"),
	} ),
	s({ trig = ";X", snippetType = "autosnippet" }, {
		t("\\Xi"),
	} ),
	s({ trig = ";p", snippetType = "autosnippet" }, {
		t("\\pi"),
	} ),
	s({ trig = ";P", snippetType = "autosnippet" }, {
		t("\\Pi"),
	} ),
	s({ trig = ";r", snippetType = "autosnippet" }, {
		t("\\rho"),
	} ),
	s({ trig = ";s", snippetType = "autosnippet" }, {
		t("\\sigma"),
	} ),
	s({ trig = ";S", snippetType = "autosnippet" }, {
		t("\\Sigma"),
	} ),
	s({ trig = ";t", snippetType = "autosnippet" }, {
		t("\\tau"),
	} ),
	s({ trig = ";f", snippetType = "autosnippet" }, {
		t("\\phi"),
	} ),
	s({ trig = ";vf", snippetType = "autosnippet" }, {
		t("\\varphi"),
	} ),
	s({ trig = ";F", snippetType = "autosnippet" }, {
		t("\\Phi"),
	} ),
	s({ trig = ";c", snippetType = "autosnippet" }, {
		t("\\chi"),
	} ),
	s({ trig = ";u", snippetType = "autosnippet" }, {
		t("\\psi"),
	} ),
	s({ trig = ";U", snippetType = "autosnippet" }, {
		t("\\Psi"),
	} ),
	s({ trig = ";o", snippetType = "autosnippet" }, {
		t("\\omega"),
	} ),
	s({ trig = ";O", snippetType = "autosnippet" }, {
		t("\\Omega"),
	} ),
}
