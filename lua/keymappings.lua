-- set the leader key
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '
-- most keybindings involving the leader key are set in the which key config file

local lua_utils = require('lua_utils')
vim.api.nvim_set_keymap('n', '-', ':RnvimrToggle<CR>', {noremap = true, silent = true})

-- resize with arrows
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize -2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize +2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +2<CR>', {silent = true})

-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- replace escape key
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'kj', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {noremap = true, silent = true})

-- Tab switch buffer
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

-- Better nav for omnicomplete
vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')

-- fix to get netrw's gx command to work correctly
vim.api.nvim_set_keymap('n', 'gx', ":call netrw#BrowseX(expand((exists('g:netrw_gx')? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())<cr>", {noremap = true, silent = true})

vim.cmd('vnoremap p "0p')
vim.cmd('vnoremap P "0P')

vim.api.nvim_set_keymap('', '<C-q>', ':call QuickFixToggle()<CR>', {noremap = true, silent = true})

lua_utils.map('', '<leader>ij', 'o<esc>0Dk')
lua_utils.map('', '<leader>ik', 'O<esc>0Dj')

lua_utils.map('', '<leader>wh', '<C-w>h')
lua_utils.map('', '<leader>wj', '<C-w>j')
lua_utils.map('', '<leader>wk', '<C-w>k')
lua_utils.map('', '<leader>wl', '<C-w>l')
