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
--    use {'glepnir/lspsaga.nvim'}
--    use {
--        "kabouzeid/nvim-lspinstall",
--        opt = true,
--        config = function() require("core.nvim-lspinstall") end
--    }
    use {"kabouzeid/nvim-lspinstall"}
    use {'kevinhwang91/nvim-bqf', ft = 'qf'}
    require_plugin("kabouzeid/nvim-lspinstall")
--    require_plugin("glenpir/lspsaga.nvim")

end)
