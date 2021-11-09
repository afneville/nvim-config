vim.o.hidden = true
vim.o.title = true
TERMINAL = vim.fn.expand('$TERMINAL')
-- vim.o.titlestring="%<%F%=%l/%L - nvim"
vim.wo.wrap = O.wrap_lines
vim.o.pumheight = 10
vim.o.fileencoding = "utf-8"
vim.o.cmdheight = 1
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.conceallevel = 0
vim.bo.smartindent = true
vim.wo.number = O.number
vim.wo.relativenumber = O.relative_number
vim.wo.cursorcolumn = false
vim.wo.cursorline = false
vim.o.showtabline = 0
vim.o.showmode = false
vim.o.backup = false
vim.o.writebackup = false
vim.wo.signcolumn = "yes"
vim.o.updatetime = 300
vim.o.timeoutlen = O.timeoutlen
vim.o.clipboard = "unnamedplus"
-- vim.g.loaded_netrwPlugin = 1
vim.o.sidescrolloff = 8
vim.o.wrap = false
vim.o.smartcase = true

vim.cmd('let g:nvim_termcolors=256')
vim.cmd('filetype plugin on')
vim.cmd('syntax on')
vim.cmd('colorscheme onedark')
vim.cmd('set ts=4')
vim.cmd('set sw=4')
vim.cmd('set expandtab')
vim.cmd('set whichwrap=<,>,[,]') -- move to next line with theses keys
vim.cmd('set iskeyword+=-')
vim.cmd('set shortmess+=c')
vim.cmd('set inccommand=split')
vim.cmd('let &titleold="'..TERMINAL..'"')


vim.cmd("let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']")
-- vim.cmd("let g:fzf_prefer_tmux = 1")
vim.cmd("let g:fzf_layout = { 'right': '~40%' }")
