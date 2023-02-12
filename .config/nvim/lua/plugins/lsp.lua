return {
	{ "williamboman/mason.nvim", config = true }, -- installer for LSP and null-ls
	{ "williamboman/mason-lspconfig.nvim" }, -- installer for LSP and null-ls
	{
		"neovim/nvim-lspconfig", -- enable lsp
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup()
			local lspconfig = require("lspconfig")
			local lsp_defaults = lspconfig.util.default_config

			lsp_defaults.capabilities =
				vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function()
					local opts = { buffer = true, noremap = true, silent = true }
					-- Displays hover information about the symbol under the cursor
					vim.keymap.set("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>", opts)
					-- Jump to the definition
					vim.keymap.set("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>")
					-- Jump to declaration
					vim.keymap.set("n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>")
					-- Lists all the implementations for the symbol under the cursor
					vim.keymap.set("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>")
					-- Jumps to the definition of the type symbol
					vim.keymap.set("n", "gy", "<CMD>lua vim.lsp.buf.type_definition()<CR>")
					-- Lists all the references
					vim.keymap.set("n", "gr", "<CMD>lua vim.lsp.buf.references()<CR>")
					-- Renames all references to the symbol under the cursor
					vim.keymap.set("n", "ch", "<CMD>lua vim.lsp.buf.rename()<CR>")
					-- Show diagnostics in a floating window
					vim.keymap.set("n", "gl", "<CMD>lua vim.diagnostic.open_float()<CR>")
					-- Move to the previous diagnostic
					vim.keymap.set("n", "g[", "<CMD>lua vim.diagnostic.goto_prev()<CR>")
					-- Move to the next diagnostic
					vim.keymap.set("n", "g]", "<CMD>lua vim.diagnostic.goto_next()<CR>")
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
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})

			lspconfig.sumneko_lua.setup({})
			lspconfig.rust_analyzer.setup({})
			lspconfig.pyright.setup({})
			lspconfig.texlab.setup({})
			lspconfig.gopls.setup({})
			lspconfig.tsserver.setup({})
			lspconfig.clangd.setup({})
            lspconfig.wgsl_analyzer.setup({})
		end,
	},
}
