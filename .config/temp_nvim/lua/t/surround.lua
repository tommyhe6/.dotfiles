local surround_status_ok, surround = pcall(require, "nvim-surround")
if not surround_status_ok then
    return
end

surround.setup({
    surrounds = {
        ["("] = { add = { "(", ")" }},
        [")"] = { add = { "( ", " )" }},
        ["{"] = { add = { "{", "}" }},
        ["}"] = { add = {"{ ", " }" }},
        ["<"] = { add = { "<", ">" }},
        [">"] = { add = { "< ", " >" }},
        ["["] = { add = { "[", "]" }},
        ["]"] = { add = { "[ ", " ]" }},
        ["'"] = { add = { "'", "'" }},
        ['"'] = { add = { '"', '"' }},
        ["`"] = { add = { "`", "`" }},
        HTML = {
            ["t"] = true, -- Use "t" for HTML-style mappings
        },
    },
    aliases = {
        false,
    },
    highlight = {
        duration = 1,
    }
})
