require('lua_utils')
require('global_settings')
require('editor_settings')
require('plugins')
require('autocommands')
require('autopairs')
require('keymappings')

require('rnvimr_config')
require('nvimtree_config') -- must be required before colorscheme
require('lsp-rooter_config')
require('galaxyline_config')
require('dashboard_config')
require('barbar_config')
require('gitsigns_config')
require('comment_config')
require('matchup_config')
require('which-key_config')
require('zen_config')
require('colorscheme') -- must be required after nvimtree
require('compe_config')
require('treesitter_config')
require('telescope_config')

-- require("highlights") -- will add soon

-- LSP

require('lsp_config')
require('lsp_config.angular-ls')
require('lsp_config.bash-ls')
require('lsp_config.clangd')
require('lsp_config.cmake-ls')
require('lsp_config.css-ls')
require('lsp_config.dart-ls')
require('lsp_config.docker-ls')
require('lsp_config.efm-general-ls')
require('lsp_config.elm-ls')
require('lsp_config.emmet-ls')
require('lsp_config.graphql-ls')
require('lsp_config.go-ls')
require('lsp_config.html-ls')
require('lsp_config.json-ls')
require('lsp_config.js-ts-ls')
require('lsp_config.kotlin-ls')
require('lsp_config.latex-ls')
require('lsp_config.lua-ls')
require('lsp_config.php-ls')
require('lsp_config.python-ls')
require('lsp_config.ruby-ls')
require('lsp_config.rust-ls')
require('lsp_config.svelte-ls')
require('lsp_config.terraform-ls')
require('lsp_config.vim-ls')
require('lsp_config.vue-ls')
require('lsp_config.yaml-ls')
require('lsp_config.elixir-ls')
-- require('lsp.tailwindcss-ls')

-- extras
if Global.extras then
    -- require('lv-hop')
    require('colorizer_config')
    require('symbols-outline_config')
end

vim.cmd('source '..CONFIG_PATH..'/vimscript/functions.vim')
