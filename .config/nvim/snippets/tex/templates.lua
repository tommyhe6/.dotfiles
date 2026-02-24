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
    s(
        { trig = "presentation" },
        fmta(
            [[
            \documentclass[mathserif]{beamer}
            \setbeamertemplate{navigation symbols}{}
            \usepackage{macros}
            \usetheme{Boadilla}
            \usepackage{subcaption}

            \usecolortheme{seagull}
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

-- \documentclass[11pt]{article}
--
-- \usepackage{amsmath, amsfonts, amssymb, amsthm}
-- \usepackage{enumitem, mathtools, tikz, bbm, mathrsfs}
-- \usepackage{newtxtext, newtxmath}
-- \usepackage{import, pdfpages, transparent, xcolor, cancel, graphicx}
-- \usepackage{indentfirst}
-- \usepackage{proof}
-- \usepackage{hyperref}
-- \usepackage[margin=1.2in]{geometry}
-- \usepackage[linguistics]{forest}
-- \usepackage[noend]{algpseudocode}
-- \usepackage{algorithm}
-- \usepackage{placeins}
-- \usepackage{gensymb}
-- \usepackage{stackrel}
--
-- \usetikzlibrary{cd}
--
-- \graphicspath{ {./imgs/} }
--
-- %% MACROS %%
-- \newcommand\circled[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=2pt] (char) {#1};}}
-- \newcommand\rst[2]{{% we make the whole thing an ordinary symbol
--   \left.\kern-\nulldelimiterspace % automatically resize the bar with \right
--   #1 % the function
--   \vphantom{\big|} % pretend it's a little taller at normal size
--   \right|_{#2} % this is the delimiter
--   }}
-- \newcommand{\trianglerightneq}{\mathrel{\ooalign{\raisebox{-0.5ex}{\reflectbox{\rotatebox{90}{$\nshortmid$}}}\cr$\triangleright$\cr}\mkern-3mu}}
-- \newcommand{\triangleleftneq}{\mathrel{\reflectbox{$\trianglerightneq$}}}
--
-- \newcommand{\Input}{\hspace*{\algorithmicindent} \textbf{Input:}}
-- \newcommand{\Output}{\hspace*{\algorithmicindent} \textbf{Output:}}
--
-- \DeclareMathOperator{\st}{s.t.}
--
-- %% Anal %%
-- \DeclareMathOperator{\di}{d\!}
-- \DeclareMathOperator{\cl}{cl}
-- \DeclareMathOperator{\epi}{epi}
-- \DeclareMathOperator{\cont}{cont}
-- \DeclareMathOperator{\intt}{int}
--
-- %% Alg %%
-- \DeclareMathOperator{\Ima}{Im}
-- \DeclareMathOperator{\im}{im}
-- \DeclareMathOperator{\Ker}{Ker}
-- \DeclareMathOperator{\Rk}{Rk}
-- \DeclareMathOperator{\rank}{rank}
-- \DeclareMathOperator{\nl}{nullity}
-- \DeclareMathOperator{\Orb}{Orb}
-- \DeclareMathOperator{\Stab}{Stab}
-- \DeclareMathOperator{\Cent}{Cent}
-- \DeclareMathOperator{\GL}{GL}
-- \DeclareMathOperator{\Mat}{Mat}
-- \DeclareMathOperator{\lcm}{lcm}
-- \DeclareMathOperator{\SO}{SO}
-- \DeclareMathOperator{\Tor}{Tor}
-- \DeclareMathOperator{\Id}{Id}
-- \DeclareMathOperator{\id}{id}
-- \DeclareMathOperator{\T}{T}
-- \DeclareMathOperator{\N}{N}
-- \DeclareMathOperator{\disc}{disc}
-- \DeclareMathOperator{\Frac}{Frac}
-- \DeclareMathOperator{\dom}{dom}
-- \DeclareMathOperator{\cod}{cod}
-- \DeclareMathOperator{\tr}{tr}
-- \DeclareMathOperator{\codim}{codim}
-- \DeclareMathOperator{\init}{in}
-- \DeclareMathOperator{\spn}{span}
-- \DeclareMathOperator{\lin}{lin}
--
-- %% Prob %%
-- \DeclareMathOperator{\Var}{Var}
-- \DeclareMathOperator{\MSE}{MSE}
-- \DeclareMathOperator{\bias}{bias}
-- \newcommand{\1}{\mathbbm{1}}
-- \newcommand{\io}{\text{ i.o.}}
-- \newcommand{\as}{\text{a.s.}}
-- \DeclareMathOperator{\Unif}{Unif}
-- \DeclareMathOperator{\Poisson}{Poisson}
-- \DeclareMathOperator{\Beta}{Beta}
-- \DeclareMathOperator{\Gam}{Gamma}
-- \DeclareMathOperator{\Cauchy}{Cauchy}
-- \DeclareMathOperator{\Exp}{Exp}
-- \DeclareMathOperator{\Bernoulli}{Bernoulli}
-- \DeclareMathOperator{\Binomial}{Binomial}
-- \DeclareMathOperator{\Bin}{Bin}
-- \DeclareMathOperator{\KL}{KL}
-- \DeclareMathOperator{\supp}{supp}
--
-- %% Cypto %%
-- \DeclareMathOperator{\Gen}{Gen}
-- \DeclareMathOperator{\Enc}{Enc}
-- \DeclareMathOperator{\Dec}{Dec}
-- \DeclareMathOperator{\PrivK}{PrivK}
-- \DeclareMathOperator{\PubK}{PubK}
-- \DeclareMathOperator{\negl}{negl}
-- \DeclareMathOperator{\Mac}{Mac}
-- \DeclareMathOperator{\Vrfy}{Vrfy}
-- \DeclareMathOperator{\Sign}{Sign}
-- \DeclareMathOperator{\enc}{enc}
--
-- %% ML %%
-- \DeclareMathOperator{\FV}{FV}
-- \DeclareMathOperator{\VCdim}{VCdim}
-- \DeclareMathOperator{\sgn}{sgn}
--
-- %% Verification %%
-- \DeclareMathOperator{\AP}{AP}
-- \DeclareMathOperator{\TS}{TS}
-- \DeclareMathOperator{\Pref}{Pref}
-- \DeclareMathOperator{\Sat}{Sat}
-- \DeclareMathOperator{\clo}{cl}
-- \DeclareMathOperator{\MinBadPref}{MinBadPref}
-- \DeclareMathOperator{\BadPref}{BadPref}
--
-- %% Proof Complexity %%
-- \DeclareMathOperator{\Res}{Res}
--
-- %% Categories %%
-- \DeclareMathOperator{\Mor}{Mor}
-- \DeclareMathOperator{\Ob}{Ob}
--
-- %% Optimization %%
-- \DeclareMathOperator{\lev}{lev}
--
-- %% ML %%
-- \DeclareMathOperator{\FV}{FV}
-- \DeclareMathOperator{\VCdim}{VCdim}
-- \DeclareMathOperator{\sgn}{sgn}
--
-- %% Math Writing %%
-- \newtheorem{Thm}{Theorem}[section]
-- \newtheorem{Prop}[Thm]{Proposition}
-- \newtheorem{Cor}[Thm]{Corollary}
-- \newtheorem{Lem}[Thm]{Lemma}
-- \newtheorem{Clm}[Thm]{Claim}
-- \newtheorem{Que}[Thm]{Question}
-- \newtheorem{Conj}[Thm]{Conjecture}
-- \newtheorem{Algo}[Thm]{Algorithm}
-- \DeclareMathOperator*{\argmax}{arg\,max}
-- \DeclareMathOperator*{\argmin}{arg\,min}
-- \newtheorem*{Thm*}{Theorem}
-- \newtheorem*{Prop*}{Proposition}
-- \newtheorem*{Cor*}{Corollary}
-- \newtheorem*{Lem*}{Lemma}
-- \newtheorem*{Clm*}{Claim}
-- \newtheorem*{Que*}{Question}
-- \newtheorem*{Conj*}{Conjecture}
-- \newtheorem*{Algo*}{Algorithm}
--
-- \theoremstyle{definition}
-- \newtheorem{Def}[Thm]{Definition}
-- \newtheorem{Nota}[Thm]{Notation}
-- \newtheorem{Ex}[Thm]{Example}
-- \newtheorem{Intro}[Thm]{Introduction}
-- \newtheorem{Prob}[Thm]{Problem}
-- \newtheorem*{Def*}{Definition}
-- \newtheorem*{Nota*}{Notation}
-- \newtheorem*{Ex*}{Example}
-- \newtheorem*{Intro*}{Introduction}
-- \newtheorem*{Prob*}{Problem}
--
-- \theoremstyle{remark}
-- \newtheorem{Rem}[Thm]{Remark}
-- \newtheorem*{Rem*}{Remark}
--
-- %% Figures %%
--
-- \newcommand{\incfig}[2][1]{%
--     \def\svgwidth{#1\columnwidth}
--     \import{./figures/}{#2.pdf_tex}
-- }
--
--
-- \pdfsuppresswarningpagegroup=1
-- \setlength\parindent{0pt}
--
-- %% MACROS %%
