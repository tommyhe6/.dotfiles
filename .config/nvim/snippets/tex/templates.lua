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
        { trig = "assi" },
        fmta(
            [[
            \documentclass[11pt]{article}
            \usepackage{macros}
            \title{<>}
            \author{Tommy He}
            \date{}

            \begin{document}
            \maketitle
            <>
            \end{document}
            ]],
            {
                i(1),
                i(0),
            }
        )
    ),
    s(
        { trig = "paper" },
        fmta(
            [[
            \documentclass[11pt]{article}
            \usepackage{macros_paper}
            \title{<>}
            \author{Tommy He}
            \date{}

            \begin{document}
            \maketitle
            <>
            \end{document}
            ]],
            {
                i(1),
                i(0),
            }
        )
    ),
}
