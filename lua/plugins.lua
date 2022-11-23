-- bootstrap
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end
vim.cmd "autocmd BufWritePost plugins.lua PackerCompile"
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = require("config.treesitter")
    }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = require("config.nvimtree")
    }
    use {
        'junegunn/fzf.vim'
    }
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = require("config.indentblankline")
    }
    use {
        'akinsho/bufferline.nvim', 
        requires = 'nvim-tree/nvim-web-devicons',
        config = require("config.bufferline")
    }
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = require("config.lualine")
    }
    use {
      'lewis6991/gitsigns.nvim',
      config = require("config.gitsigns")
    }
end)
