-- lua

vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ','
print(vim.g.mapleader)

require("utils")
require("global_settings")
require("editor_settings")
require("plugins")
require("keymappings")

-- plugins
require("core.compe")
require("core.treesitter")

-- lsp
require("lsp")
require('lsp.bash-ls')
require('lsp.clangd')
require('lsp.css-ls')
require('lsp.docker-ls')
require('lsp.efm-general-ls')
require('lsp.emmet-ls')
require('lsp.html-ls')
require('lsp.js-ts-ls')
require('lsp.latex-ls')
require('lsp.lua-ls')
require('lsp.php-ls')
require('lsp.python-ls')
require('lsp.rust-ls')
require('lsp.vim-ls')
