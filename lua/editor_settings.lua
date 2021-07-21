local lua_utils = require('lua_utils')
vim.cmd('set iskeyword+=-')
vim.cmd('set shortmess+=c')
vim.cmd('set inccommand=split')
vim.o.hidden = true
vim.o.title = true
TERMINAL = vim.fn.expand('$TERMINAL')
vim.cmd('let &titleold="'..TERMINAL..'"')
vim.o.titlestring="%<%F%=%l/%L - nvim"
vim.wo.wrap = O.wrap_lines
vim.cmd('set whichwrap+=<,>,[,],h,l')
vim.cmd('syntax on')
vim.o.pumheight = 10
vim.o.fileencoding = "utf-8"
vim.o.cmdheight = 1
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.termguicolors = true
-- vim.o.t_Co = "256"
vim.o.conceallevel = 0
vim.cmd('set ts=4')
vim.cmd('set sw=4')
vim.cmd('set expandtab')
vim.bo.smartindent = true
vim.wo.number = O.number
vim.wo.relativenumber = O.relative_number
vim.wo.cursorcolumn = false
vim.wo.cursorline = true
vim.o.showtabline = 2
vim.o.showmode = false
vim.o.backup = false
vim.o.writebackup = false
vim.wo.signcolumn = "yes"
vim.o.updatetime = 300
vim.o.timeoutlen = O.timeoutlen
vim.o.clipboard = "unnamedplus"
vim.g.nvim_tree_disable_netrw = O.nvim_tree_disable_netrw
vim.g.loaded_netrwPlugin = 1
vim.cmd('filetype plugin on')

-- setting options with a wrapper function
-- eventually all options will be set like this
lua_utils.opt('o', 'sidescrolloff', 8)
lua_utils.opt('o', 'wrap', false)
lua_utils.opt('o', 'smartcase', true)
lua_utils.opt('o', 'sidescrolloff', 8)

-- gui fonts
-- vim.o.guifont = "JetBrainsMono\\ Nerd\\ Font\\ Mono:h18"
-- vim.o.guifont = "Hack\\ Nerd\\ Font\\ Mono"
-- vim.o.guifont = "SauceCodePro Nerd Font:h17"
vim.o.guifont = "FiraCode Nerd Font:h17"
