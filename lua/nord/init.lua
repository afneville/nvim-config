vim.api.nvim_command "hi clear"
if vim.fn.exists "syntax_on" then
  vim.api.nvim_command "syntax reset"
end
vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "nord"

local util = require "nord.util"
Config = require "nord.config"
C = require "nord.palette"
local highlights = require "nord.highlights"
local Treesitter = require "nord.Treesitter"
local markdown = require "nord.markdown"
local Whichkey = require "nord.Whichkey"
local Git = require "nord.Git"
local LSP = require "nord.LSP"

local skeletons = {
  highlights,
  Treesitter,
  markdown,
  Whichkey,
  Git,
  LSP,
}

for _, skeleton in ipairs(skeletons) do
  util.initialise(skeleton)
end
