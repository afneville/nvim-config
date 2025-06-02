local function safeRequire(module)
  local success, req = pcall(require, module)
  if success then
    return req
  end
  print("Module " .. module .. " contains error")
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- treesitter
    {
      'nvim-treesitter/nvim-treesitter',
      lazy = false,
      branch = 'main',
      build = ':TSUpdate',
      config = function()
        safeRequire("config.treesitter")
      end,
      dependencies = { "nvim-treesitter/nvim-treesitter-context",
      "windwp/nvim-ts-autotag" }
    },
    { "nvim-treesitter/nvim-treesitter-context", lazy = false },
    { "windwp/nvim-ts-autotag", lazy = false },
    { "windwp/nvim-autopairs" },

    -- themes
    { "rebelot/kanagawa.nvim", config = function()
      safeRequire("config.kanagawa")
    end},

    { "ellisonleao/gruvbox.nvim", enabled = false},
    { "catppuccin/nvim", name = "catppuccin", enabled = false },

    --tools
    {
      'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim', { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', lazy = false } }
    },
    { "nvim-lualine/lualine.nvim", enabled = false },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = require "config.indentblankline" },
    { "norcalli/nvim-colorizer.lua", opts = { "!*" } },
    { "lewis6991/gitsigns.nvim", opts = require "config.gitsigns" },
    { "kevinhwang91/nvim-bqf", enabled = false },
    { "folke/trouble.nvim", enabled = false },
    { "numToStr/Comment.nvim", opts = { } },
    { "tpope/vim-surround", enabled = false },

    -- ft and lsp
    { "preservim/vim-markdown" },
    { "neovim/nvim-lspconfig" },
    { "mhartington/formatter.nvim" },
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp"
    },
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
      },
    },
  },
  install = { missing = false }
})

safeRequire("config.lsp")
safeRequire("config.formatter")
safeRequire("config.autopairs")
safeRequire("config.luasnip")
safeRequire("config.telescope")
