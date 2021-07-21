-- vim.cmd('let g:nvcode_termcolors=256')

local base16 = require('base16')

base16(base16.themes[O.colorscheme], true)
require('highlights')
