local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
    debug = false,
    sources = {
        -- js/ts/related
        --[[ formatting.prettier.with { extra_args = { "--double-quote", "--jsx-double-quote" } }, ]]
        --[[ diagnostics.eslint, ]]
        -- py
        --[[ formatting.black.with { extra_args = { "--fast" } }, ]]
        --[[ diagnostics.flake8, ]]
        -- lua
        --[[ formatting.stylua, ]]
        --[[ diagnostics.selene, ]]
        -- haskell
        --[[ formatting.fourmolu, ]]
    },
}
