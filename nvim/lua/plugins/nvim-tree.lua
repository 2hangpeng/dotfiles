-- https://github.com/kyazdani42/nvim-tree.lua

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup {
  view = {
    width = 30,
    mappings = {
      list = { -- BEGIN_DEFAULT_MAPPINGS
        -- add a file; leaving a trailing `/` will add a directory
        { key = "a",                              action = "create" },
        -- delete a file (will prompt for confirmation)
        { key = "d",                              action = "remove" },
        -- rename a file
        { key = "r",                              action = "rename" },
        -- add/remove file/directory to cut clipboard
        { key = "x",                              action = "cut" },
        -- add/remove file/directory to copy clipboard
        { key = "c",                              action = "copy" },
        -- paste from clipboard; cut clipboard has precedence over copy; will prompt for confirmation
        { key = "p",                              action = "paste" },
        -- copy name to system clipboard
        { key = "y",                              action = "copy_name" },
        -- copy relative path to system clipboard
        { key = "Y",                              action = "copy_path" },
        -- collapse under the cursor
        { key = "tc",                             action = "collapse_all" },
        -- expand under the cursor
        { key = "te",                             action = "expand_all" },
        -- enter next dir
        { key = "<C-]>",                          action = "cd" },
        -- enter previous dir
        { key = "<C-[>",                          action = "dir_up" },

        { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
        { key = "<C-e>",                          action = "edit_in_place" },
        { key = "O",                              action = "edit_no_picker" },
        { key = { "<2-RightMouse>" },             action = "cd" },
        { key = "<C-v>",                          action = "vsplit" },
        { key = "<C-x>",                          action = "split" },
        { key = "<C-t>",                          action = "tabnew" },
        { key = "<",                              action = "prev_sibling" },
        { key = ">",                              action = "next_sibling" },
        { key = "P",                              action = "parent_node" },
        { key = "<BS>",                           action = "close_node" },
        { key = "<Tab>",                          action = "preview" },
        { key = "K",                              action = "first_sibling" },
        { key = "J",                              action = "last_sibling" },
        { key = "C",                              action = "toggle_git_clean" },
        { key = "I",                              action = "toggle_git_ignored" },
        { key = "H",                              action = "toggle_dotfiles" },
        { key = "B",                              action = "toggle_no_buffer" },
        { key = "U",                              action = "toggle_custom" },
        { key = "R",                              action = "refresh" },
        { key = "D",                              action = "trash" },
        { key = "<C-r>",                          action = "full_rename" },
        { key = "e",                              action = "rename_basename" },
        { key = "gy",                             action = "copy_absolute_path" },
        { key = "[e",                             action = "prev_diag_item" },
        { key = "[c",                             action = "prev_git_item" },
        { key = "]e",                             action = "next_diag_item" },
        { key = "]c",                             action = "next_git_item" },
        { key = "s",                              action = "system_open" },
        { key = "f",                              action = "live_filter" },
        { key = "F",                              action = "clear_live_filter" },
        { key = "q",                              action = "close" },
        { key = "W",                              action = "collapse_all" },
        { key = "E",                              action = "expand_all" },
        { key = "S",                              action = "search_node" },
        { key = ".",                              action = "run_file_command" },
        { key = "<C-k>",                          action = "toggle_file_info" },
        { key = "g?",                             action = "toggle_help" },
        { key = "m",                              action = "toggle_mark" },
        { key = "bmv",                            action = "bulk_move" },
      } -- END_DEFAULT_MAPPINGS
    },
  },
  renderer = {
    icons = {
      show = {
        file = false
      }
    },
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = false,
  },
}

-- nvim-tree is also there in modified buffers so this function filter it out
local modifiedBufs = function(bufs)
  local t = 0
  for k, v in pairs(bufs) do
    if v.name:match("NvimTree_") == nil then
      t = t + 1
    end
  end
  return t
end

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and
        vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil and
        modifiedBufs(vim.fn.getbufinfo({ bufmodified = 1 })) == 0 then
      vim.cmd "quit"
    end
  end
})
