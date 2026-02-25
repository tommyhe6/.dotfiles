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
		opts = {
			options = {
				theme = "dracula-nvim",
			},
		},
	},

	--navigation
	{
		url = "https://codeberg.org/andyg/leap.nvim", -- easier navigation
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

	-- fzf
	{
		"ibhagwan/fzf-lua",
		config = function()
			local actions = require("fzf-lua").actions
			require("fzf-lua").setup({
				-- actions = {
				-- 	files = {
				-- 		-- instead of the default action 'actions.file_edit_or_qf'
				-- 		-- it's important to define all other actions here as this
				-- 		-- table does not get merged with the global defaults
				-- 		["default"] = actions.file_edit,
				-- 		["ctrl-s"] = actions.file_split,
				-- 		["ctrl-v"] = actions.file_vsplit,
				-- 		["ctrl-t"] = actions.file_tabedit,
				-- 		["alt-q"] = actions.file_sel_to_qf,
				-- 	},
				-- },
				fzf_opts = { ["--border"] = false },
				grep = {
					resume = true,
					rg_opts = "--sort-files --column --line-number",
					actions = {
						["ctrl-q"] = {
							fn = actions.file_edit_or_qf,
							prefix = "select-all+",
						},
					},
				},
			})
		end,
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
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed.
			"ibhagwan/fzf-lua", -- optional
		},
		config = function()
			require("neogit").setup({})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"jpalardy/vim-slime",
		config = function()
			vim.g.slime_target = "tmux"
			vim.g.slime_default_config = {
				socket_name = vim.fn.split(vim.env.TMUX, ",")[1],
				target_pane = ":.2",
			}
		end,
	},

	-- lean
	{
		"Julian/lean.nvim",
		event = { "BufReadPre *.lean", "BufNewFile *.lean" },

		dependencies = {
			"nvim-lua/plenary.nvim",

			-- optional dependencies:

			-- a completion engine
			--    hrsh7th/nvim-cmp or Saghen/blink.cmp are popular choices

			-- 'nvim-telescope/telescope.nvim', -- for 2 Lean-specific pickers
			-- 'andymass/vim-matchup',          -- for enhanced % motion behavior
			-- 'andrewradev/switch.vim',        -- for switch support
			-- 'tomtom/tcomment_vim',           -- for commenting
		},

		---@type lean.Config
		opts = { -- see below for full configuration options
			mappings = true,
		},
	},
}
