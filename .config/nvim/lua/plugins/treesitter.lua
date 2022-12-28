return {
    { "nvim-treesitter/nvim-treesitter", -- tressitter
        event = "BufReadPost",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup {
                ensure_installed = "all", -- one of "all" or a list of languages
                ignore_install = { "phpdoc", "php" }, -- List of parsers to ignore installing
                highlight = {
                    enable = true,
                    disable = { "latex" }, 
                },
                autopairs = {
                    enable = false,
                },
                indent = {
                    enable = true,
                    disable = { "" }
                },
                rainbow = {
                    enable = true,
                    extended_mode = true,
                    max_file_lines = nil,
                },
                context_commentstring = {
                    enable = true,
                    enable_autocmd = false,
                },
                playground = {
                    enable = true,
                }
            }
        end,
    },
    { "p00f/nvim-ts-rainbow",
        event = "BufReadPost"
    }, -- rainbow nested parentheses 
    { "JoosepAlviste/nvim-ts-context-commentstring",
        event = "BufReadPost"
    }, -- comments in context using treesitter
    { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle"}, -- treesitter playground for dev
}
