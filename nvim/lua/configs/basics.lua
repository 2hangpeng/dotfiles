-- show line numbers
vim.o.number = true
-- highlight current line
vim.o.cursorline = true
-- 右侧参考线，超过表示代码太长了，考虑换行
vim.o.colorcolumn = "150"
-- number of visual spaces per TAB
vim.o.tabstop = 4
-- number of spaces in tab when editing
vim.o.softtabstop = 4
-- number of spaces to use for autoindent
vim.o.shiftwidth = 4
-- expand tab to spaces so that tabs are spaces
vim.o.expandtab = true
-- ignore case when searching
vim.o.ignorecase = true
-- don't ignore case when searching if pattern has upper case
vim.o.smartcase = true
-- customize completions
vim.o.completeopt   = 'menuone,noinsert,noselect'
-- don't store backup while overwriting the file
vim.o.backup = false
-- don't store backup while overwriting the file
vim.o.writebackup = false
-- horizontal splits will be below
vim.o.splitbelow = true
-- vertical splits will be to the right
vim.o.splitright = true
-- enable gui colors
-- vim.o.termguicolors = true

