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

local math = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
local text = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 0
end

return {
	s(
		{ trig = "(.)bb", regTrig = true, wordTrig = true, snippetType = "autosnippet" },
		fmta("\\mathbb{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
		}),
        { condition = math }
	),
	s(
		{ trig = "(.)cc", regTrig = true, wordTrig = true, snippetType = "autosnippet" },
		fmta("\\mathcal{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
		}),
        { condition = math }
	),
	s(
		{ trig = "(.)bf", regTrig = true, wordTrig = true, snippetType = "autosnippet" },
		fmta("\\mathbf{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
		}),
        { condition = math }
	),
	s(
		{ trig = "(.)rm", regTrig = true, wordTrig = true, snippetType = "autosnippet" },
		fmta("\\mathrm{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
		}),
        { condition = math }
	),
	s(
		{ trig = "(.)sf", regTrig = true, wordTrig = true, snippetType = "autosnippet" },
		fmta("\\mathsf{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
		}),
        { condition = math }
	),
	s(
		{ trig = "(.)bbm", regTrig = true, wordTrig = true, snippetType = "autosnippet" },
		fmta("\\mathbbm{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
		}),
        { condition = math }
	),
	s({ trig = ";a", snippetType = "autosnippet" }, {
		t("\\alpha"),
	}, { condition = math }),
	s({ trig = ";b", snippetType = "autosnippet" }, {
		t("\\beta"),
	}, { condition = math }),
	s({ trig = ";g", snippetType = "autosnippet" }, {
		t("\\gamma"),
	}, { condition = math }),
	s({ trig = ";G", snippetType = "autosnippet" }, {
		t("\\Gamma"),
	}, { condition = math }),
	s({ trig = ";d", snippetType = "autosnippet" }, {
		t("\\delta"),
	}, { condition = math }),
	s({ trig = ";D", snippetType = "autosnippet" }, {
		t("\\Delta"),
	}, { condition = math }),
	s({ trig = ";e", snippetType = "autosnippet" }, {
		t("\\varepsilon"),
	}, { condition = math }),
	s({ trig = ";z", snippetType = "autosnippet" }, {
		t("\\zeta"),
	}, { condition = math }),
	s({ trig = ";e", snippetType = "autosnippet" }, {
		t("\\eta"),
	}, { condition = math }),
	s({ trig = ";t", snippetType = "autosnippet" }, {
		t("\\theta"),
	}, { condition = math }),
	s({ trig = ";T", snippetType = "autosnippet" }, {
		t("\\Theta"),
	}, { condition = math }),
	s({ trig = ";i", snippetType = "autosnippet" }, {
		t("\\iota"),
	}, { condition = math }),
	s({ trig = ";k", snippetType = "autosnippet" }, {
		t("\\kappa"),
	}, { condition = math }),
	s({ trig = ";l", snippetType = "autosnippet" }, {
		t("\\lambda"),
	}, { condition = math }),
	s({ trig = ";L", snippetType = "autosnippet" }, {
		t("\\Lambda"),
	}, { condition = math }),
	s({ trig = ";m", snippetType = "autosnippet" }, {
		t("\\mu"),
	}, { condition = math }),
	s({ trig = ";n", snippetType = "autosnippet" }, {
		t("\\nu"),
	}, { condition = math }),
	s({ trig = ";x", snippetType = "autosnippet" }, {
		t("\\xi"),
	}, { condition = math }),
	s({ trig = ";X", snippetType = "autosnippet" }, {
		t("\\Xi"),
	}, { condition = math }),
	s({ trig = ";p", snippetType = "autosnippet" }, {
		t("\\pi"),
	}, { condition = math }),
	s({ trig = ";P", snippetType = "autosnippet" }, {
		t("\\Pi"),
	}, { condition = math }),
	s({ trig = ";r", snippetType = "autosnippet" }, {
		t("\\rho"),
	}, { condition = math }),
	s({ trig = ";s", snippetType = "autosnippet" }, {
		t("\\sigma"),
	}, { condition = math }),
	s({ trig = ";S", snippetType = "autosnippet" }, {
		t("\\Sigma"),
	}, { condition = math }),
	s({ trig = ";t", snippetType = "autosnippet" }, {
		t("\\tau"),
	}, { condition = math }),
	s({ trig = ";f", snippetType = "autosnippet" }, {
		t("\\phi"),
	}, { condition = math }),
	s({ trig = ";vf", snippetType = "autosnippet" }, {
		t("\\varphi"),
	}, { condition = math }),
	s({ trig = ";F", snippetType = "autosnippet" }, {
		t("\\Phi"),
	}, { condition = math }),
	s({ trig = ";c", snippetType = "autosnippet" }, {
		t("\\chi"),
	}, { condition = math }),
	s({ trig = ";u", snippetType = "autosnippet" }, {
		t("\\psi"),
	}, { condition = math }),
	s({ trig = ";U", snippetType = "autosnippet" }, {
		t("\\Psi"),
	}, { condition = math }),
	s({ trig = ";o", snippetType = "autosnippet" }, {
		t("\\omega"),
	}, { condition = math }),
	s({ trig = ";O", snippetType = "autosnippet" }, {
		t("\\Ometa"),
	}, { condition = math }),
}
