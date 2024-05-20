require("settings")
require("mappings")

local packer_bootstrap = require("utils").ensure_packer()
require("plugins")
if (packer_bootstrap == false) then
    require("config")
end

vim.cmd("hi clear markdownError")
vim.cmd("hi clear Error")
