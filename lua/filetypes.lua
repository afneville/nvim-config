vim.cmd("filetype indent plugin on")

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

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.terraformrc", "*.terraform.rc", "*.hcl" },
  callback = function()
    vim.bo.filetype = "hcl"
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.tf", "*.tfvars" },
  callback = function()
    vim.bo.filetype = "terraform"
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.tfstate", "*.tfstate.backup" },
  callback = function()
    vim.bo.filetype = "json"
  end,
})

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

