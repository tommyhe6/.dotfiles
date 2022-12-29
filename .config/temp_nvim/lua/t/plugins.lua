local fn = vim.fn

install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--     augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--     augroup end
-- ]]

-- protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return packer.startup(function(use)
    use "wbthomason/packer.nvim" -- packer plugin manager
    use "nvim-lua/popup.nvim" -- popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- useful lua functions used by plugins

    -- utils
    use "windwp/nvim-autopairs" -- autopairs 
    --[[ use "numToStr/Comment.nvim" -- commenting ]]
    use "tpope/vim-commentary" -- commenting (gcu/gcgc support :()  
    use "kyazdani42/nvim-web-devicons" -- icons for tree
    use "kyazdani42/nvim-tree.lua" -- file tree browser 
    use "nvim-lualine/lualine.nvim" -- status line

    --navigation
    use "knubie/vim-kitty-navigator" -- nvim kitty integration
    use "ggandor/leap.nvim" -- easier navigation
    use "kylechui/nvim-surround" -- surround

    -- latex
    use "lervag/vimtex" -- latex

    --visual
    use "xiyaowong/nvim-transparent" -- transparent background
    use "dracula/vim" -- dravula colorscheme
    use "norcalli/nvim-colorizer.lua"

    --completion
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "hrsh7th/cmp-nvim-lsp" -- LSP completion
    use "hrsh7th/cmp-nvim-lua" -- nvim lua completion
    use "saadparwaiz1/cmp_luasnip" -- snippet completions

    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "jose-elias-alvarez/null-ls.nvim" -- formatters and linters
    use "williamboman/mason.nvim" -- installer for LSP and null-ls

    -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- telescope
    use "nvim-telescope/telescope.nvim" -- telescope fzf

    -- treesitter
    use "nvim-treesitter/nvim-treesitter"  -- treesitter highlighting
    use "p00f/nvim-ts-rainbow" -- rainbow nested parentheses 
    use "JoosepAlviste/nvim-ts-context-commentstring" -- comments in context using treesitter
    use "nvim-treesitter/playground" -- treesitter playground for dev

    -- set up your configuration after cloning packer.nvim
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
