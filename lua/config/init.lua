local function safeRequire(module)
  local success, req = pcall(require, module)
  if success then
    return req
  end
  print("Module " .. module .. " contains error")
end

safeRequire("config.catppuccin_theme")
safeRequire("config.lualine")
safeRequire("config.bqf")
safeRequire("config.trouble_config")
safeRequire("config.lsp")
safeRequire("config.formatter")
safeRequire("config.cmp")
safeRequire("config.autopairs")
safeRequire("config.luasnip_config")
safeRequire("config.treesitter")
safeRequire("config.indentblankline")
safeRequire("config.gitsigns")
safeRequire("config.comment")
safeRequire("config.colorizer_config")
safeRequire("config.telescope")
