-- leader key
vim.keymap.set("n", "<Space>", "<NOP>", { noremap = true, silent = true })
vim.keymap.set("n", "K", "<NOP>", { noremap = true, silent = true })
vim.keymap.set("n", "<CR>", "<NOP>", { noremap = true, silent = true })
vim.g.mapleader = " "

-- make c-j and c-k work as n and p
vim.cmd('inoremap <expr> <c-j> ("\\<C-n>")')
vim.cmd('inoremap <expr> <c-k> ("\\<C-p>")')
vim.cmd("autocmd FileType qf map <C-k> k")
vim.cmd("autocmd FileType qf map <C-j> j")
vim.cmd("autocmd FileType qf map q :q<CR>")

-- disable scrolling
vim.cmd("map <ScrollWheelUp> <nop>")
vim.cmd("map <S-ScrollWheelUp> <nop>")
vim.cmd("map <C-ScrollWheelUp> <nop>")
vim.cmd("map <ScrollWheelDown> <nop>")
vim.cmd("map <S-ScrollWheelDown> <nop>")
vim.cmd("map <C-ScrollWheelDown> <nop>")
vim.cmd("map <ScrollWheelLeft> <nop>")
vim.cmd("map <S-ScrollWheelLeft> <nop>")
vim.cmd("map <C-ScrollWheelLeft> <nop>")
vim.cmd("map <ScrollWheelRight> <nop>")
vim.cmd("map <S-ScrollWheelRight> <nop>")
vim.cmd("map <C-ScrollWheelRight> <nop>")

-- modify frames
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { silent = true })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { silent = true })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true })

-- navigation
vim.keymap.set("n", "<TAB>", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<S-TAB>", ":bprevious<CR>", { silent = true })
vim.keymap.set("n", "<leader>c", ":bd<CR>")

-- visual mode
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- center cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- trouble
vim.keymap.set("n", "<leader>t", ":TroubleToggle<CR>")
--luasnip
vim.cmd("inoremap <silent> <C-c> <cmd>lua require('luasnip').jump(1)<Cr>")
vim.cmd("inoremap <silent> <C-v> <cmd>lua require('luasnip').jump(-1)<Cr>")
vim.cmd(
    "imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'"
)

vim.cmd(
    "smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'"
)
-- lsp
vim.keymap.set("n", "<space>lf", ":lua vim.lsp.buf.format({ timeout_ms = 5000 })<CR>")
vim.keymap.set("n", "<leader>li", ":LspInfo<CR>")
