require("gruvbox").setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
        strings = true,
        comments = true,
        operators = false,
        folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = false,
    contrast = "hard",
    palette_overrides = {},
    overrides = {
        StatusLine = { bg = "#3c3836", fg = "" },
        StatusLineNC = { bg = "#3c3836", fg = "" },
        IndentBlanklineContextChar = { fg = "#d79921" }
    },
    dim_inactive = false,
    transparent_mode = false,
})
vim.cmd("colorscheme gruvbox")
