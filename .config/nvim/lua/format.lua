local formatters = {
	python = "!noglob ruff format %; ruff check --select I --fix %", -- format and isort
	javascript = "!noglob prettier -w %",
	typescript = "!noglob prettier -w --parser typescript %",
	javascriptreact = "!noglob prettier -w %",
	typescriptreact = "!noglob prettier -w --parser typescript %",
	html = "!noglob prettier -w %",
	css = "!noglob prettier -w %",
	rust = "!noglob rustfmt %",
	go = "!noglob gofmt -w %",
	lua = "!noglob stylua %",
	nix = "!noglob nixpkgs-fmt %",
	-- json = "!jq . % > %",
	racket = "!noglob raco fmt -i %",
	sql = "!noglob pg_format --keyword-case 1 -o % --comma-start %", -- keyword-case 1 = lowercase
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
