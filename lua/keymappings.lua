local lua_utils = require('lua_utils')

-- set the leader key
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '
-- most keybindings involving the leader key are set in the which key config file

-- resize with arrows
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize -2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize +2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +2<CR>', {silent = true})

-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- use infrequent character cominations to exit insert mode
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'kj', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {noremap = true, silent = true})

-- use tab key to switch buffer in normal mode
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})

-- emacs style C-j/k scrolling
vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')

-- toggle the quickfix popup
vim.api.nvim_set_keymap('', '<C-q>', ':call QuickFixToggle()<CR>', {noremap = true, silent = true})

-- lines above and below from normal mode
lua_utils.map('', '<leader>ij', 'o<esc>0Dk')
lua_utils.map('', '<leader>ik', 'O<esc>0Dj')

-- more comfortable window navigation
lua_utils.map('', '<leader>wh', '<C-w>h')
lua_utils.map('', '<leader>wj', '<C-w>j')
lua_utils.map('', '<leader>wk', '<C-w>k')
lua_utils.map('', '<leader>wl', '<C-w>l')
lua_utils.map('', '<leader>tcc', ':set cursorcolumn!<CR>')
lua_utils.map('', '<leader>tcl', ':set cursorline!<CR>')
