require("luasnip").setup({enable_autosnippets = true})
-- require("luasnip-latex-snippets").setup({ use_treesitter = true })
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({paths = "~/.config/nvim/snippets"})
