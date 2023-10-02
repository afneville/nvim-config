return require("packer").startup(function(use)
    use({ "wbthomason/packer.nvim" })

    -- ui
    use({ "akinsho/bufferline.nvim" })
    use({ "nvim-lualine/lualine.nvim" })
    use("rebelot/kanagawa.nvim")
    use({ "ellisonleao/gruvbox.nvim" })
    use({ "projekt0n/github-nvim-theme" })
    use({ "shaunsingh/nord.nvim" })
    use({ "catppuccin/nvim", as = "catppuccin" })
    use({ "AlexvZyl/nordic.nvim" })

    -- general plugins
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    use({ "lukas-reineke/indent-blankline.nvim" })
    use({ "junegunn/fzf" })
    use({ "junegunn/fzf.vim" })
    use({ "WhoIsSethDaniel/mason-tool-installer.nvim" })
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update =
                require("nvim-treesitter.install").update({
                    with_sync = true,
                })
            ts_update()
        end,
    })
    use({ "nvim-treesitter/nvim-treesitter-context" })
    use({ "tpope/vim-surround" })
    use({ "lewis6991/gitsigns.nvim" })
    use({ "numToStr/Comment.nvim" })
    use({ "norcalli/nvim-colorizer.lua" })
    use({
        "lukas-reineke/headlines.nvim",
        after = "nvim-treesitter",
    })

    -- lsp / completion
    use("mfussenegger/nvim-jdtls")
    use({
        "glepnir/lspsaga.nvim",
        requires = {
            { "nvim-tree/nvim-web-devicons" },
            { "nvim-treesitter/nvim-treesitter" },
        },
    })
    use({ "windwp/nvim-autopairs" })
    use({ "williamboman/mason.nvim" })
    use({ "williamboman/mason-lspconfig.nvim" })
    use({ "neovim/nvim-lspconfig" })
    use({ "kevinhwang91/nvim-bqf" })
    use({ "folke/trouble.nvim" })
    use({ "L3MON4D3/LuaSnip", run = "make install_jsregexp" })
    -- use({ "lervag/vimtex" })
    use({
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "onsails/lspkind.nvim",
        },
    })
    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })
    if Options.bootstrap then
        print("start packer bootstrap")
        require("packer").sync()
        print("finish packer bootstrap")
    end
end)
