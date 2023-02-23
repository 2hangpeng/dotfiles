-- https://github.com/glepnir/dashboard-nvim
require('dashboard').setup {
  -- theme = 'hyper',
  config = {
    week_header = {
      enable = true,
    },
    disable_move = true,
    shortcut = {
      {
				icon = "  ",
        desc = "File Browser",
        key = 'fb',
				action = "NvimTreeToggle",
        icon_hl = 'Statement',
        desc_hl = 'Statement',
			},
      {
				icon = '  ',
        desc = 'New File',
        key = 'nf',
        action = 'enew',
        icon_hl = 'Statement',
        desc_hl = 'Statement',
      },
      {
				icon = '  ',
        desc = 'Find File',
        key = 'ff',
        action = 'Telescope find_files',
        icon_hl = 'Statement',
        desc_hl = 'Statement',
      },
      {
				icon = '  ',
        desc = 'Find Word',
        key = 'fw',
        action = 'Telescope live_grep',
        icon_hl = 'Statement',
        desc_hl = 'Statement',
      },
      {
				icon = '  ',
        desc = 'Recently Files',
        key = 'fr',
        action = 'Telescope oldfiles',
        icon_hl = 'Statement',
        desc_hl = 'Statement',
      },
      {
				icon = '  ',
        desc = 'Exit',
        key = 'q',
        action = 'qa',
        icon_hl = 'Statement',
        desc_hl = 'Statement',
      },
      -- { desc = '', group = '', key = 'nil', action = '' },
      -- { desc = ' Lazy', group = '@property', key = 'l', action = 'Lazy' },
      -- { desc = '[  Github]',    group = '@keyword' },
      -- { desc = '[  zhangpeng]', group = '@keyword' },
      -- { desc = '[  0.0.1]',     group = '@keyword' },
    },
    footer = {
      "",
      "🎉 Meet a better version of yourself every day.",
    }, -- footer
  },
}
