return {
	"jose-elias-alvarez/null-ls.nvim", -- formatters and linters
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		-- format keymap
		null_ls.setup({
			sources = {
				-- js/ts/related
				formatting.prettierd.with({ extra_args = { "--double-quote", "--jsx-double-quote" } }),
				diagnostics.eslint_d,
				-- py
				formatting.black.with({ extra_args = { "--fast" } }),
				diagnostics.flake8.with({ extra_args = { "--ignore=E501" }}),
				-- lua
				formatting.stylua,
				diagnostics.selene,
				-- haskell
				formatting.fourmolu,
				-- rust
				formatting.rustfmt,
				-- go
				formatting.gofmt,
				-- diagnostics.golangci_lint,
                -- tex
                formatting.latexindent,
                -- c/c++
                -- formatting.clang_format,
                {
                    method = null_ls.methods.FORMATTING,
                    filetypes = { "c", "cpp", "h", "hpp", ".def" },
                    generator = null_ls.formatter{
                        command = "trc-clang-format",
                        args = { "-i", '$FILENAME' },
                        to_stdin = true,
                        from_stderr = true,
                    },
                },
                -- shell
                diagnostics.shellcheck,
			},
		})
	end,
}
