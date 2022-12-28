return {
    -- core
    { "nvim-lua/popup.nvim" }, -- popup API from vim in Neovim
    { "nvim-lua/plenary.nvim" }, -- useful lua functions used by plugins
    { "tpope/vim-repeat" }, -- useful for plugins to use .

    -- utils
    { "windwp/nvim-autopairs", -- autopairs 
        event = "InsertEnter",
        config = {
            check_ts = true,
        },
    },
    { "tpope/vim-commentary" }, -- commenting
    { "kyazdani42/nvim-web-devicons" }, -- icons for tree and lualine
    { "nvim-lualine/lualine.nvim", -- status line
        event = "BufReadPost",
        config = true,
    },

    --navigation
    { "knubie/vim-kitty-navigator" }, -- nvim kitty integration
    { "ggandor/leap.nvim", -- easier navigation
        config = function()
            require("leap").add_default_mappings()
        end,
    },
    { "kylechui/nvim-surround", config = true }, -- surround

    -- visual
    { "dracula/vim", -- dracula colorscheme
        -- TODO: MAKE HIGHLIGHT AND COMMENTS EASIER TO SEE
        config = function() -- transparent background
            vim.cmd([[
            augroup user_colors
            autocmd!
            autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
            augroup END 
            colorscheme dracula]])
        end,
    },
    { "norcalli/nvim-colorizer.lua", -- color highlighting on color hex
        event = "BufReadPost",
        config = true,
    },
    { "lukas-reineke/indent-blankline.nvim" }, -- indent guides
}
