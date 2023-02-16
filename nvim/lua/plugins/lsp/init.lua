local lsp = {
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
        },
        event = "BufReadPre",
        config = function()
            local servers = {
                "bashls",
                "gopls", "intelephense",
                "sqlls",
                "jsonls", "yamlls",
                "tsserver", "volar",
                -- "lua_ls", "dockerls", "solidity","lua_ls",
            }
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = servers,
            })
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            -- Use an on_attach function to only map the following keys
            -- after the language server attaches to the current buffer
            local on_attach = function(client, bufnr)
                -- Enable completion triggered by <c-x><c-o>
                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

                -- Mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local bufopts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
                -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
                -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
                -- vim.keymap.set('n', '<space>wl', function()
                --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                -- end, bufopts)
                vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
                vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
                vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
            end
            require("mason-lspconfig").setup_handlers {
                -- the first entry (without a key) will be the default handler
                -- and will be called for each installed server that doesn't have
                -- a dedicated handler.
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup({
                        on_attach = on_attach,
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
        ft = { "go", "gomod", "gowork", "gotmpl" },
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    }
}
return lsp
