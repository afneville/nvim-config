local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use "morhetz/gruvbox"
    use "nvim-treesitter/nvim-treesitter"
    use 'junegunn/fzf.vim'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use "ray-x/lsp_signature.nvim"
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-omni'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'onsails/lspkind-nvim'
    use 'L3MON4D3/LuaSnip'
    use 'windwp/nvim-autopairs'
    use 'glepnir/lspsaga.nvim'
    use 'glepnir/zephyr-nvim'
    use 'mhartington/oceanic-next'
    use 'navarasu/onedark.nvim'
    use 'Mofiqul/vscode.nvim'
    use 'eddyekofo94/gruvbox-flat.nvim'
    use 'shaunsingh/nord.nvim'
    use 'hrsh7th/vim-vsnip'
    use 'saadparwaiz1/cmp_luasnip' 
    use 'lervag/vimtex'
    use 'KeitaNakamura/tex-conceal.vim'
    -- use 'lukas-reineke/indent-blankline.nvim'
    use {
        'kevinhwang91/nvim-bqf',
        ft = 'qf'
    }
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {}
      end
    }
    -- use {
    --     'glepnir/galaxyline.nvim',
    --     branch = 'main',
    --     requires = {'kyazdani42/nvim-web-devicons', opt = true}
    -- }
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    -- use {
    --     'kyazdani42/nvim-tree.lua',
    --     requires = 'kyazdani42/nvim-web-devicons',
    --     config = function() require'nvim-tree'.setup {} end
    -- }
end)
