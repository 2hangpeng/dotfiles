-- https://github.com/nvim-telescope/telescope.nvim
local actions = require("telescope.actions")

require("telescope").setup {
    defaults = {
        mappings = {
            i = {
                ["<C-u>"] = false,
                ["<Tab>"] = actions.move_selection_previous,
                ["<S-Tab>"] = actions.move_selection_next,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
            n = {
                ["<esc>"] = actions.close,
                ["<Tab>"] = actions.move_selection_previous,
                ["<S-Tab>"] = actions.move_selection_next,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
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

local status, utils = pcall(require, "utils/utils")
if not status then
    vim.notify("utils not installed")
    return
end
local builtin = require('telescope.builtin')
utils.keymap('n', 'ff', builtin.find_files, {})
utils.keymap('n', 'fw', builtin.live_grep, {})
utils.keymap('n', 'fb', builtin.buffers, {})
utils.keymap('n', 'fh', builtin.help_tags, {})