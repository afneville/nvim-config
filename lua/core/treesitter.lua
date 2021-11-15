require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    ignore_install = {},
    matchup = {
        enable = true,
        disable = {},
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    context_commentstring = {
        enable = true,
        config = {
          css = '// %s'
        }
      },
    indent = {
        enable = false,
        disable = {}
    },
    autotag = {enable = true},
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = 1000,
    },
}
