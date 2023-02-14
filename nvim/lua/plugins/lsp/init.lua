local lsp = {
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            "neovim/nvim-lspconfig",
        },
        event = "BufReadPre",
        config = function()
            local servers = { "bashls", "dockerls", "gopls", "jsonls", "tsserver", "lua_ls", "intelephense",
                "sqlls", "solidity",
                "volar", "yamlls" }
            require("mason-lspconfig").setup({
                ensure_installed = servers,
            })
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            require("mason-lspconfig").setup_handlers {
                -- the first entry (without a key) will be the default handler
                -- and will be called for each installed server that doesn't have
                -- a dedicated handler.
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup({
                        -- on_attach = on_attach,
                        capabilities = capabilities
                    })
                end,
            }
        end
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            -- 'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            -- for vsnip users.
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
            "rafamadriz/friendly-snippets"
        },
        event = "InsertEnter",
        -- event = "VeryLazy",
        config = function()
            require("plugins.lsp.nvim-cmp")
        end
    },
    {
        "ray-x/go.nvim",
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("plugins.lsp.go")
        end,
        -- event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        -- event = "VeryLazy",
        dependencies = {
        },
        config = function()
            require("mason").setup()
        end
    }
}
return lsp
