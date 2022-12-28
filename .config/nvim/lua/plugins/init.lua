return {
    -- core
    { "nvim-lua/popup.nvim" }, -- popup API from vim in Neovim
    { "nvim-lua/plenary.nvim" }, -- useful lua functions used by plugins
    { "tpope/vim-repeat" }, -- useful for plugins to use .

    -- utils
    { "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = {
            check_ts = true,
        },
    }, -- autopairs 
    { "tpope/vim-commentary" }, -- commenting
    { "kyazdani42/nvim-web-devicons" }, -- icons for tree and lualine
    { "nvim-lualine/lualine.nvim",
        event = "BufReadPost",
        config = true,
    }, -- status line

    --navigation
    { "knubie/vim-kitty-navigator" }, -- nvim kitty integration
    { "ggandor/leap.nvim",
        config = function()
            require("leap").add_default_mappings()
        end,
    }, -- easier navigation
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
    { "norcalli/nvim-colorizer.lua",
        event = "BufReadPost",
        config = true,
    }, -- color highlighting on color hex
    { "lukas-reineke/indent-blankline.nvim" }, -- indent guides
}
