vim.o.hidden = true
vim.o.title = true
-- vim.wo.wrap = O.wrap_lines
vim.o.pumheight = 10
vim.o.fileencoding = "utf-8"
vim.o.cmdheight = 1
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.conceallevel = 0
vim.bo.smartindent = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorcolumn = false
vim.wo.cursorline = true
vim.wo.signcolumn = "yes"
vim.o.showtabline = 2
vim.o.showmode = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 300
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- vim.o.timeoutlen = O.timeoutlen
-- vim.o.clipboard = "unnamedplus"
vim.o.sidescrolloff = 8
vim.o.wrap = false
vim.o.smartcase = true
vim.cmd('set t_md=')
-- vim.cmd('let g:nvim_termcolors=256')
vim.cmd('filetype plugin on')
vim.cmd('set mouse=nicr')
vim.cmd('set ts=4')
vim.cmd('set sw=4')
vim.cmd('set expandtab')
vim.cmd('set whichwrap=<,>,[,]')
vim.cmd('set iskeyword+=-')
vim.cmd('set iskeyword-=_')
vim.cmd('set shortmess+=c')
vim.cmd('set inccommand=split')
vim.cmd('colorscheme b16-gruvbox-material-dark-hard')
vim.cmd("let g:fzf_preview_window = ['right:40%:hidden', 'ctrl-/']")
-- vim.cmd("let g:fzf_prefer_tmux = 1")
vim.cmd("let g:fzf_layout = { 'down': '~30%' }")
-- vim.cmd("set statusline=\\ %F%m%r%h\\ %w\\ \\ CWD:\\ %r%{getcwd()}%h\\ %=\\ \\ Line:\\ %l\\ \\ Column:\\ %c\\ ")
