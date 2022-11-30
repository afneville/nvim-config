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
        run = ':TSUpdate'
    }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' },
    }
    use {
        'junegunn/fzf.vim'
    }
    use {
        "lukas-reineke/indent-blankline.nvim",
    }
    use {
        'akinsho/bufferline.nvim',
        requires = 'nvim-tree/nvim-web-devicons',
    }
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    }
    use {
      'lewis6991/gitsigns.nvim',
    }
    use {
    	"windwp/nvim-autopairs",
    }
    use {
        "L3MON4D3/LuaSnip",
        config = function()
            require("luasnip.loaders.from_lua").lazy_load()
            require("luasnip.loaders.from_vscode").lazy_load {}
            require("luasnip.loaders.from_snipmate").lazy_load()
        end,
    }
    use {
        "rafamadriz/friendly-snippets"
    }
    use {'neovim/nvim-lspconfig' }
    use {"ray-x/lsp_signature.nvim", config = require("lsp_signature").setup() }
    use {
        "williamboman/mason.nvim",
        requires = { "williamboman/mason-lspconfig.nvim" }
    }
    use {
        "hrsh7th/nvim-cmp",
        requires = {
             "neovim/nvim-lspconfig",
             -- "hrsh7th/cmp-nvim-lsp-signature-help",
             "hrsh7th/cmp-nvim-lsp",
             "hrsh7th/cmp-buffer",
             "hrsh7th/cmp-path",
             "hrsh7th/cmp-cmdline",
        }
    }
    use {
        "onsails/lspkind.nvim"
    }
    use {'kevinhwang91/nvim-bqf' }
end)
