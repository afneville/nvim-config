-- npm install -g graphql-language-service-cli
require'lspconfig'.graphql.setup {on_attach = require'lsp_config'.common_on_attach}
