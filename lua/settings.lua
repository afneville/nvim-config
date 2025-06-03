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

-- Extension Options
vim.cmd("let g:vimtex_view_method = 'zathura_simple'")
vim.cmd("let g:fzf_preview_window = ['right:40%:hidden', 'ctrl-/']")
vim.cmd("let g:fzf_layout = { 'down': '~30%' }")

-- Filetypes
vim.cmd("let g:vim_markdown_math = 1")
vim.cmd("let g:vim_markdown_frontmatter = 1")
vim.cmd("set colorcolumn=72")
vim.cmd("set t_md=")
vim.cmd("filetype plugin on")
vim.cmd("filetype indent on")
vim.cmd("set mouse=")
vim.cmd("set ts=4")
vim.cmd("set sw=4")
vim.cmd("set expandtab")
vim.cmd("autocmd Filetype man setlocal nocursorcolumn")
vim.cmd("autocmd Filetype javascript setlocal ts=2 sw=2 expandtab")
vim.cmd("autocmd Filetype html setlocal ts=2 sw=2 expandtab")
vim.cmd("autocmd Filetype css setlocal ts=2 sw=2 expandtab")
vim.cmd("autocmd Filetype scss setlocal ts=2 sw=2 expandtab")
vim.cmd("autocmd Filetype json setlocal ts=2 sw=2 expandtab")
vim.cmd("autocmd Filetype tex setlocal ts=2 sw=2 expandtab")
vim.cmd("autocmd Filetype typescriptreact setlocal ts=2 sw=2 expandtab")
vim.cmd("autocmd Filetype typescript setlocal ts=2 sw=2 expandtab")
vim.cmd("autocmd Filetype lua setlocal ts=2 sw=2 expandtab")
vim.cmd("autocmd Filetype go setlocal noexpandtab")
vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd(
  [[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]]
)
vim.cmd(
  [[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]]
)
vim.cmd(
  [[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]]
)

vim.cmd("set whichwrap=<,>,[,]")
vim.cmd("set iskeyword+=-")
vim.cmd("set shortmess+=c")
vim.cmd("set inccommand=split")
vim.cmd("autocmd InsertEnter * norm zz")
vim.cmd("autocmd! FileType fzf setlocal nonumber norelativenumber")
vim.cmd("autocmd! FileType qf setlocal nonumber norelativenumber")
vim.cmd(
  "autocmd! FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }"
)

vim.cmd("autocmd! FileType markdown set spell")
vim.cmd([[
augroup text_width | au!
    au Filetype text,markdown setlocal textwidth=72
    au FileType markdown setlocal spell
augroup END
]])
vim.cmd("autocmd Filetype markdown setlocal ts=2 sw=2 expandtab")

vim.cmd([[
let g:netrw_banner = 0
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_keepdir = 0
hi! link netrwMarkFile Search
function! NetrwMapping()
endfunction
augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END
function! NetrwMapping()
  nmap <buffer> H u
  nmap <buffer> h -^
  nmap <buffer> l <CR>
  nmap <buffer> . gh
  nmap <buffer> P <C-w>z
  nmap <buffer> L <CR>:Lexplore<CR>
  nmap <buffer> <Leader>dd :Lexplore<CR>
  nmap <buffer> fc %:w<CR>:buffer #<CR>
endfunction
]])

function _G.get_active_statusline_content()
  return "%#StatusLineAccent# %#StatusLine# %f %M %=  %y   %l:%c   %p%% %#StatusLineAccent# %#StatusLine#"
end

function _G.get_inactive_statusline_content()
  return "%#StatusLineAccentNC# %#StatusLineNC# %f %M %= %y   %l:%c   %p%% %#StatusLineAccentNC# %#StatusLineNC#"
end

vim.cmd([[
augroup statusline
    autocmd!
    autocmd WinEnter,BufEnter * setlocal statusline=%!v:lua.get_active_statusline_content()
    autocmd WinLeave,BufLeave * setlocal statusline=%!v:lua.get_inactive_statusline_content()
augroup end
]])

Options = {
  error = "E",
  warn = "W",
  info = "I",
  hint = "H",
  added = "+",
  modified = "~",
  removed = "-",
}
