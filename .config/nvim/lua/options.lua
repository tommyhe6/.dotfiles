-- :help options
local o = vim.opt
o.backup = false
o.cmdheight = 1
o.completeopt = { "menuone", "noselect" } -- for cmp
o.conceallevel = 2 -- conceal for json/md/tex files
o.fileencoding = "utf-8"
o.hlsearch = true -- highlight all matches on previous search pattern
o.ignorecase = false
o.mouse = "a" -- allow the mouse to be used in neovim
o.pumheight = 10 -- pop up menu height
o.showtabline = 2 -- always show tabs
o.smartcase = true
o.autoindent = true
o.smartindent = true -- make indenting smarter again
o.swapfile = false
o.termguicolors = true
o.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
o.undofile = true -- enable persistent undo
o.updatetime = 300 -- faster completion (4000ms default)
o.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
o.expandtab = true -- convert tabs to spaces
o.shiftwidth = 4 -- the number of spaces inserted for each indentation
o.tabstop = 4 -- insert 4 spaces for a tab
o.cursorline = true -- highlight the current line
o.number = true -- set numbered lines
o.relativenumber = true -- set relative numbered lines
o.numberwidth = 4 -- set number column width to 2 {default 4}
o.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
o.wrap = true -- display lines as one long line
o.scrolloff = 3
o.sidescrolloff = 3
o.guifont = "MesloLGM Nerd Font" -- the font used in graphical neovim applications

o.shortmess:append("c")

vim.cmd([[ set title ]])
vim.cmd([[ let &t_ut='' ]])

vim.filetype.add {
    extension = {
        wgsl = "wgsl",
    }
}

-- -- Define a function to generate the custom tabline
-- function custom_tabline()
--     local tabline = ""
--     for i = 1, vim.fn.tabpagenr('$') do
--         local buflist = vim.fn.tabpagebuflist(i)
--         local winnr = vim.fn.tabpagewinnr(i)
--         local bufnr = buflist[winnr]
--         local bufname = vim.fn.bufname(bufnr)

--         -- Add a separator after each tab except the last one
--         if i > 1 then
--             tabline = tabline .. " | "
--         end

--         -- Customize the display of each tab item here (e.g., filename)
--         tabline = tabline .. "%" .. i .. "T" .. (bufname ~= "" and bufname or "[No Name]")
--     end
--     return tabline
-- end

-- -- Set the custom tabline as a string
-- vim.opt.tabline = [[%!luaeval('custom_tabline()')]]

-- -- Enable the tabline
-- vim.opt.showtabline = 2
