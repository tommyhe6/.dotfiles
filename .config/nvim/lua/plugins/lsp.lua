return {
	{
		"neovim/nvim-lspconfig", -- enable lsp
		config = function()
			local lspconfig = require("lspconfig")
			local lsp_defaults = lspconfig.util.default_config

			lsp_defaults.capabilities =
				vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

			vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
			vim.keymap.set("n", "g[", vim.diagnostic.goto_prev, opts)
			vim.keymap.set("n", "g]", vim.diagnostic.goto_next, opts)

			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function()
					local opts = { buffer = true, noremap = true, silent = true }
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "ch", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "gk", vim.lsp.buf.code_action, opts)
					-- vim.keymap.set("n", "go", function()
					-- 	vim.lsp.buf.format({ async = true })
					-- end, opts)
				end,
			})

			local signs = {
				{ name = "DiagnosticSignError", text = "" },
				{ name = "DiagnosticSignWarn", text = "" },
				{ name = "DiagnosticSignHint", text = "" },
				{ name = "DiagnosticSignInfo", text = "" },
			}

			for _, sign in ipairs(signs) do
				vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
			end

			vim.diagnostic.config({
				virtual_text = false,
				signs = {
					active = signs,
				},
				update_in_insert = true,
				underline = true,
				severity_sort = true,
				float = {
					focusable = false,
					style = "minimal",
					source = "always",
					header = "",
					prefix = "",
				},
			})

			lspconfig.lua_ls.setup({})
			lspconfig.rust_analyzer.setup({})
			lspconfig.pyright.setup({})
			-- lspconfig.basedpyright.setup({})
			lspconfig.gopls.setup({})
			lspconfig.ts_ls.setup({})
			lspconfig.clangd.setup({
				cmd = {
					"clangd",
					"--offset-encoding=utf-16",
					"--clang-tidy",
				},
			})
			lspconfig.nixd.setup({})
			lspconfig.racket_langserver.setup({})
			lspconfig.sqls.setup({})
			lspconfig.terraformls.setup({})
			lspconfig.dockerls.setup({ cmd = { "docker-langserver", "--stdio" } })
			-- lspconfig.typos_lsp.setup({})
			lspconfig.tinymist.setup({})

			-- lspconfig.wgsl_analyzer.setup({})
		end,
	},
}
