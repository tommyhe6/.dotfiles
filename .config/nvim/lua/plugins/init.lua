return {
	-- core
	{ "nvim-lua/popup.nvim" }, -- popup API from vim in Neovim
	{ "nvim-lua/plenary.nvim" }, -- useful lua functions used by plugins
	{ "tpope/vim-repeat" }, -- useful for plugins to use .

	-- utils
	{ "tpope/vim-commentary" }, -- commenting
	{ "kyazdani42/nvim-web-devicons" }, -- icons for tree and lualine
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
	{ "knubie/vim-kitty-navigator" }, -- nvim kitty integration
	{
		"ggandor/leap.nvim", -- easier navigation
		config = function()
			local leap = require("leap")
			leap.add_default_mappings()
			leap.opts.case_sensitive = true
		end,
	},
	{ "kylechui/nvim-surround", config = true }, -- surround
	-- copilot
	{
		"github/copilot.vim",
	},
	-- jupyter integration
	{
		"untitled-ai/jupyter_ascending.vim",
	},
}
