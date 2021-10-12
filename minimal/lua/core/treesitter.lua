require'nvim-treesitter.configs'.setup {
    ensure_installed = O.treesitter.ensure_installed,
    ignore_install = O.treesitter.ignore_install,
    matchup = {
        enable = true,              -- mandatory, false will disable the whole extension
        -- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
    },
    highlight = {
        enable = O.treesitter.highlight.enabled, 
        additional_vim_regex_highlighting = true,
    },
    context_commentstring = {
        enable = true,
        config = {
          css = '// %s'
        }
      },
    indent = {enable = true, disable = {}},
    -- TODO seems to be broken
    autotag = {enable = true},
    rainbow = {
      enable = true,
      extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
      max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
    },
}

