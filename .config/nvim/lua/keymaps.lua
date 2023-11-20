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

-- fzf
k("n", "<leader>f", "<CMD>lua require('fzf-lua').files()<CR>", opts)
k("n", "<leader>g", "<CMD>lua require('fzf-lua').live_grep()<CR>", opts)

-- CP
k("n", "<leader>i", "<CMD>vsp %:r.in<CR><C-w>r<CR>", opts)                            -- CP open input file
k("n", "<leader>j", "<CMD>!g++-12 --std=c++17 %:r.cpp && ./a.out < %:r.in<CR>", opts) -- CP run with input file

vim.cmd([[
  command! WQ wq
  command! Wq wq
  command! W w
  command! Q q
]])
