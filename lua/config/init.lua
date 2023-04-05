-- UI components
-- require("config.bufferline")
require("config.lualine")
require("config.barbar")

-- programming stuff
require("config.bqf")
require("config.trouble_config")
require("config.mason")
require("config.lsp")
require("config.cmp")
require("config.autopairs")

-- general plugins
-- thes plugins do not intefere with each other
require("luasnip.loaders.from_vscode").lazy_load()
require("config.treesitter")
require("config.indentblankline")
require("config.gitsigns")
require("Comment").setup()
require("config.colorizer_config")
require("config.telescope")

-- themes
require("config.catppuccin_theme")
