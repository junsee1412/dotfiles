local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
end)

-- lsp_zero.setup_servers({'lua_ls', 'rust_analyzer', 'clangd', 'pyright'})
require('lspconfig').lua_ls.setup({})
require('lspconfig').rust_analyzer.setup({})
require('lspconfig').clangd.setup({})
require('lspconfig').pyright.setup({})