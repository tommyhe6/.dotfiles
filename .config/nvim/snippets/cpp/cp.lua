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
		{ trig = "cp" },
		fmta(
			[[
            using namespace std;
            #include <<iostream>>
            #include <<cstdio>>
            #include <<cstdlib>>
            #include <<algorithm>>
            #include <<cmath>>
            #include <<vector>>
            #include <<set>>
            #include <<map>>
            #include <<unordered_set>>
            #include <<unordered_map>>
            #include <<queue>>
            #include <<ctime>>
            #include <<cassert>>
            #include <<complex>>
            #include <<string>>
            #include <<cstring>>
            #include <<chrono>>
            #include <<random>>
            #include <<bitset>>
            #include <<array>>
            #define pb push_back
            typedef long long ll;
            typedef pair<<int, int>> pii;
            typedef vector<<int>> vi;
            #define fori(i, l, r) for(int i = l; i << r; ++i)
            #define forn(i, n) for(int i = 0; i << n; ++i)
            #define all(c) c.begin(), c.end()
            const int INF = (int) 1e9 + 7;
            const int MOD = (int) 1e9 + 7;
            const int N = (int) 1e5 + 5;


            inline void solve() {
                <>
            }

            int main() {
                ios_base::sync_with_stdio(false);
                cin.tie(nullptr);
                cout.tie(nullptr);
                int t; cin >>>> t;
                while(t-- >> 0)
                    solve();
            }
            ]],
			{
				i(1),
			}
		)
	),
}
