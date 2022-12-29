local transparent_status_ok, transparent = pcall(require, "transparent")
if not transparent_status_ok then
    return
end

local colorizer_status_ok, colorizer = pcall(require, "colorizer")
if not colorizer_status_ok then
    return
end

vim.cmd "colorscheme dracula"

transparent.setup({
    enable = true, -- boolean: enable transparent
    extra_groups = { -- table/string: additional groups that should be cleared
        "all"
    -- In particular, when you set it to 'all', that means all available groups

    -- example of akinsho/nvim-bufferline.lua
    -- "BufferLineTabClose",
    -- "BufferlineBufferSelected",
    -- "BufferLineFill",
    -- "BufferLineBackground",
    -- "BufferLineSeparator",
    -- "BufferLineIndicatorSelected",
    },
    exclude = {}, -- table: groups you don't want to clear
})

colorizer.setup()
