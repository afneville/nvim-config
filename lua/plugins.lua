-- bootstrap
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    execute(
        "!git clone https://github.com/wbthomason/packer.nvim " .. install_path
    )
    execute("packadd packer.nvim")
end
vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    use({ "wbthomason/packer.nvim" })
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("nvim-treesitter/nvim-treesitter-context")
    use({ "junegunn/fzf.vim" })
    use({ "lukas-reineke/indent-blankline.nvim" })
    use({ "nvim-tree/nvim-web-devicons" })
    use({ "akinsho/bufferline.nvim" })
    use({ "nvim-lualine/lualine.nvim" })
    use({ "lewis6991/gitsigns.nvim" })
    use({ "windwp/nvim-autopairs" })
    use({ "williamboman/mason.nvim" })
    use({ "williamboman/mason-lspconfig.nvim" })
    use({ "neovim/nvim-lspconfig" })
    use({ "kevinhwang91/nvim-bqf" })
    use({ "L3MON4D3/LuaSnip", run = "make install_jsregexp" })
    use({ "rafamadriz/friendly-snippets" })
    use({ "onsails/lspkind.nvim" })
    use({ "windwp/nvim-ts-autotag" })
    use({
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
        },
    })
    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })
    use({ "numToStr/Comment.nvim" })
    use({ "norcalli/nvim-colorizer.lua" })
    use({ "catppuccin/nvim", as = "catppuccin" })
    use({ "glepnir/lspsaga.nvim" })
    use({ "mhartington/formatter.nvim" })
end)
