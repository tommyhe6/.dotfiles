return {
	"L3MON4D3/LuaSnip",
	event = "InsertEnter",
	-- TODO: FIGURE OUT AUTOTRIGGER
	-- TODO: PORT OVER LATEX SNIPPETS
	dependencies = { "rafamadriz/friendly-snippets" }, -- a bunch of common snippets
	config = function()
		local luasnip = require("luasnip")
		require("luasnip.loaders.from_vscode").lazy_load({
			paths = {
				"~/.local/share/nvim/site/pack/packer/start/friendly-snippets/",
				"~/.config/nvim/snippets/",
			},
		})
		require("luasnip.loaders.from_lua").lazy_load({
			paths = {
				"~/.config/nvim/snippets/",
			},
		})

		luasnip.config.set_config({
			history = true, -- keep around last snippet local to jump back
			enable_autosnippets = true,
		})
	end,
}
