local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

-- keymaps
local k = vim.keymap.set
local opts = { noremap = true, silent = true }

-- window navigation
k("n", "<C-h>", "<C-w>h", opts)
k("n", "<C-j>", "<C-w>j", opts)
k("n", "<C-k>", "<C-w>k", opts)
k("n", "<C-l>", "<C-w>l", opts)

--resize
k("n", "<C-Up>", "<CMD>resize +2<CR>", opts)
k("n", "<C-Down>", "<CMD>resize -2<CR>", opts)
k("n", "<C-Left>", "<CMD>vertical resize -2<CR>", opts)
k("n", "<C-Right>", "<CMD>vertical resize +2<CR>", opts)

k("i", "<C-Up>", "<CMD>resize +2<CR>", opts)
k("i", "<C-Down>", "<CMD>resize -2<CR>", opts)
k("i", "<C-Left>", "<CMD>vertical resize -2<CR>", opts)
k("i", "<C-Right>", "<CMD>vertical resize +2<CR>", opts)

k("n", "<C-d>", "<C-d>zz", opts)
k("n", "<C-u>", "<C-u>zz", opts)
k("n", "n", "nzzzv", opts)
k("n", "N", "Nzzzv", opts)

-- stop ctrl c from entering normal mode
k("i", "<C-c>", "<NOP>", opts)

-- noh
k("n", "gh", "<CMD>noh<CR>", opts)

-- format
k("n", "go", "<CMD>Format<CR>", opts)

-- ts
k("n", "g(", function()
	require("treesitter-context").go_to_context()
end, opts)

-- fzf
k("n", "<leader>f", function()
	require("fzf-lua").files()
end, opts)
k("n", "<leader>g", function()
	require("fzf-lua").live_grep()
end, opts)

-- CP
k("n", "<leader>i", "<CMD>vsp %:r.in<CR><C-w>r<CR>", opts) -- CP open input file
k("n", "<leader>j", "<CMD>!g++-12 --std=c++17 %:r.cpp && ./a.out < %:r.in<CR>", opts) -- CP run with input file

-- bidirectional leap
k("n", "s", function()
	require("leap").leap({ target_windows = { vim.api.nvim_get_current_win() } })
end)

-- copy path
k("n", '"+yc', '<CMD>let @+ = expand("%")<CR>', opts)
k("n", '"+yC', '<CMD>let @+ = expand("%:p")<CR>', opts)

-- textobject for gcu
-- https://github.com/numToStr/Comment.nvim/issues/22#issuecomment-1272569139
local function commented_lines_textobject()
	local U = require("Comment.utils")
	local cl = vim.api.nvim_win_get_cursor(0)[1] -- current line
	local range = { srow = cl, scol = 0, erow = cl, ecol = 0 }
	local ctx = {
		ctype = U.ctype.linewise,
		range = range,
	}
	local cstr = require("Comment.ft").calculate(ctx) or vim.bo.commentstring
	local ll, rr = U.unwrap_cstr(cstr)
	local padding = true
	local is_commented = U.is_commented(ll, rr, padding)

	local line = vim.api.nvim_buf_get_lines(0, cl - 1, cl, false)
	if next(line) == nil or not is_commented(line[1]) then
		return
	end

	local rs, re = cl, cl -- range start and end
	repeat
		rs = rs - 1
		line = vim.api.nvim_buf_get_lines(0, rs - 1, rs, false)
	until next(line) == nil or not is_commented(line[1])
	rs = rs + 1
	repeat
		re = re + 1
		line = vim.api.nvim_buf_get_lines(0, re - 1, re, false)
	until next(line) == nil or not is_commented(line[1])
	re = re - 1

	vim.fn.execute("normal! " .. rs .. "GV" .. re .. "G")
end
k("o", "u", commented_lines_textobject, opts)

-- NOTE: q: open command line window

vim.cmd([[
  command! WQ wq
  command! Wq wq
  command! WQa wqa
  command! Wqa wqa
  command! WA wa
  command! Wa wa
  command! W w
  command! Q q
]])

-- my log
k("n", "<leader>rj", [[:put =strftime('# %Y-%m-%d')<CR>]], opts)
k("n", "<leader>rk", [[:put =strftime('%H:%M')<CR>]], opts)

-- 'cd' towards the directory in which the current file is edited
k("n", "<leader>cd", "<CMD>cd %:p:h<CR>", opts)

-- Stay in visual mode after actions
k("v", ">", ">gv", opts)
k("v", "<", "<gv", opts)
k("v", "y", "ygv", opts)
k("v", "~", "~gv", opts)
k("v", "u", "ugv", opts)
k("v", "u", "ugv", opts)
k("v", "g~", "g~gv", opts)
k("v", "gu", "gugv", opts)
k("v", "gu", "gugv", opts)
k("v", "gc", "gcgv", opts)

-- options
-- :help options
local o = vim.opt
o.backup = false
o.cmdheight = 1
o.completeopt = { "menuone", "noselect" } -- for cmp
o.conceallevel = 2 -- conceal for json/md/tex files
o.fileencoding = "utf-8"
o.hlsearch = true -- highlight all matches on previous search pattern
o.ignorecase = false
o.mouse = "a" -- allow the mouse to be used in neovim
o.pumheight = 10 -- pop up menu height
o.showtabline = 2 -- always show tabs
o.smartcase = true
o.autoindent = true
o.smartindent = true
o.swapfile = false
o.termguicolors = true
o.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
o.undofile = true -- enable persistent undo
o.updatetime = 300 -- faster completion (4000ms default)
o.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
o.expandtab = true -- convert tabs to spaces
o.shiftwidth = 4 -- the number of spaces inserted for each indentation
o.tabstop = 4 -- insert 4 spaces for a tab
o.cursorline = true -- highlight the current line
o.number = true -- set numbered lines
o.relativenumber = true -- set relative numbered lines
o.numberwidth = 4 -- set number column width to 2 {default 4}
o.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
o.wrap = true
o.scrolloff = 3
o.sidescrolloff = 3
o.hidden = true
o.title = true
-- o.spell = true
-- o.spelllang = "en_us"

vim.cmd([[ let &t_ut='' ]])
vim.cmd([[ set iskeyword-=_ ]])

vim.filetype.add({
	extension = {
		wgsl = "wgsl",
	},
})

-- TODO: tabline
-- format
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
    typst = "!noglob typstle -i %",
}

vim.api.nvim_create_user_command("Format", function()
	vim.cmd("w")
	local ft = vim.bo.filetype
	local cmd = formatters[ft]
	if cmd then
		vim.cmd("silent " .. cmd)
		vim.cmd("e!") -- to reload the buffer after the external command
	else
		print("No formatter defined for " .. ft)
	end
end, {})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "javascript*",
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "typescript*",
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
	end,
})

require("lazy").setup("plugins")
