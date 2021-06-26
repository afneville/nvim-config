require'nvim-treesitter.configs'.setup {
    ensure_installed = Global.treesitter.ensure_installed, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = Global.treesitter.ignore_install,
    matchup = {
        enable = true,              -- mandatory, false will disable the whole extension
        -- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
    },
    highlight = {
        enable = Global.treesitter.highlight.enabled -- false will disable the whole extension
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
}

