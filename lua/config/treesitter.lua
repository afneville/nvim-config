require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
    disable = { "haskell" },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<c-j>", -- set to `false` to disable one of the mappings
      node_incremental = "<c-j>",
      node_decremental = "<c-k>",
    },
  },
  indent = {
    enable = true,
    disable = { "python" },
  },
})

require("nvim-ts-autotag").setup()

vim.cmd([[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable
]])

require("treesitter-context").setup({
  enable = true,
  max_lines = 0,
  min_window_height = 0,
  line_numbers = true,
  multiline_threshold = 20,
  trim_scope = "outer",
  mode = "cursor",
  separator = "―",
  zindex = 20,
  on_attach = nil,
})
