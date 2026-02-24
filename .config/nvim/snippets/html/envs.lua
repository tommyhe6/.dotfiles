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
        { trig = "lr<", snippetType = "autosnippet" },
        fmta("\\left\\langle <> \\right\\rangle", {
            i(1),
        })
    ),
    s(
        { trig = "lrf", snippetType = "autosnippet" },
        fmta("\\left\\lfoor <> \\right\\rfloor", {
            i(1),
        })
    ),
    s(
        { trig = "lrc", snippetType = "autosnippet" },
        fmta("\\left\\lceil <> \\right\\rceil", {
            i(1),
        })
    ),
    s(
        { trig = "lrn", snippetType = "autosnippet" },
        fmta("\\left\\lVert <> \\right\\rVert", {
            i(1),
        })
    ),
    s(
        { trig = "lr|", snippetType = "autosnippet" },
        fmta("\\left\\lvert <> \\right\\rvert", {
            i(1),
        })
    ),
    s(
        { trig = "lr(", snippetType = "autosnippet" },
        fmta("\\left( <> \\right)", {
            i(1),
        })
    ),
    s(
        { trig = "lr[", snippetType = "autosnippet" },
        fmta("\\left\\[ <> \\right\\]", {
            i(1),
        })
    ),
    s(
        { trig = "lr{", snippetType = "autosnippet" },
        fmta("\\left\\{ <> \\right\\}", {
            i(1),
        })
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
