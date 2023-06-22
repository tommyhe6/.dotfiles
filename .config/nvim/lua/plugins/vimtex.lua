return {
	"lervag/vimtex", -- latex
	config = function()
		vim.g.vimtex_compiler_latexmk = {
			build_dir = "",
			callback = 1,
			continuous = 1,
			executable = "latexmk",
			tooks = {},
			options = {
				"-verbose",
				"-file-line-error",
                "-synctex=1",
				"-interaction=nonstopmode",
			},
		}
		vim.g.vimtex_compiler_progname = "nvr"
		-- vim.g.vimtex_view_method = "skim"
		vim.g.vimtex_view_method = "zathura" -- https://github.com/zegervdv/homebrew-zathura/issues/99
		vim.g.vimtex_quickfix_mode = 0
		vim.g.vimtex_view_automatic = 1

		-- TODO: FIX BACKWARDS AND FORWARDS SEARCH
		vim.cmd([[ " backwards search
            function! s:write_server_name() abort
            let nvim_server_file = "/tmp/vimtexserver.txt"
            call writefile([v:servername], nvim_server_file)
            endfunction

            augroup vimtex_common
            autocmd!
            autocmd FileType tex call s:write_server_name()
            augroup END
        ]])

        vim.g.vimtex_syntax_enable = 1
        -- vim.g.vimtex_syntax_conceal_disable = 0

		-- tex conceal
		-- TODO: CONCEAL DOES NOT WORK WITH TREESITTER, DEFAULT COLORS LOOK WEIRD
		vim.opt.conceallevel = 2
		vim.g.vimtex_syntax_conceal = {
		    accents = 1,
		    ligatures = 1,
		    cites = 1,
		    fancy = 1,
		    greek = 1,
		    math_bounds = 1,
		    math_delimiters = 1,
		    math_fracs = 1,
		    math_super_sub = 1,
		    math_symbols = 1,
		    sections = 1,
		    styles = 1
		}
	end,
}
