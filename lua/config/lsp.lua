vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = false,
    underline = false,
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "double",
        source = "always",
        header = "",
        prefix = "",
    },
})
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "single",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "single",
})

local lsp_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    -- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<space>lr", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<space>la", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "<space>ld", vim.diagnostic.open_float, bufopts)
    vim.keymap.set("n", "<space>lf", function()
        vim.lsp.buf.format({ async = true })
    end, bufopts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)
    vim.keymap.set("n", "<space>lq", vim.diagnostic.setqflist, bufopts)
    vim.keymap.set("n", "<space>ll", vim.diagnostic.setloclist, bufopts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
local lspconfig = require("lspconfig")
local null_ls = require("null-ls")
local lsp_flags = {
    debounce_text_changes = 150,
}

lspconfig["clangd"].setup({
    on_attach = lsp_attach,
    capabilities = capabilities,
    flags = lsp_flags,
})
lspconfig["sumneko_lua"].setup({
    on_attach = lsp_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    settings = {
        Lua = {
            diagnostics = {
                globals = {
                    "vim",
                },
            },
        },
    },
})
lspconfig["pyright"].setup({
    on_attach = lsp_attach,
    capabilities = capabilities,
    flags = lsp_flags,
})
lspconfig["bashls"].setup({
    on_attach = lsp_attach,
    capabilities = capabilities,
    flags = lsp_flags,
})

local sources = {
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.shfmt.with({
        extra_args = { "-i", "4", "-ci"}
    }),
    null_ls.builtins.formatting.clang_format.with({
        extra_args = { "--style", "{BasedOnStyle: llvm, IndentWidth: 4}" }
    }),
    null_ls.builtins.formatting.jq,
    null_ls.builtins.formatting.stylua.with({
        extra_args = { "--indent-type", "\"Spaces\"", "--indent-width", "4", "--quote-style", "\"AutoPreferDouble\"",
            "--call-parentheses", "\"Always\"", "--column-width", "80" }
    }),
}
null_ls.setup({ sources = sources })
