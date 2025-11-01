vim.diagnostic.config({
  virtual_text = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "▶",
      [vim.diagnostic.severity.WARN] = "▶",
      [vim.diagnostic.severity.INFO] = "▶",
      [vim.diagnostic.severity.HINT] = "▶",
    },
  },
  update_in_insert = false,
  underline = false,
  severity_sort = true,
  float = {
    focusable = true,
    style = "minimal",
    border = "single",
    -- source = "always",
    header = "",
    prefix = "",
  },
})

local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.bo[bufnr].formatexpr = nil
  if client.server_capabilities.documentHighlightProvider then
    vim.cmd([[
augroup lsp_document_highlight
autocmd! * <buffer>
autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
augroup END
]])
  end
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<leader>li", ":LspInfo<CR>")
  vim.keymap.set("n", "<space>lr", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<space>la", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "<space>ld", vim.diagnostic.open_float, bufopts)
  vim.keymap.set("n", "<space>lq", vim.diagnostic.setqflist, bufopts)
  vim.keymap.set("n", "<space>ll", vim.diagnostic.setloclist, bufopts)
  vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover({ border = "single" })
  end, bufopts)
  vim.keymap.set("n", "[d", function()
    vim.diagnostic.jump({ count = -1 })
  end, bufopts)
  vim.keymap.set("n", "]d", function()
    vim.diagnostic.jump({ count = 1 })
  end, bufopts)
  require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
end

vim.lsp.config("*", {
  on_attach = on_attach,
})

vim.lsp.config("lua_ls", {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
        path ~= vim.fn.stdpath("config")
        and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
      then
        return
      end
    end
    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
      runtime = {
        version = "LuaJIT",
        path = {
          "lua/?.lua",
          "lua/?/init.lua",
        },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
        },
      },
    })
  end,
  settings = {
    Lua = {},
  },
})

-- this lsp config has its own on attach, merge with mine
local lspconfig = require("lspconfig")
local svelte_defaults = lspconfig.svelte
vim.lsp.config("svelte", {
  on_attach = {
    svelte_defaults.on_attach,
    on_attach,
  },
})

local pyright_defaults = lspconfig.pyright
vim.lsp.config("pyright", {
  on_attach = {
    pyright_defaults.on_attach,
    on_attach,
  },
})

local clangd_defaults = lspconfig.clangd
vim.lsp.config("clangd", {
  on_attach = {
    clangd_defaults.on_attach,
    on_attach,
  },
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("svelte")
vim.lsp.enable("angularls")
vim.lsp.enable("texlab")
vim.lsp.enable("terraformls")
vim.lsp.enable("cssls")
vim.lsp.enable("tailwindcss")
vim.lsp.enable("pyright")
vim.lsp.enable("clangd")
