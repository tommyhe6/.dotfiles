local opts = { noremap = true, silent = true }

local k = vim.api.nvim_set_keymap

-- window navigation
--[[ k("n", "<C-h>", "<C-w>h", opts) ]]
--[[ k("n", "<C-j>", "<C-w>j", opts) ]]
--[[ k("n", "<C-k>", "<C-w>k", opts) ]]
--[[ k("n", "<C-l>", "<C-w>l", opts) ]]
--[[ k("n", "<C-r>", "<C-w>r", opts) ]]

--resize
k("n", "<C-Up>", ":resize +2<CR>", opts)
k("n", "<C-Down>", ":resize -2<CR>", opts)
k("n", "<C-Left>", ":vertical resize -2<CR>", opts)
k("n", "<C-Right>", ":vertical resize +2<CR>", opts)

k("i", "<C-Up>", "<Esc>:resize +2<CR>", opts)
k("i", "<C-Down>", "<Esc>:resize -2<CR>", opts)
k("i", "<C-Left>", "<Esc>:vertical resize -2<CR>", opts)
k("i", "<C-Right>", "<Esc>:vertical resize +2<CR>", opts)

-- command completion navigation
-- local opts_command = { noremap = true, silent = true, expr = true}
-- k('i', '<c-j>', 'pumvisible() ? "\\<c-n>" : "\\<c-j>"' , { noremap = true, expr=true })
-- k('i', '<c-k>', 'pumvisible() ? "\\<c-p>" : "\\<c-j>"' , { noremap = true, expr=true })
-- k("i", "<C-j>", "pumvisible() ? '\\<C-N>' : '\\<C-j>'", opts)
-- k("i", "<C-k>", "pumvisible() ? '\\<C-P>' : '\\<C-k>'", opts)
-- vim.cmd[[inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("<C-j>"))]]
-- vim.cmd[[inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("<C-k>"))]]

--not overwrite paste
k("v", "p", '"_dp', opts)

k("n", "<leader>e", ":NvimTreeToggle<CR>", opts) -- tree toggle
k("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown())<CR>", opts) -- telescope file search
k("n", "<leader>g", "<cmd>Telescope live_grep<CR>", opts) -- telescope word search
k("n", "<leader>o", ":Format<CR>", opts) -- null-ls format

k("n", "<leader>i", ":vsp %:r.in<CR><C-r><CR>", opts)
k("n", "<leader>j", ":!g++-12 --std=c++17 %:r.cpp && ./a.out < %:r.in<CR>", opts)


