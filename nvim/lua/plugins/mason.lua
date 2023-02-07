local status, mason = pcall(require, "mason")
if not status then
  vim.notify("mason not installed")
  return
end
local status, masonLspconfig = pcall(require, "mason-lspconfig")
if not status then
  vim.notify("mason-lspconfig not installed")
  return
end
local status, lspConfig = pcall(require, "lspconfig")
if not status then
  vim.notify("lspconfig not installed")
  return
end

mason.setup({})

local servers = { "bashls", "dockerls", "gopls", "jsonls", "tsserver", "sumneko_lua", "intelephense", "sqlls", "solidity",
  "volar", "yamlls" }
masonLspconfig.setup({
  ensure_installed = servers,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- mappings.
  -- see `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

masonLspconfig.setup_handlers {
  -- the first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    lspConfig[server_name].setup({
      on_attach = on_attach,
      capabilities = capabilities
    })
  end,
}
