local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

    local plugin_path = plugin_prefix .. plugin .. "/"
    --	print('test '..plugin_path)
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    --	print(ok, err, code)
    if ok then vim.cmd("packadd " .. plugin) end
    return ok, err, code
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use {'wbthomason/packer.nvim'}
    use {"morhetz/gruvbox"}
    use {"nvim-treesitter/nvim-treesitter"}
    use {'junegunn/fzf.vim'}
    use {'neovim/nvim-lspconfig'}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-path'}
    use {'hrsh7th/cmp-omni'}
    use {'hrsh7th/cmp-cmdline'}
    use {'hrsh7th/nvim-cmp'}
    use {'L3MON4D3/LuaSnip'}
    use {'windwp/nvim-autopairs'}
    use {'glepnir/lspsaga.nvim'}
    use {'glepnir/zephyr-nvim'}
    use {'mhartington/oceanic-next'}
    use {'navarasu/onedark.nvim'}
    use {'kevinhwang91/nvim-bqf', ft = 'qf'}
    use {'shaunsingh/nord.nvim'}
    use {'hrsh7th/vim-vsnip'}
    use {'saadparwaiz1/cmp_luasnip' }
    use {'SirVer/ultisnips'}
    use {'lervag/vimtex'}
    use {'KeitaNakamura/tex-conceal.vim'}
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require'nvim-tree'.setup {} end
    }
    -- Lua
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }
    use {'onsails/lspkind-nvim'}
    require_plugin("glepnir/lspsaga")
end)
