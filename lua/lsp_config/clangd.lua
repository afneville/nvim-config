require'lspconfig'.clangd.setup {
    cmd = {DATA_PATH .. "/lspinstall/cpp/clangd/bin/clangd"},
    on_attach = require'lsp_config'.common_on_attach,
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = Global.clang.diagnostics.virtual_text,
            signs = Global.clang.diagnostics.signs,
            underline = Global.clang.diagnostics.underline,
            update_in_insert = true

        })
    }
}
