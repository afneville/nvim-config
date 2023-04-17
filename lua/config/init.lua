local function safeRequire(module)
	local success, req = pcall(require, module)
	if success then return req end
    print("Module " .. module .. " contains error")
end


-- UI components
-- require("config.bufferline")
safeRequire("config.lualine")
safeRequire("config.barbar")

-- programming stuff
safeRequire("config.bqf")
safeRequire("config.trouble_config")
safeRequire("config.mason")
safeRequire("config.lsp")
safeRequire("config.cmp")
safeRequire("config.autopairs")

-- general plugins
-- thes plugins do not intefere with each other
safeRequire("luasnip.loaders.from_vscode").lazy_load()
safeRequire("config.treesitter")
safeRequire("config.indentblankline")
safeRequire("config.gitsigns")
safeRequire("Comment").setup()
safeRequire("config.colorizer_config")
safeRequire("config.telescope")

-- themes
safeRequire("config.catppuccin_theme")
