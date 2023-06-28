local k = vim.keymap.set
local opts = { noremap = true, silent = true }

-- window navigation
k("i", "<C-h>", "<CMD>KittyNavigateLeft<CR>", opts)
k("i", "<C-j>", "<CMD>KittyNavigateDown<CR>", opts)
k("i", "<C-k>", "<CMD>KittyNavigateUp<CR>", opts)
k("i", "<C-l>", "<CMD>KittyNavigateRight<CR>", opts)

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

-- command completion navigation TODO: WHY DOESN"T WORK?
-- local opts_command = { noremap = true, silent = true, expr = true}
-- k("i", "<C-j>", "pumvisible() ? '\\<C-n>' : '\\<C-j>'", opts_command)
-- k("i", "<C-k>", "pumvisible() ? '\\<C-p>' : '\\<C-k>'", opts_command)
-- vim.cmd[[inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("<C-j>"))]]
-- vim.cmd[[inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("<C-k>"))]]

--not overwrite paste
k("v", "p", '"_dp', opts)

-- stop ctrl c from entering normal mode
k("i", "<C-c>", "<NOP>", opts)

-- noh
k("n", "gh", "<CMD>noh<CR>", opts)

-- null ls format 
k("n", "go", "<CMD>lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>", opts)

-- fzf
k("n", "<leader>f", "<CMD>lua require('fzf-lua').files()<CR>", opts)
k("n", "<leader>g", "<CMD>lua require('fzf-lua').live_grep()<CR>", opts)

-- CP
k("n", "<leader>i", "<CMD>vsp %:r.in<CR><C-w>r<CR>", opts) -- CP open input file
k("n", "<leader>j", "<CMD>!g++-12 --std=c++17 %:r.cpp && ./a.out < %:r.in<CR>", opts) -- CP run with input file
