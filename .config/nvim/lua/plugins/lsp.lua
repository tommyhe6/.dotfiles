return {
    { "williamboman/mason.nvim", config = true }, -- installer for LSP and null-ls
    { "williamboman/mason-lspconfig.nvim" }, -- installer for LSP and null-ls
    { "neovim/nvim-lspconfig", -- enable lsp
        config = function()
            require('mason').setup()
            require('mason-lspconfig').setup()
            local lspconfig = require('lspconfig')
            local lsp_defaults = lspconfig.util.default_config

            lsp_defaults.capabilities = vim.tbl_deep_extend(
                'force',
                lsp_defaults.capabilities,
                require('cmp_nvim_lsp').default_capabilities()
            )

            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function()
                    local bufmap = function(mode, lhs, rhs)
                        local opts = {buffer = true}
                        vim.keymap.set(mode, lhs, rhs, opts)
                    end
                    -- Displays hover information about the symbol under the cursor
                    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
                    -- Jump to the definition
                    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
                    -- Jump to declaration
                    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
                    -- Lists all the implementations for the symbol under the cursor
                    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
                    -- Jumps to the definition of the type symbol
                    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
                    -- Lists all the references 
                    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
                    -- Displays a function's signature information
                    bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
                    -- Renames all references to the symbol under the cursor
                    bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
                    -- Selects a code action available at the current cursor position
                    bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
                    bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
                    -- Show diagnostics in a floating window
                    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
                    -- Move to the previous diagnostic
                    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
                    -- Move to the next diagnostic
                    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
                end
            })


            local signs = {
                { name = "DiagnosticSignError", text = "" },
                { name = "DiagnosticSignWarn", text = "" },
                { name = "DiagnosticSignHint", text = "" },
                { name = "DiagnosticSignInfo", text = "" },
            }

            for _, sign in ipairs(signs) do
                vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
            end

            vim.diagnostic.config {
                -- disable virtual text
                virtual_text = false,
                -- show signs
                signs = {
                    active = signs,
                },
                update_in_insert = true,
                underline = true,
                severity_sort = true,
                float = {
                    focusable = false,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            }

            -- TODO: ENHANCE
            lspconfig.sumneko_lua.setup({})
            lspconfig.rust_analyzer.setup({})
            lspconfig.pyright.setup({})
            lspconfig.texlab.setup({})
        end
    },
}
