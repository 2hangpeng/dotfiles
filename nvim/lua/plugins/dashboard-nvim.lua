-- https://github.com/glepnir/dashboard-nvim
require('dashboard').setup {
  theme = 'hyper',
  config = {
    week_header = {
      enable = true,
    },
    footer = {
      "",
      "🎉 Meet a better version of yourself every day.",
    }, -- footer
    shortcut = {
      { desc = ' Update', group = '@property', action = 'Lazy update', key = 'u' },
      -- {
      --   desc = ' Files',
      --   group = 'Label',
      --   action = 'jjscope find_files',
      --   key = 'f',
      -- },
      -- {
      --   desc = ' Apps',
      --   group = 'DiagnosticHint',
      --   action = 'Telescope app',
      --   key = 'a',
      -- },
      -- {
      --   desc = ' dotfiles',
      --   group = 'Number',
      --   action = 'Telescope dotfiles',
      --   key = 'd',
      -- },
    },
  },
}
