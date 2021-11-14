local util = require 'lspconfig/util'
local root_pattern = util.root_pattern("package.json")

require'lspconfig'.clangd.setup {
    -- cmd = {DATA_PATH .. "/lspinstall/cpp/clangd/bin/clangd"},
    on_attach = require'lsp'.common_on_attach,
    cmd = { "clangd", "--background-index" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = root_pattern("compile_commands.json", "compile_flags.txt", ".git") or dirname,
    single_file_support = true,
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = O.clang.diagnostics.virtual_text,
            signs = O.clang.diagnostics.signs,
            underline = O.clang.diagnostics.underline,
            update_in_insert = false
        })
    }
}
