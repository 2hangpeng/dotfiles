-- https://github.com/nvim-treesitter/nvim-treesitter
require'nvim-treesitter.configs'.setup({
	-- a list of parser names, or "all" (the four listed parsers should always be installed)
	-- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
	ensure_installed = { "bash", "css", "go", "dockerfile", "json", "lua", "markdown", "php", "solidity", "sql", "vim",
		"vue", "yaml" },
	highlight = {
		enable = true,
		-- setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- using this option may slow down your editor, and you may see some duplicate highlights.
		-- instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn", -- set to `false` to disable one of the mappings
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	indent = {
		enable = true
	}
})
