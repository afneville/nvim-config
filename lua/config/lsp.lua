vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
        focusable = true,
        style = "minimal",
        border = "single",
        source = "always",
        header = "",
        prefix = "",
    },
})

local signs = {
    Error = Options.error,
    Warn = Options.warn,
    Hint = Options.hint,
    Info = Options.info,
}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "single",
})

vim.lsp.handlers["textDocument/signatureHelp"] =
    vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "single",
    })

local lsp_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.api.nvim_exec(
        [[
      augroup lsp_document_highlight
      autocmd! * <buffer>
      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
      ]],
        false
    )
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<space>lr", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<space>la", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "<space>ld", vim.diagnostic.open_float, bufopts)
    vim.keymap.set("n", "<space>lf", vim.lsp.buf.format, bufopts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)
    vim.keymap.set("n", "<space>lq", vim.diagnostic.setqflist, bufopts)
    vim.keymap.set("n", "<space>ll", vim.diagnostic.setloclist, bufopts)
    client.server_capabilities.documentFormattingProvider = false
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
local lspconfig = require("lspconfig")
local lsp_flags = {
    debounce_text_changes = 150,
}

local servers = { "tsserver", "clangd", "pyright", "bashls", "html", "cssls" }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
        on_attach = lsp_attach,
        capabilities = capabilities,
        flags = lsp_flags,
    })
end

lspconfig["jdtls"].setup({
    on_attach = lsp_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    root_dir = function(fname)
        return require("lspconfig").util.root_pattern(
            "pom.xml",
            "gradle.build",
            ".git"
        )(fname) or vim.fn.getcwd()
    end,
})

lspconfig["lua_ls"].setup({
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

-- null ls
local null_ls = require("null-ls")
local sources = {
    null_ls.builtins.diagnostics.eslint.with({
        extra_args = {
            "--no-eslintrc"
        }
    }),
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.formatting.prettier.with({
        extra_args = {
            "--bracket-same-line",
            "--no-bracket-spacing",
            "--html-whitespace-sensitivity",
            "ignore",
        },
    }),
    null_ls.builtins.formatting.shfmt.with({
        extra_args = { "-i", "4", "-ci" },
    }),
    null_ls.builtins.formatting.clang_format.with({
        extra_args = {
            "--style",
            "{BasedOnStyle: llvm, IndentWidth: 4}",
        },
    }),
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.stylua.with({
        extra_args = {
            "--indent-type",
            "Spaces",
            "--indent-width",
            "4",
            "--quote-style",
            "AutoPreferDouble",
            "--call-parentheses",
            "Always",
            "--column-width",
            "80",
        },
    }),
}
null_ls.setup({ sources = sources })
