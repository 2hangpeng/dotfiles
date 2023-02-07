local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- the colorscheme should be available when starting Neovim
	{
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			require("plugins/tokyonight")
		end,
	},
	{
		'glepnir/dashboard-nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		event = 'VimEnter',
		config = function()
			require("plugins/dashboard-nvim")
		end,
	},
	{
		'nvim-tree/nvim-tree.lua',
		-- cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		event = "VeryLazy",
		config = function()
			require("plugins/nvim-tree")
		end,
		-- tag = 'nightly' -- optional, updated every week. (see issue #1193)
	},
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		-- cmd = "Telescope",
		event = "VeryLazy",
		config = function()
			require("plugins/telescope")
		end
	},
	{
		'lewis6991/gitsigns.nvim',
		event = "VeryLazy",
		config = function()
			require("plugins/gitsigns")
		end
	},
	{
		'nvim-treesitter/nvim-treesitter',
		event = "VeryLazy",
		config = function()
			require("plugins/nvim-treesitter")
		end,
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		config = function()
			require("plugins/indent-blankline")
		end
	},
	{
		"windwp/nvim-autopairs",
		-- event = "InsertEnter",
		event = "VeryLazy",
		config = function()
			require("plugins/nvim-autopairs")
		end
	},
	{
		"williamboman/mason.nvim",
		-- cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog", "SymbolsOutline" },
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("plugins/mason")
		end
	},
	{
		'simrat39/symbols-outline.nvim',
		dependencies = {
			"williamboman/mason.nvim"
		},
		event = "VeryLazy",
		config = function()
			require("plugins/symbols-outline")
		end
	},
	{
		'hrsh7th/nvim-cmp',
		-- event = "InsertEnter",
		event = "VeryLazy",
		dependencies = {
			'neovim/nvim-lspconfig',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			-- for vsnip users.
			'hrsh7th/cmp-vsnip',
			'hrsh7th/vim-vsnip',
			"rafamadriz/friendly-snippets"
		},
		config = function()
			require("plugins/cmp")
		end
	},
	{
		"ray-x/go.nvim",
		event = "VeryLazy",
		-- ft = "go",
		requires = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("plugins/go")
		end
	}
}
require("lazy").setup(plugins)
