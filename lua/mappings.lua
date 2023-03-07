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
vim.keymap.set("n", "<Leader>c", ":bd<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>e", ":Ex<CR>")
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wl", "<C-w>l")

-- insert blank lines above and below
vim.keymap.set("n", "<leader>ij", "o<esc>0Dk")
vim.keymap.set("n", "<leader>ik", "O<esc>0Dj")

-- toggle cursore line and column
vim.keymap.set("n", "<leader>tcc", ":set cursorcolumn!<CR>")
vim.keymap.set("n", "<leader>tcl", ":set cursorline!<CR>")

-- visual mode
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- clipboard integration
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>P", '"+P')
vim.keymap.set("v", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')
vim.keymap.set("n", "<leader>p", '"+p')

-- do not change buffer contents when pasting over something
vim.keymap.set("v", "<leader>dp", '"_dP')

-- center cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- extension keymaps
vim.keymap.set("n", "<leader>bf", ":FormatLock<CR>")
vim.keymap.set("n", "<leader>ff", ":lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({}))<cr>")
vim.keymap.set("n", "<leader>bb", ":Telescope buffers<CR>")
