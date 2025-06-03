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
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<space>lr", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<space>la", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "<space>ld", vim.diagnostic.open_float, bufopts)
  vim.keymap.set("n", "[d", function()
    vim.diagnostic.jump({ count = -1 })
  end, bufopts)
  vim.keymap.set("n", "]d", function()
    vim.diagnostic.jump({ count = 1 })
  end, bufopts)
  vim.keymap.set("n", "<space>lq", vim.diagnostic.setqflist, bufopts)
  vim.keymap.set("n", "<space>ll", vim.diagnostic.setloclist, bufopts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities =
  require("cmp_nvim_lsp").default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport =
  true

vim.lsp.config("*", {
  on_attach = on_attach,
})
vim.lsp.config("lua_ls", {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
        path ~= vim.fn.stdpath("config")
        and (
          vim.uv.fs_stat(path .. "/.luarc.json")
          or vim.uv.fs_stat(path .. "/.luarc.jsonc")
        )
      then
        return
      end
    end
    client.config.settings.Lua =
      vim.tbl_deep_extend("force", client.config.settings.Lua, {
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
vim.lsp.enable("lua_ls")
