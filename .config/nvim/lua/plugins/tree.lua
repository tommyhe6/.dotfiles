local opts = { noremap = true, silent = true }
return {
	"kyazdani42/nvim-tree.lua", -- file tree
	keys = {
		{
			"<leader>e",
			"<CMD>NvimTreeToggle<CR>",
			mode = "n",
			opts.unpack,
		},
	},
	config = function()
		local tree = require("nvim-tree")
		tree.setup({
			view = {
				side = "right",
				relativenumber = true,
				mappings = {
					list = {
						{ key = "H", action = "" },
						{ key = "I", action = "toggle_dotfiles" },
						{ key = "<C-v>", action = "vsplit" },
						{ key = "<C-s>", action = "split" },
						{ key = "<C-t>", action = "tabnew" },
					},
				},
			},
			diagnostics = {
				enable = true,
			},
		})
	end,
}
