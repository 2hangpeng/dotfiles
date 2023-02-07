-- https://github.com/nvim-telescope/telescope.nvim
local status, plugin = pcall(require, "telescope")
if not status then
    vim.notify("telescope not installed")
    return
end

local actions = require("telescope.actions")

plugin.setup {
    defaults = {
        -- default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                -- ["<Esc>"] = actions.close,
                ["<Tab>"] = actions.move_selection_previous,
                ["<S-Tab>"] = actions.move_selection_next,
                ["<C-u>"] = false
            }
        },
    },
    pickers = {
        -- default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        -- your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
    }
}
