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
        { trig = "lr<", snippetType = "autosnippet" },
        fmta("\\left\\langle <> \\right\\rangle", {
            i(1),
        }),
        { condition = math }
    ),
    s(
        { trig = "lrf", snippetType = "autosnippet" },
        fmta("\\left\\lfoor <> \\right\\rfloor", {
            i(1),
        }),
        { condition = math }
    ),
    s(
        { trig = "lrc", snippetType = "autosnippet" },
        fmta("\\left\\lceil <> \\right\\rceil", {
            i(1),
        }),
        { condition = math }
    ),
    s(
        { trig = "lrn", snippetType = "autosnippet" },
        fmta("\\left\\lVert <> \\right\\rVert", {
            i(1),
        }),
        { condition = math }
    ),
    s(
        { trig = "lr|", snippetType = "autosnippet" },
        fmta("\\left\\lvert <> \\right\\rvert", {
            i(1),
        }),
        { condition = math }
    ),
    s(
        { trig = "lr(", snippetType = "autosnippet" },
        fmta("\\left( <> \\right)", {
            i(1),
        }),
        { condition = math }
    ),
    s(
        { trig = "lr[", snippetType = "autosnippet" },
        fmta("\\left\\[ <> \\right\\]", {
            i(1),
        }),
        { condition = math }
    ),
    s(
        { trig = "lr{", snippetType = "autosnippet" },
        fmta("\\left\\{ <> \\right\\}", {
            i(1),
        }),
        { condition = math }
    ),
    s(
        { trig = "txt" },
        fmta("\\text{ <> }", {
            i(1),
        })
    ),
    s(
        { trig = "pmat", snippetType = "autosnippet" },
        fmta(
            [[
            \begin{pmatrix}
                <>
            \end{pmatrix}
            ]],
            {
                i(1),
            }
        )
    ),
    s(
        { trig = "bmat", snippetType = "autosnippet" },
        fmta(
            [[
            \begin{bmatrix}
                <>
            \end{bmatrix}
            ]],
            {
                i(1),
            }
        )
    ),
    s(
        { trig = "ali*" },
        fmta(
            [[
            \begin{align*}
                <>
            \end{align*}
            ]],
            {
                i(1),
            }
        )
    ),
    s(
        { trig = "ali" },
        fmta(
            [[
            \begin{align}
                <>
            \end{align}
            ]],
            {
                i(1),
            }
        )
    ),
    s(
        { trig = "cas" },
        fmta(
            [[
            \begin{cases}
                <>
            \end{cases}
            ]],
            {
                i(1),
            }
        )
    ),
    s(
        { trig = "nota" },
        fmta(
            [[
            \begin{Nota}
                <>
            \end{Nota}
            ]],
            {
                i(1),
            }
        )
    ),
    s(
        { trig = "prop" },
        fmta(
            [[
            \begin{Prop}
                <>
            \end{Prop}
            ]],
            {
                i(1),
            }
        )
    ),
    s(
        { trig = "que" },
        fmta(
            [[
            \begin{Que}
                <>
            \end{Que}
            ]],
            {
                i(1),
            }
        )
    ),
    s(
        { trig = "ex" },
        fmta(
            [[
            \begin{Ex}
                <>
            \end{Ex}
            ]],
            {
                i(1),
            }
        )
    ),
    s(
        { trig = "def" },
        fmta(
            [[
            \begin{Def}
                <>
            \end{Def}
            ]],
            {
                i(1),
            }
        )
    ),
    s(
        { trig = "lem" },
        fmta(
            [[
            \begin{Lem}
                <>
            \end{Lem}
            ]],
            {
                i(1),
            }
        )
    ),
    s(
        { trig = "clm" },
        fmta(
            [[
            \begin{Clm}
                <>
            \end{Clm}
            ]],
            {
                i(1),
            }
        )
    ),
    s(
        { trig = "thm" },
        fmta(
            [[
            \begin{Thm}
                <>
            \end{Thm}
            ]],
            {
                i(1),
            }
        )
    ),
    s(
        { trig = "pf" },
        fmta(
            [[
            \begin{proof}
                <>
            \end{proof}
            ]],
            {
                i(1),
            }
        )
    ),
    s(
        { trig = "rem" },
        fmta(
            [[
            \begin{Rem}
                <>
            \end{Rem}
            ]],
            {
                i(1),
            }
        )
    ),
    s(
        { trig = "cor" },
        fmta(
            [[
            \begin{Cor}
                <>
            \end{Cor}
            ]],
            {
                i(1),
            }
        )
    ),
    s(
        { trig = "conj" },
        fmta(
            [[
            \begin{Conj}
                <>
            \end{Conj}
            ]],
            {
                i(1),
            }
        )
    ),
    s(
        { trig = "algo" },
        fmta(
            [[
            \begin{Algo}
                <>
            \end{Algo}
            ]],
            {
                i(1),
            }
        )
    ),
    s(
        { trig = "beg" },
        fmta(
            [[
            \begin{<>}
                <>
            \end{<>}
            ]],
            {
                i(1),
                i(2),
                rep(1),
            }
        )
    ),
    s(
        { trig = "enum" },
        fmta(
            [[
            \begin{enumerate}
                <>
            \end{enumerate}
            ]],
            {
                i(1),
            }
        )
    ),
    s(
        { trig = "itmz" },
        fmta(
            [[
            \begin{itemize}
                <>
            \end{itemize}
            ]],
            {
                i(1),
            }
        )
    ),
    s({ trig = "it" }, t({ "\\item " })),
    s(
        { trig = "cd" },
        fmta(
            [[
            \begin{tikzcd}
                <>
            \end{tikzcd}
            ]],
            {
                i(1),
            }
        )
    ),
    s(
        { trig = "tikz" },
        fmta(
            [[
            \begin{tikz}
                <>
            \end{tikz}
            ]],
            {
                i(1),
            }
        )
    ),
    s(
        { trig = "frm" },
        fmta(
            [[
            \begin{frame}
                <>
            \end{frame}
            ]],
            {
                i(1),
            }
        )
    ),
}
