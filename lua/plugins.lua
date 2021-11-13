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

return require("packer").startup(function(use)

    use "wbthomason/packer.nvim"

    use {"neovim/nvim-lspconfig", opt = true}
    use {"glepnir/lspsaga.nvim", opt = true}
    use {"kabouzeid/nvim-lspinstall", opt = true}
    -- use {"nvim-lua/popup.nvim", opt = true}
    use {"nvim-lua/plenary.nvim", opt = true}
    use {"hrsh7th/nvim-compe", opt = true}
    use {"nvim-treesitter/nvim-treesitter", opt = true}
    use {'andymass/vim-matchup', opt = true}
    use {"folke/which-key.nvim", opt = true}
    use {"lewis6991/gitsigns.nvim", opt = true}
    use {"windwp/nvim-autopairs", opt = true}
    use {"terrortylor/nvim-comment", opt = true}
    use {'JoosepAlviste/nvim-ts-context-commentstring', opt = true}
    use {"kyazdani42/nvim-web-devicons", opt = true}
    -- use {"glepnir/galaxyline.nvim", opt= true}
    use {'nvim-treesitter/playground', opt = true}
    use { 'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
    use {'junegunn/fzf.vim'}
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require'nvim-tree'.setup {} end
    }


    require_plugin("nvim-lspconfig")
    require_plugin("lspsaga.nvim")
    require_plugin("nvim-lspinstall")
    -- require_plugin("popup.nvim")
    require_plugin("plenary.nvim")
    require_plugin("nvim-compe")
    require_plugin("nvim-treesitter")
    require_plugin('vim-matchup')
    require_plugin("gitsigns.nvim")
    require_plugin("which-key.nvim")
    require_plugin("nvim-autopairs")
    require_plugin("nvim-comment")
    require_plugin("nvim-bqf")
    require_plugin("nvim-web-devicons")
    -- require_plugin("galaxyline.nvim")
    require_plugin('nvim-colorizer.lua')
    require_plugin('playground')
    require_plugin("nvim-tree")

end)
