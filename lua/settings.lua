vim.opt.hidden = true
vim.opt.fileencoding = "utf-8"
vim.opt.termguicolors = true
vim.opt.pumheight = 10
vim.opt.cmdheight = 1
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.showtabline = 0
-- vim.opt.showmode = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.cursorcolumn = true
vim.opt.cursorline = true
vim.opt.conceallevel = 0
vim.opt.guicursor = ""
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
vim.opt.list = true
vim.opt.listchars:append("space:󰧟")
-- vim.opt.listchars:append "eol:↴"
-- vim.opt.listchars:append("eol:󰌑")
-- vim.opt.listchars:append "eol:󱞥"

vim.cmd("set colorcolumn=72")
vim.cmd("set t_md=")
vim.cmd("filetype plugin on")
vim.cmd("set mouse=")
vim.cmd("set ts=4")
vim.cmd("set sw=4")
vim.cmd("set expandtab")
vim.cmd("autocmd Filetype javascript setlocal ts=2 sw=2 expandtab")
vim.cmd("autocmd Filetype html setlocal ts=2 sw=2 expandtab")
vim.cmd("autocmd Filetype css setlocal ts=2 sw=2 expandtab")
vim.cmd("autocmd Filetype scss setlocal ts=2 sw=2 expandtab")
vim.cmd("set whichwrap=<,>,[,]")
vim.cmd("set iskeyword+=-")
-- vim.cmd("set iskeyword-=_")
vim.cmd("set shortmess+=c")
vim.cmd("set inccommand=split")
vim.cmd("let g:fzf_preview_window = ['right:40%:hidden', 'ctrl-/']")
vim.cmd("let g:fzf_layout = { 'down': '~30%' }")
vim.cmd("autocmd InsertEnter * norm zz")
vim.cmd("autocmd! FileType fzf setlocal nonumber norelativenumber")
vim.cmd("autocmd! FileType qf setlocal nonumber norelativenumber")
vim.cmd(
    "autocmd! FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }"
)

-- vim.cmd([[
-- let g:netrw_banner = 0
-- let g:netrw_localcopydircmd = 'cp -r'
-- let g:netrw_keepdir = 0
-- hi! link netrwMarkFile Search
-- function! NetrwMapping()
-- endfunction
-- augroup netrw_mapping
--   autocmd!
--   autocmd filetype netrw call NetrwMapping()
-- augroup END
-- function! NetrwMapping()
--   nmap <buffer> H u
--   nmap <buffer> h -^
--   nmap <buffer> l <CR>
--   nmap <buffer> . gh
--   nmap <buffer> P <C-w>z
--   nmap <buffer> L <CR>:Lexplore<CR>
--   nmap <buffer> <Leader>dd :Lexplore<CR>
--   nmap <buffer> fc %:w<CR>:buffer #<CR>
-- endfunction
-- ]])

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

Options = {
    error = " ",
    warn = " ",
    info = " ",
    hint = "󰌶 ",
    added = " ",
    modified = " ",
    removed = " ",
}

vim.cmd([[
set laststatus=2
set statusline=
set statusline+=%{b:gitbranch}
set statusline+=%f
set statusline+=\ 
set statusline+=%m
set statusline+=%=
set statusline+=%l
set statusline+=:
set statusline+=%c
set statusline+=\ 
set statusline+=/
set statusline+=\ 
set statusline+=%L
set statusline+=\ 
set statusline+=%y

function! StatuslineGitBranch()
  let b:gitbranch=""
  if &modifiable
    try
      let l:dir=expand('%:p:h')
      let l:gitrevparse = system("git -C ".l:dir." rev-parse --abbrev-ref HEAD")
      if !v:shell_error
        let b:gitbranch="(".substitute(l:gitrevparse, '\n', '', 'g').") "
      endif
    catch
    endtry
  endif
endfunction

augroup GetGitBranch
  autocmd!
  autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
augroup END
]])
