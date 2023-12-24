local function safeRequire(module)
	local success, req = pcall(require, module)
	if success then return req end
    print("Module " .. module .. " contains error")
end

-- themes
-- safeRequire("config.catppuccin_theme")
safeRequire("config.kanagawa_theme")
-- safeRequire("config.gruvbox_theme")
-- safeRequire("config.github_theme_config")
-- safeRequire("config.nord_config")
-- safeRequire("config.nordic_theme")

-- programming stuff
safeRequire("config.bqf")
safeRequire("config.trouble_config")
safeRequire("config.mason")
safeRequire("config.lsp")
safeRequire("config.cmp")
safeRequire("config.autopairs")

-- general plugins
-- thes plugins do not intefere with each other
safeRequire("config.luasnip_config")
safeRequire("config.treesitter")
safeRequire("config.indentblankline")
safeRequire("config.gitsigns")
safeRequire("Comment").setup()
safeRequire("config.colorizer_config")
safeRequire("config.telescope")
-- safeRequire("config.nvimtree_config")
