local utils = require('utils')

-- set the leader key
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

vim.cmd("nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>")
vim.cmd("nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>")
vim.cmd("nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>")
vim.cmd("nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>")
vim.cmd("nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>")
vim.cmd('inoremap <silent> <C-k> <cmd>lua vim.lsp.buf.hover()<CR>')

-- resize with arrows
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize -2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize +2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +2<CR>', {silent = true})

-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- use infrequent character combinations to exit insert mode
-- vim.api.nvim_set_keymap('i', 'jk', '<ESC>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('i', 'kj', '<ESC>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {noremap = true, silent = true})

-- use tab key to switch buffer in normal mode (using bar-bar instead)
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})

-- emacs style C-j/k scrolling
vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')
vim.api.nvim_set_keymap('', '<C-q>', ':cclose<CR>', {noremap = true, silent = true})

-- insert lines above & below
utils.map('', '<leader>ij', 'o<esc>0Dk')
utils.map('', '<leader>ik', 'O<esc>0Dj')

utils.map('', '<leader>lr', ':lua vim.lsp.buf.rename()<CR>')
utils.map('', '<leader>ld', ':TroubleToggle<CR>')

-- improve window navigation
utils.map('', '<leader>wh', '<C-w>h')
utils.map('', '<leader>wj', '<C-w>j')
utils.map('', '<leader>wk', '<C-w>k')
utils.map('', '<leader>wl', '<C-w>l')


utils.map('', '<leader>ff', ':Files<CR>')
utils.map('', '<leader>bb', ':Buffers<CR>')

-- gereral bindings
utils.map('', '<leader>tcc', ':set cursorcolumn!<CR>')
utils.map('', '<leader>tcl', ':set cursorline!<CR>')

-- explorer
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- Comments
vim.api.nvim_set_keymap("n", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})
