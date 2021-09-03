local lua_utils = require('lua_utils')
vim.cmd('set iskeyword+=-')
vim.cmd('set shortmess+=c')
vim.cmd('set inccommand=split')
vim.o.hidden = true -- allow multiple buffers
vim.o.title = true
TERMINAL = vim.fn.expand('$TERMINAL')
vim.cmd('let &titleold="'..TERMINAL..'"')
-- vim.o.titlestring="%<%F%=%l/%L - nvim"
vim.wo.wrap = O.wrap_lines -- Display long lines as just one line
vim.cmd('set whichwrap+=<,>,[,],h,l') -- move to next line with theses keys
vim.cmd('syntax on') -- syntax highlighting
vim.o.pumheight = 10 -- Makes popup menu smaller
vim.o.fileencoding = "utf-8" -- The encoding written to file
vim.o.cmdheight = 1
-- vim.cmd('set colorcolumn=99999') -- fix indentline for now
-- vim.o.mouse = "a" -- Enable your mouse
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.splitright = true -- Vertical splits will automatically be to the right
vim.o.termguicolors = true -- set term gui colors most terminals support this
vim.o.conceallevel = 0 -- So that I can see `` in markdown files
vim.cmd('set ts=4') -- Insert 2 spaces for a tab
vim.cmd('set sw=4') -- Change the number of space characters inserted for indentation
vim.cmd('set expandtab') -- Converts tabs to spaces
vim.bo.smartindent = true -- Makes indenting smart
vim.wo.number = O.number -- set numbered lines
vim.wo.relativenumber = O.relative_number -- set relative number
vim.wo.cursorcolumn = false
vim.wo.cursorline = true -- Enable highlighting of the current line
vim.o.showtabline = 2 -- Always show the tab bar
vim.o.showmode = false -- Do not show current mode in the command area
vim.o.backup = false -- Recommended by coc
vim.o.writebackup = false -- Recommended by coc
vim.wo.signcolumn = "yes" -- Always show the signcolumn
vim.o.updatetime = 300 -- Faster completion
vim.o.timeoutlen = O.timeoutlen -- By default timeoutlen is 1000 ms
vim.o.clipboard = "unnamedplus" -- Copy paste between vim and everything else
vim.g.nvim_tree_disable_netrw = O.nvim_tree_disable_netrw -- enable netrw for remote gx gf support (must be set before plugin's packadd)
vim.g.loaded_netrwPlugin = 1 -- needed for netrw gx command to open remote links in browser
vim.cmd('filetype plugin on') -- filetype detection
vim.cmd('let g:nvcode_termcolors=256')
vim.cmd('colorscheme ' .. O.colorscheme)

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
