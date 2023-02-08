-- https://github.com/folke/tokyonight.nvim
local status, plugin = pcall(require, "tokyonight")
if not status then
  vim.notify("tokyonight not installed")
  return
end

plugin.setup({
  transparent= true
})

vim.cmd([[colorscheme tokyonight]])
