return {
	-- core
	{ "nvim-lua/popup.nvim" }, -- popup API from vim in Neovim
	{ "nvim-lua/plenary.nvim" }, -- useful lua functions used by plugins
	{ "tpope/vim-repeat" }, -- useful for plugins to use .

	-- utils
	-- { "tpope/vim-commentary" }, -- commenting
	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = function()
			require("Comment").setup()
		end,
	}, -- commenting
	{ "nvim-tree/nvim-web-devicons" }, -- icons for tree and lualine
	{
		"nvim-lualine/lualine.nvim", -- status line
		event = "BufReadPost",
		config = {
			options = {
				theme = "dracula-nvim",
			},
		},
	},
	{ "mbbill/undotree" }, -- undotree

	--navigation
	{
		"ggandor/leap.nvim", -- easier navigation
		config = function()
			local leap = require("leap")
			leap.add_default_mappings()
			leap.opts.case_sensitive = true
		end,
	},
	{
		"kylechui/nvim-surround", -- surround
		config = true,
	},
	-- {
	-- 	"zbirenbaum/copilot.lua",
	-- 	cmd = "Copilot",
	-- 	event = "InsertEnter",
	-- 	config = function()
	-- 		require("copilot").setup({})
	-- 	end,
	-- },
	{
		"sourcegraph/sg.nvim",
		config = function()
			require("sg").setup()
		end,
	}, -- cody
	{ "untitled-ai/jupyter_ascending.vim" }, -- jupyter integration

	-- fzf
	{
		"ibhagwan/fzf-lua",
		config = function()
			require("fzf-lua").setup({
				fzf_opts = { ["--border"] = false },
			})
		end,
	},

	-- git integration
	{
		"NeogitOrg/neogit",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("neogit").setup()
		end,
	},

	-- just
	{
		"NoahTheDuke/vim-just",
		event = { "BufReadPre", "BufNewFile" },
		ft = { "\\cjustfile", "*.just", ".justfile" },
	},

	-- md preview
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	{
		{
			"nvim-neorg/neorg",
			build = ":Neorg sync-parsers",
			dependencies = { "nvim-lua/plenary.nvim" },
			config = function()
				require("neorg").setup({
					load = {
						["core.defaults"] = {}, -- Loads default behaviour
						["core.concealer"] = {}, -- Adds pretty icons to your documents
						["core.dirman"] = { -- Manages Neorg workspaces
							config = {
								workspaces = {
									notes = "~/notes",
								},
							},
						},
					},
				})
			end,
		},
	},
}
