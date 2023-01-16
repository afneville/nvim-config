require("luasnip.loaders.from_vscode").lazy_load()
local ls = require("luasnip")
ls.config.set_config {
    history = false,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = false
}
