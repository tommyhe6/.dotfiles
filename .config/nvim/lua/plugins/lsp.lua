return {
	{
		"neovim/nvim-lspconfig", -- enable lsp
		config = function()
			local lspconfig = require("lspconfig")
			local lsp_defaults = lspconfig.util.default_config

			lsp_defaults.capabilities =
				vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function()
					local opts = { buffer = true, noremap = true, silent = true }
					vim.keymap.set("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>", opts)
					vim.keymap.set("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>")
					vim.keymap.set("n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>")
					vim.keymap.set("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>")
					vim.keymap.set("n", "gy", "<CMD>lua vim.lsp.buf.type_definition()<CR>")
					vim.keymap.set("n", "gr", "<CMD>lua vim.lsp.buf.references()<CR>")
					vim.keymap.set("n", "ch", "<CMD>lua vim.lsp.buf.rename()<CR>")
					vim.keymap.set("n", "gl", "<CMD>lua vim.diagnostic.open_float()<CR>")
					vim.keymap.set("n", "g[", "<CMD>lua vim.diagnostic.goto_prev()<CR>")
					vim.keymap.set("n", "g]", "<CMD>lua vim.diagnostic.goto_next()<CR>")
					vim.keymap.set("n", "gk", "<CMD>lua vim.lsp.buf.code_action()<CR>")
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
			lspconfig.gopls.setup({})
			lspconfig.tsserver.setup({})
			lspconfig.clangd.setup({
				cmd = {
					"clangd",
					"--offset-encoding=utf-16",
					"--clang-tidy",
				},
			})
			lspconfig.nixd.setup({})
			-- lspconfig.wgsl_analyzer.setup({})
		end,
	},
}
