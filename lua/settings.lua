vim.opt.hidden = true
vim.opt.fileencoding = "utf-8"
vim.opt.termguicolors = true
vim.opt.pumheight = 10
vim.opt.cmdheight = 1
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.showtabline = 2
vim.opt.showmode = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.cursorcolumn = false
vim.opt.cursorline = true
vim.opt.conceallevel = 0
-- vim.opt.guicursor = ""
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 300
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 8
vim.opt.wrap = false
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.smartindent = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.cmd("set t_md=")
vim.cmd("filetype plugin on")
vim.cmd("set mouse=nicr")
vim.cmd("set ts=4")
vim.cmd("set sw=4")
vim.cmd("set expandtab")
vim.cmd("autocmd Filetype javascript setlocal ts=2 sw=4 expandtab")
vim.cmd("autocmd Filetype html setlocal ts=2 sw=2 expandtab")
vim.cmd("autocmd Filetype css setlocal ts=2 sw=2 expandtab")
vim.cmd("set whichwrap=<,>,[,]")
vim.cmd("set iskeyword+=-") -- vim.cmd("set iskeyword-=_")
vim.cmd("set shortmess+=c")
vim.cmd("set inccommand=split")
vim.cmd("let g:fzf_preview_window = ['right:40%:hidden', 'ctrl-/']")
vim.cmd("let g:fzf_layout = { 'down': '~30%' }")
vim.cmd("autocmd InsertEnter * norm zz")
