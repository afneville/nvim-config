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
-- vim.api.nvim_set_keymap('i', 'jk', '<ESC>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('i', 'kj', '<ESC>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})

-- emacs style C-j/k scrolling
vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')

-- insert lines above & below
utils.map('', '<leader>ij', 'o<esc>0Dk')
utils.map('', '<leader>ik', 'O<esc>0Dj')

utils.map('', '<leader>e', ':lua require"nvim-tree".toggle(false, true)<CR>')

utils.map('', '<leader>lr', ':lua vim.lsp.buf.rename()<CR>')

-- improve window navigation
utils.map('', '<leader>wh', '<C-w>h')
utils.map('', '<leader>wj', '<C-w>j')
utils.map('', '<leader>wk', '<C-w>k')
utils.map('', '<leader>wl', '<C-w>l')

-- gereral bindings
utils.map('', '<leader>tcc', ':set cursorcolumn!<CR>')
utils.map('', '<leader>tcl', ':set cursorline!<CR>')
utils.map('', '<leader>ff', ':Files<CR>')
utils.map('', '<leader>bb', ':Buffers<CR>')
utils.map('', '<leader>ss', ':Lines<CR>')

-- explorer
-- vim.api.nvim_set_keymap('n', '<Leader>e', ':Lexplore<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>c', ':bd<CR>', {noremap = true, silent = true})

-- Comments
-- vim.api.nvim_set_keymap("n", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap("v", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})

vim.cmd('map <ScrollWheelUp> <nop>')
vim.cmd('map <S-ScrollWheelUp> <nop>')
vim.cmd('map <C-ScrollWheelUp> <nop>')
vim.cmd('map <ScrollWheelDown> <nop>')
vim.cmd('map <S-ScrollWheelDown> <nop>')
vim.cmd('map <C-ScrollWheelDown> <nop>')
vim.cmd('map <ScrollWheelLeft> <nop>')
vim.cmd('map <S-ScrollWheelLeft> <nop>')
vim.cmd('map <C-ScrollWheelLeft> <nop>')
vim.cmd('map <ScrollWheelRight> <nop>')
vim.cmd('map <S-ScrollWheelRight> <nop>')
vim.cmd('map <C-ScrollWheelRight> <nop>')
-- vim.cmd('nnoremap ; :')
-- vim.cmd('nnoremap : ;')
-- vim.cmd('vnoremap ; :')
-- vim.cmd('vnoremap : ;')
-- vim.cmd('imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? \'<Plug>luasnip-expand-or-jump\' : \'<Tab>\'')
-- vim.cmd('inoremap <silent> <S-Tab> <cmd>lua require\'luasnip\'.jump(-1)<Cr>')
-- vim.cmd('snoremap <silent> <Tab> <cmd>lua require(\'luasnip\').jump(1)<Cr>')
-- vim.cmd('snoremap <silent> <S-Tab> <cmd>lua require(\'luasnip\').jump(-1)<Cr>')
-- vim.cmd('imap <silent><expr> <C-E> luasnip#choice_active() ? \'<Plug>luasnip-next-choice\' : \'<C-E>\'')
-- vim.cmd('smap <silent><expr> <C-E> luasnip#choice_active() ? \'<Plug>luasnip-next-choice\' : \'<C-E>\'')
