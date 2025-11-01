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
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
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

    -- themes
    {
      "rebelot/kanagawa.nvim",
      config = function()
        safeRequire("config.kanagawa")
      end,
      enabled = false,
    },
    { "ellisonleao/gruvbox.nvim", enabled = false },
    {
      "catppuccin/nvim",
      name = "catppuccin",
      config = function()
        safeRequire("config.catppuccin")
      end,
      enabled = false,
    },

    --tools
    {
      "nvim-telescope/telescope.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
        {
          "nvim-telescope/telescope-fzf-native.nvim",
          build = "make",
          lazy = false,
        },
      },
      config = function()
        safeRequire("config.telescope")
      end,
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      opts = require("config.indentblankline"),
    },
    { "norcalli/nvim-colorizer.lua", opts = { "!*" }, enabled = false },
    {
      "lewis6991/gitsigns.nvim",
      opts = require("config.gitsigns"),
    },
    { "numToStr/Comment.nvim", opts = {} },
    { "tpope/vim-surround", enabled = false },
    {
      "folke/trouble.nvim",
      opts = require("config.trouble"),
      enabled = false,
    },
    {
      "windwp/nvim-autopairs",
      config = function()
        safeRequire("config.autopairs")
      end,
    },

    -- treesitter tools
    {
      "nvim-treesitter/nvim-treesitter",
      lazy = false,
      branch = "main",
      build = ":TSUpdate",
      config = function()
        safeRequire("config.treesitter")
      end,
      dependencies = {
        "windwp/nvim-ts-autotag",
      },
    },
    { "nvim-treesitter/nvim-treesitter-context", lazy = false, enabled = false },
    { "windwp/nvim-ts-autotag", lazy = false },

    -- lsp,linting and formatting
    { "preservim/vim-markdown", enabled = false },
    { "neovim/nvim-lspconfig" },
    { "folke/neodev.nvim", opts = {} },
    { "artemave/workspace-diagnostics.nvim", opts = {} },
    { "mhartington/formatter.nvim", enabled = false },
    {
      "stevearc/conform.nvim",
      config = function()
        safeRequire("config.conform")
      end,
    },
    {
      "nvimdev/lspsaga.nvim",
      opts = {},
      enabled = false,
    },
    {
      "folke/noice.nvim",
      dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
      },
      config = function ()
        safeRequire("config.noice")
      end,
      enabled = false,
    },

    -- completion and snippets
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
      config = function()
        safeRequire("config.luasnip")
      end,
    },
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
        "onsails/lspkind.nvim",
      },
      config = function()
        require("config.cmp")
      end,
      enabled = false,
    },
    {
      "saghen/blink.cmp",
      config = function()
        require("config.blink")
      end,
      version = "1.*",
    },

    -- AI
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "InsertEnter",
      config = function()
        require("config.copilot")
      end,
      enabled = false,
    },
    { "fang2hou/blink-copilot", enabled = false },
    {
      "zbirenbaum/copilot-cmp",
      dependencies = { "zbirenbaum/copilot.lua", "hrsh7th/nvim-cmp" },
      opts = {},
      enabled = false,
    },
    {
      "CopilotC-Nvim/CopilotChat.nvim",
      dependencies = {
        { "github/copilot.lua" },
        { "nvim-lua/plenary.nvim" },
      },
      build = "make tiktoken",
      config = function()
        require("config.copilotchat")
      end,
      enabled = false,
    },
  },
  install = { missing = true },
})
