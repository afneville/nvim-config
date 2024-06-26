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
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
  trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = "―",
  zindex = 20, -- The Z-index of the context window
  on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
})
