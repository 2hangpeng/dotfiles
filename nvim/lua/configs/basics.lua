-- show line numbers
vim.o.number = true
-- highlight current line
vim.o.cursorline = true
-- jkhl padding
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
-- line of reference on right
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
-- to ALWAYS use the clipboard for ALL operations
vim.o.clipboard = 'unnamed,unnamedplus'

