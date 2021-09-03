vim.api.nvim_command "hi clear"
if vim.fn.exists "syntax_on" then
  vim.api.nvim_command "syntax reset"
end
vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "nord"

local util = require "colors.util"
Config = require "colors.config"
C = require "colors.nord.palette"
local highlights = require "colors.highlights"
local Treesitter = require "colors.Treesitter"
local markdown = require "colors.markdown"
local Whichkey = require "colors.Whichkey"
local Git = require "colors.Git"
local LSP = require "colors.LSP"

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
