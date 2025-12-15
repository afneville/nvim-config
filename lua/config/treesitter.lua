require("nvim-treesitter").install({
  "asm",
  "bash",
  "cmake",
  "cpp",
  "css",
  "csv",
  "c",
  "diff",
  "dot",
  "dockerfile",
  "gitcommit",
  "gitignore",
  "git_config",
  "git_rebase",
  "gnuplot",
  "go",
  "goctl",
  "gomod",
  "gosum",
  "gpg",
  "graphql",
  "hcl",
  "http",
  "ini",
  "java",
  "javascript",
  "jq",
  "json",
  "json5",
  "kotlin",
  "latex",
  "lua",
  "luadoc",
  "make",
  "markdown",
  "markdown_inline",
  "nasm",
  "nix",
  "php",
  "promql",
  "python",
  "proto",
  "rst",
  "sql",
  "ssh_config",
  "strace",
  "terraform",
  "html",
  "svelte",
  "sway",
  "tmux",
  "toml",
  "tsx",
  "typescript",
  "udev",
  "vim",
  "yaml",
  "xresources",
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local filetype = args.match
    local lang = vim.treesitter.language.get_lang(filetype)
    if vim.treesitter.language.add(lang) then
      vim.wo.foldmethod = "expr"
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

      -- Disable treesitter highlighting for LaTeX files
      if filetype ~= "tex" and filetype ~= "latex" then
        vim.treesitter.start()
      end
    end
  end,
})

-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true
vim.opt.foldlevelstart = 99
vim.opt.foldtext = ""

require("nvim-ts-autotag").setup()

-- require("treesitter-context").setup({
--   enable = true,
--   max_lines = 0,
--   min_window_height = 0,
--   line_numbers = true,
--   multiline_threshold = 20,
--   trim_scope = "outer",
--   mode = "cursor",
--   separator = "─",
--   zindex = 20,
--   on_attach = nil,
-- })
