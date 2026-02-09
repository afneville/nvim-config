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

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    vim.bo[bufnr].formatexpr = nil

    if client.server_capabilities.documentHighlightProvider then
      local highlight_augroup = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
      vim.api.nvim_clear_autocmds({ buffer = bufnr, group = highlight_augroup })
      vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd("CursorMoved", {
        buffer = bufnr,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })
    end

    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<CR>", bufopts)
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

    local status, wd = pcall(require, "workspace-diagnostics")
    if status then
      wd.populate_workspace_diagnostics(client, 0)
    end
  end,
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
vim.lsp.enable("asm_lsp")
