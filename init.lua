require("plugins")
require("global_settings")
require("editor_settings")
require("mappings")

require("core.nvim-cmp")
require("core.nvim-autopairs")
require("core.treesitter")
require("core.indent-blankline")
require("core.bufferline")
require("core.lualine")
require("core.gitsigns")

vim.cmd("source vimscript/explorer.vim")

require("lsp")
require('lsp.clangd')
require('lsp.lua-ls')
require('lsp.python-ls')
