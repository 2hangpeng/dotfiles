local status, utils = pcall(require, "utils/utils")
if not status then
    vim.notify("utils not installed")
    return
end

-- 0 -> ^
utils.keymap('n', '0', '^', {expr=true})

-- better up/down
utils.keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
utils.keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- move to window using the <ctrl> hjkl keys
utils.keymap("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
utils.keymap("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
utils.keymap("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
utils.keymap("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })


-- resize window using <ctrl> arrow keys
utils.keymap("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
utils.keymap("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
utils.keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
utils.keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- move Lines
utils.keymap("n", "<A-j>", ":m .+1<cr>==", { desc = "Move down" })
utils.keymap("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
utils.keymap("i", "<A-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move down" })
utils.keymap("n", "<A-k>", ":m .-2<cr>==", { desc = "Move up" })
utils.keymap("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
utils.keymap("i", "<A-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move up" })

-- clear search with <esc>
utils.keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- better indenting
utils.keymap("v", "<", "<gv")
utils.keymap("v", ">", ">gv")

-- save file
utils.keymap({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- quit
utils.keymap("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
utils.keymap({ "n", "x", "o" }, "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
utils.keymap({ "n", "x", "o" }, "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- copy/paste with system clipboard
utils.keymap({ 'n', 'x' }, 'gy', '"+y', { desc = 'Copy to system clipboard' })
utils.keymap('n', 'gp', '"+p', { desc = 'Paste from system clipboard' })
-- - Paste in Visual with `P` to not copy selected text (`:h v_P`)
utils.keymap('x', 'gp', '"+P', { desc = 'Paste from system clipboard' })
