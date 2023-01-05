local k = vim.keymap.set
local opts = { noremap = true, silent = true }

-- window navigation
-- k("i", "<C-h>", "<Esc><C-h>", opts)
-- k("i", "<C-j>", "<Esc><C-j>", opts)
-- k("i", "<C-k>", "<Esc><C-k>", opts)
-- k("i", "<C-l>", "<Esc><C-l>", opts)

--resize
k("n", "<C-Up>", ":resize +2<CR>", opts)
k("n", "<C-Down>", ":resize -2<CR>", opts)
k("n", "<C-Left>", ":vertical resize -2<CR>", opts)
k("n", "<C-Right>", ":vertical resize +2<CR>", opts)

k("i", "<C-Up>", "<Esc>:resize +2<CR>", opts)
k("i", "<C-Down>", "<Esc>:resize -2<CR>", opts)
k("i", "<C-Left>", "<Esc>:vertical resize -2<CR>", opts)
k("i", "<C-Right>", "<Esc>:vertical resize +2<CR>", opts)

k("n", "<C-d>", "<C-d>zz", opts)
k("n", "<C-u>", "<C-u>zz", opts)
k("n", "n", "nzzzv", opts)
k("n", "N", "Nzzzv", opts)

-- command completion navigation TODO: WHY DOESN"T WORK?
-- local opts_command = { noremap = true, silent = true, expr = true}
-- k("i", "<C-j>", "pumvisible() ? '\\<C-n>' : '\\<C-j>'", opts_command)
-- k("i", "<C-k>", "pumvisible() ? '\\<C-p>' : '\\<C-k>'", opts_command)
-- vim.cmd[[inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("<C-j>"))]]
-- vim.cmd[[inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("<C-k>"))]]

--not overwrite paste
k("v", "p", '"_dp', opts)

-- CP
k("n", "<leader>i", ":vsp %:r.in<CR><C-r><CR>", opts) -- CP open input file
k("n", "<leader>j", ":!g++-12 --std=c++17 %:r.cpp && ./a.out < %:r.in<CR>", opts) -- CP run with input file
