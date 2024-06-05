-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- vim.o.winbar = " %t -> %{%v:lua.require'nvim-navic'.get_location()%} %m" --little slow

-- vim.o.winbar = " %t %m" -- without navic
vim.opt.swapfile = false

-- cursor style (this will fix the color for cursor)
vim.opt.guicursor = "n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor,a:blinkon100"

--disabling line numbers
vim.o.number = false
vim.o.relativenumber = false
vim.o.timeoutlen=60
-- vim.o.ttimeoutlen=10
-- vim.o.updatetime=300

-- Options for wrapping
vim.o.wrap = false -- display lines as one long line
-- vim.opt.breakindentopt = 'shift:1,min:0'
-- Below all three options are important for improving wrapping experience
vim.o.breakindent = true
vim.o.showbreak = string.rep(" ", 3)
vim.o.linebreak = true -- make it so that long lines break smartly
