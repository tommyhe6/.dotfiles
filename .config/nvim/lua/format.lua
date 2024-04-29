local formatters = {
	python = "!ruff format %; ruff check --select I --fix %", -- format and isort
	javascript = "!prettier -w %",
	typescript = "!prettier -w %",
	javascriptreact = "!prettier -w %",
	typescriptreact = "!prettier -w %",
	rust = "!rustfmt %",
	go = "!gofmt -w %",
	lua = "!stylua %",
	nix = "!nixpkgs-fmt %",
	-- json = "!jq . % > %",
	racket = "!raco fmt -i %",
	sql = "!pg_format -u 1 -o % %", -- lowercase
}

vim.cmd("command! Format lua require'format'.format()")

vim.api.nvim_create_autocmd("FileType", {
	pattern = "javascript*",
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
	end
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "typescript*",
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
	end
})

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
