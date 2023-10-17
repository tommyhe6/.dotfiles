return {
	-- core
	{ "nvim-lua/popup.nvim" }, -- popup API from vim in Neovim
	{ "nvim-lua/plenary.nvim" }, -- useful lua functions used by plugins
	{ "tpope/vim-repeat" }, -- useful for plugins to use .

	-- utils
	{ "tpope/vim-commentary" }, -- commenting
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
	{ "github/copilot.vim" }, -- copilot
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
		config = true,
	},

	-- just
	{
		"NoahTheDuke/vim-just",
		event = { "BufReadPre", "BufNewFile" },
		ft = { "\\cjustfile", "*.just", ".justfile" },
	},
}
