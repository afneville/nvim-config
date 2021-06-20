-- npm i -g pyright
require'lspconfig'.pyright.setup {
    cmd = {DATA_PATH .. "/lspinstall/python/node_modules/.bin/pyright-langserver", "--stdio"},
    on_attach = require'lsp_config'.common_on_attach,
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = Global.python.diagnostics.virtual_text,
            signs = Global.python.diagnostics.signs,
            underline = Global.python.diagnostics.underline,
            update_in_insert = true
        })
    },
	 settings = {
      python = {
        analysis = {
		  typeCheckingMode = Global.python.analysis.type_checking,
		  autoSearchPaths = Global.python.analysis.auto_search_paths,
          useLibraryCodeForTypes = Global.python.analysis.use_library_code_types
        }
      }
    }
}
