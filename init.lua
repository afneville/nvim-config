require("settings")
require("mappings")

local packer_bootstrap = require("utils").ensure_packer()
require("plugins")
if (packer_bootstrap == false) then
    require("config")
end

vim.cmd("hi markdownError guifg=None guibg=None")
vim.cmd("hi clear Error")

vim.cmd("autocmd! FileType markdown set spell")
vim.cmd([[
augroup text_width | au!
    au Filetype text,markdown setlocal textwidth=72
    au FileType markdown setlocal spell
augroup END
]])
