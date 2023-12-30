return {
	{
		"nvim-treesitter/nvim-treesitter", -- tressitter
		event = "BufReadPost",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = {
					"c",
					"cpp",
					"cmake",
					"go",
					"gomod",
					"gosum",
					"html",
					"java",
					"json",
					"latex",
					"make",
					"rust",
					"css",
					"javascript",
					"typescript",
					"tsx",
					"vim",
					"yaml",
					"markdown_inline",
					"python",
					"nix",
					"xml",
					"racket",
					"haskell",
                    "norg",
				},
				ignore_install = { "phpdoc", "php" },
				highlight = {
					enable = true,
					disable = { "latex" },
				},
				autopairs = {
					enable = false,
				},
				indent = {
					enable = false,
				},
				rainbow = {
					enable = true,
					extended_mode = true,
					max_file_lines = nil,
				},
				context_commentstring = {
					enable = true,
					enable_autocmd = false,
				},
				playground = {
					enable = true,
				},
			})
		end,
	},
	-- {
	-- 	"JoosepAlviste/nvim-ts-context-commentstring", -- comments in context using treesitter
	-- 	event = "BufReadPost",
	-- },
	{
		"nvim-treesitter/playground", -- treesitter playground for dev
		cmd = "TSPlaygroundToggle",
	},
	{
		"nvim-treesitter/nvim-treesitter-context", -- stick context on top
	},
}
