-- https://github.com/lukas-reineke/indent-blankline.nvim
local status, plugin = pcall(require, "indent_blankline")
if not status then
    vim.notify("indent_blankline not installed")
    return
end

plugin.setup({
    show_end_of_line = true,
    space_char_blankline = " ",
})
