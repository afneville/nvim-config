vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    require('nvim-treesitter')
    local filetype = args.match
    local lang = vim.treesitter.language.get_lang(filetype)
    if vim.treesitter.language.add(lang) then
      vim.wo.foldmethod = "expr"
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      if filetype ~= "tex" and filetype ~= "latex" then
        vim.treesitter.start()
      end
    end
  end,
})

vim.opt.foldenable = true
vim.opt.foldlevelstart = 99
vim.opt.foldtext = ""

require("nvim-ts-autotag").setup()
