-- local core_conf_files = {
--     -- "basic.lua",
--     -- "colorscheme.lua", -- colorscheme settings
--     "plugin.lua", -- all the plugins installed and their configurations
--     -- "keybindings.lua", -- all the user-defined mappings
--     -- "globals.lua", -- some global settings
--     -- "options.vim", -- setting options in nvim
--     -- "autocommands.vim", -- various autocommands
-- }

-- -- source all the core config files
-- for _, name in ipairs(core_conf_files) do
--     local path = string.format("%s/configs/%s", vim.fn.stdpath("config"), name)
--     local source_cmd = "source " .. path
--     vim.cmd(source_cmd)
-- end

require("configs/init")
require("plugins/init")
