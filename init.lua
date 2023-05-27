require("settings")
require("mappings")

-- ensure packer is installed
local packer_bootstrap = require("utils").ensure_packer()
require("plugins")

-- do not load plugin config during installation
if (packer_bootstrap == false) then
    require("config")
end

vim.cmd("hi markdownError guifg=None guibg=None")
