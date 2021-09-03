local utils = require('utils')

-- set the leader key
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- resize with arrows
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize -2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize +2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +2<CR>', {silent = true})

-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- use infrequent character combinations to exit insert mode
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'kj', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {noremap = true, silent = true})

-- use tab key to switch buffer in normal mode (using bar-bar instead)
-- vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<S-l>", ":BufferNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-h>", ":BufferPrevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<TAB>', ':BufferNext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferPrevious<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gt', ':BufferPick<CR>', {})
vim.api.nvim_set_keymap("n", "<leader>c", ":BufferClose<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>C", ":BufferCloseAllButCurrent<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>p", ":BufferPin<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>P", ":BufferCloseAllButPinned<CR>", {noremap = true, silent = true})

-- emacs style C-j/k scrolling
vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')
vim.api.nvim_set_keymap('', '<C-q>', ':call QuickFixToggle()<CR>', {noremap = true, silent = true})

-- insert lines above & below
utils.map('', '<leader>ij', 'o<esc>0Dk')
utils.map('', '<leader>ik', 'O<esc>0Dj')

-- improve window navigation
utils.map('', '<leader>wh', '<C-w>h')
utils.map('', '<leader>wj', '<C-w>j')
utils.map('', '<leader>wk', '<C-w>k')
utils.map('', '<leader>wl', '<C-w>l')
utils.map('', '<leader>q', ':lua require \'tree\'.close()<CR> :wqa<CR>')

-- gereral bindings
utils.map('', '<leader>tcc', ':set cursorcolumn!<CR>')
utils.map('', '<leader>tcl', ':set cursorline!<CR>')

-- explorer
vim.api.nvim_set_keymap('n', '<leader>e', ':lua require \'tree\'.open()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>E', ':lua require \'tree\'.close()<CR>', {noremap = true, silent = true})

-- dashboard
vim.api.nvim_set_keymap('n', '<Leader>;', ':Dashboard<CR>', {noremap = true, silent = true})

-- Comments
vim.api.nvim_set_keymap("n", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})

-- telescope
utils.map('', '<leader>ht', ':Telescope colorscheme<CR>')
utils.map('', '<leader>ff', ':Telescope find_files<CR>')
-- lua_utils.map('', '<leader>/', ':Telescope current_buffer_fuzzy_find<CR>')
utils.map('', '<leader>sg', ':Telescope live_grep<CR>')
utils.map('', '<leader>sf', ':Telescope find_files<CR>')
utils.map('', '<leader>sc', ':Telescope colorscheme<CR>')
utils.map('', '<leader>bs', ':Telescope buffers<CR>')
