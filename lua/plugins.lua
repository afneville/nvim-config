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
    {
      'nvim-treesitter/nvim-treesitter',
      lazy = false,
      branch = 'main',
      build = ':TSUpdate'
    },
    { "nvim-treesitter/nvim-treesitter-context" },
    { "windwp/nvim-ts-autotag" },
    { "windwp/nvim-autopairs" },
    -- telescope
    {
      'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim', { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', lazy = false } }
    },
    { "rebelot/kanagawa.nvim" },
    { "ellisonleao/gruvbox.nvim", enabled = false},
    { "catppuccin/nvim", name = "catppuccin", enabled = false },
    { "nvim-lualine/lualine.nvim", enabled = false },
    { "preservim/vim-markdown" },
    { "lukas-reineke/indent-blankline.nvim" },
    { "mhartington/formatter.nvim" },
    { "tpope/vim-surround", enabled = false },
    { "lewis6991/gitsigns.nvim" },
    { "numToStr/Comment.nvim" },
    { "norcalli/nvim-colorizer.lua" },
    { "neovim/nvim-lspconfig" },
    { "kevinhwang91/nvim-bqf" },
    { "folke/trouble.nvim" },
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

local function safeRequire(module)
  local success, req = pcall(require, module)
  if success then
    return req
  end
  print("Module " .. module .. " contains error")
end

safeRequire("config.kanagawa")
safeRequire("config.bqf")
safeRequire("config.trouble")
safeRequire("config.lsp")
safeRequire("config.formatter")
safeRequire("config.autopairs")
safeRequire("config.luasnip")
safeRequire("config.treesitter")
safeRequire("config.indentblankline")
safeRequire("config.gitsigns")
safeRequire("config.comment")
safeRequire("config.colorizer")
safeRequire("config.telescope")
