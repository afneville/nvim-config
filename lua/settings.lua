vim.opt.hidden = true
vim.opt.fileencoding = "utf-8"
vim.opt.termguicolors = true
vim.opt.pumheight = 10
vim.opt.cmdheight = 1
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.cursorcolumn = true
vim.opt.cursorline = true
vim.opt.conceallevel = 0
vim.opt.guicursor = "i:hor20"
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 300
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 8
vim.opt.wrap = false
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.showmode = false
vim.opt.list = true
vim.opt.listchars:append("space:·")
vim.opt.listchars:append("tab:› ")
vim.opt.colorcolumn = "72"
vim.opt.mouse = ""
vim.opt.tabstop = 4
vim.opt.sw = 4
vim.opt.expandtab = true
vim.opt.whichwrap = "<,>,[,]"
vim.opt.iskeyword:append("-")
vim.opt.shortmess:append("c")
vim.opt.inccommand = "split"
vim.g.netrw_banner = 0
vim.g.netrw_localcopydircmd = 'cp -r'
vim.g.netrw_keepdir = 0
vim.api.nvim_set_hl(0, "netrwMarkFile", { link = "Search" })

vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  callback = function()
    vim.cmd("norm zz")
  end,
})

function _G.get_active_statusline_content()
  return "%#StatusLineAccent# %#StatusLine# %f %M %=  %y   %l:%c   %p%% %#StatusLineAccent# %#StatusLine#"
end

function _G.get_inactive_statusline_content()
  return "%#StatusLineAccentNC# %#StatusLineNC# %f %M %= %y   %l:%c   %p%% %#StatusLineAccentNC# %#StatusLineNC#"
end

local statusline_augroup = vim.api.nvim_create_augroup("statusline", { clear = true })

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
  group = statusline_augroup,
  pattern = "*",
  callback = function()
    vim.cmd("setlocal statusline=%!v:lua.get_active_statusline_content()")
  end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
  group = statusline_augroup,
  pattern = "*",
  callback = function()
    vim.cmd("setlocal statusline=%!v:lua.get_inactive_statusline_content()")
  end,
})
