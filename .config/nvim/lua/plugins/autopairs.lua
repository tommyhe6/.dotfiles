return {
    {
        "windwp/nvim-autopairs", -- autopairs
        event = "InsertEnter",
        config = function()
            local npairs = require("nvim-autopairs")
            npairs.setup({
                check_ts = true,
                disable_filetype = { "TelescopePrompt", "spectre_panel" },
                fast_wrap = {
                    map = "<C-w>",
                },
            })

            local Rule = require("nvim-autopairs.rule")
            npairs.add_rules({
                Rule("\\(", "\\)", "tex"),
                Rule("\\[", "\\]", "tex"),
                Rule("\\{", "\\}", "tex"),
            })

            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            local cmp_status_ok, cmp = pcall(require, "cmp")
            if not cmp_status_ok then
                return
            end
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
        end,
    },
    {
        "abecodes/tabout.nvim",
        event = "InsertEnter",
        config = {
            tabkey = "<C-n>",
            backwards_tabkey = "<C-p>",
            tabouts = {
                { open = "'", close = "'" },
                { open = '"', close = '"' },
                { open = "`", close = "`" },
                { open = "(", close = ")" },
                { open = "[", close = "]" },
                { open = "{", close = "}" },
                { open = "\\(", close = "\\)" },
                { open = "\\[", close = "\\]" },
            },
        },
    },
}
