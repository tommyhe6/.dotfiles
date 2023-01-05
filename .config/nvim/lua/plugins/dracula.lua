-- Mofiqul/dracula.nvim
-- dracula/vim
return {
	"Mofiqul/dracula.nvim", -- dracula colorscheme
	priority = 1000,
	config = function()
		local dracula = require("dracula")
		dracula.setup({
			colors = {
				visual = "#6D6477",
				comment = "#919CBF",
				fg = "#f0fff0",
			},
			transparent_bg = true,
		})
		vim.cmd([[
            colorscheme dracula
        ]])
	end,
}
