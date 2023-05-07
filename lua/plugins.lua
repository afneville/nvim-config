-- local ensure_packer = function()
--   local fn = vim.fn
--   local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
--   if fn.empty(fn.glob(install_path)) > 0 then
--     fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
--     vim.cmd [[packadd packer.nvim]]
--     return true
--   end
--   return false
-- end
-- local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
    use({ "wbthomason/packer.nvim" })

    -- ui
    -- use({ "akinsho/bufferline.nvim" })
    -- use({ "romgrk/barbar.nvim", requires = "nvim-tree/nvim-web-devicons" })
    use({ "nvim-lualine/lualine.nvim" })

    -- general plugins
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    use({ "junegunn/fzf" })
    use({ "junegunn/fzf.vim" })
    use({ "WhoIsSethDaniel/mason-tool-installer.nvim" })
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update =
                require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    })

    use({ "tpope/vim-surround" })
    use({ "lukas-reineke/indent-blankline.nvim" })
    use({ "nvim-tree/nvim-web-devicons" })
    use({ "lewis6991/gitsigns.nvim" })
    use({ "numToStr/Comment.nvim" })
    use({ "norcalli/nvim-colorizer.lua" })
    use({ "catppuccin/nvim", as = "catppuccin" })
    use({ "ellisonleao/gruvbox.nvim" })
    use("navarasu/onedark.nvim")
    use({ "projekt0n/github-nvim-theme", tag = "v0.0.7" })
    use({ "mhartington/formatter.nvim" })

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
    use({ "rafamadriz/friendly-snippets" })
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
    use({ "glepnir/lspsaga.nvim" })
    if Options.bootstrap then
        print("start packer bootstrap")
        require("packer").sync()
        print("finish packer bootstrap")
    end
end)
