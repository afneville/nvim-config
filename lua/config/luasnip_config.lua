require("luasnip").setup({ enable_autosnippets = true })
require("luasnip.loaders.from_vscode").lazy_load({
    paths = "~/.config/nvim/snippets",
})
