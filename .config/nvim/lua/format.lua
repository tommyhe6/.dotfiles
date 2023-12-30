local formatters = {
	python = "!ruff format %",
	javascript = "!prettierd %",
	typescript = "!prettierd %",
	javascriptreact = "!prettierd %",
	typescriptreact = "!prettierd %",
	rust = "!rustfmt %",
	go = "!gofmt -w %",
	lua = "!stylua %",
	nix = "!nixpkgs-fmt %",
	json = "%!jq",
    racket = "!raco fmt -i %"
}

vim.cmd("command! Format lua require'format'.format()")

return {
	format = function()
    vim.cmd("w")
		local ft = vim.bo.filetype
		local cmd = formatters[ft]
		if cmd then
			vim.cmd("silent " .. cmd)
			vim.cmd("e!") -- to reload the buffer after the external command
		else
			print("No formatter defined for " .. ft)
		end
	end,
}
