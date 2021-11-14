vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use {"morhetz/gruvbox"}
    use {"nvim-treesitter/nvim-treesitter"}
    use {'junegunn/fzf.vim'}
    use {'neovim/nvim-lspconfig'}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-path'}
    use {'hrsh7th/cmp-cmdline'}
    use {'saadparwaiz1/cmp_luasnip' }
    use {'hrsh7th/nvim-cmp'}
    use {'L3MON4D3/LuaSnip'}
    use {'windwp/nvim-autopairs'}
end)
