-- Mofiqul/dracula.nvim
-- dracula/vim
return { "Mofiqul/dracula.nvim", -- dracula colorscheme
    priority= 1000,
    config = function() -- transparent background
        local dracula = require("dracula")
        dracula.setup {
            colors = {
                visual = "#6D6477",
                comment = "#919CBF",
            }
        }
        vim.cmd([[
            augroup user_colors
            autocmd!
            autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
            augroup END 
            colorscheme dracula]])
    end,
}
