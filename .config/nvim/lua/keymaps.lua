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

-- NOTE: :q open command line window

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

