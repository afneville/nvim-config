require("kanagawa").setup({
    compile = false, -- enable compiling the colorscheme
    undercurl = true, -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false, -- do not set background color
    dimInactive = false, -- dim inactive window `:h hl-NormalNC`
    terminalColors = true, -- define vim.g.terminal_color_{0,17}
    colors = { -- add/modify theme and palette colors
        palette = {
            dragonBlack0 = "#282727",
        },
        theme = {
            wave = {},
            lotus = {},
            dragon = {},
            all = {
                ui = {
                    bg_gutter = "none",
                },
            },
        },
    },
    overrides = function(colors) -- add/modify highlights
        return {
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },
            Pmenu = { bg = "none", fg = "none" },
            PmenuSel = { bg = colors.theme.ui.bg_p2, fg = "none" },
            PmenuSbar = { bg = "none", fg = "none" },
            PmenuThumb = { bg = colors.theme.ui.bg_p2, fg = "none" },
        }
    end,
    theme = "dragon", -- Load "wave" theme when 'background' option is not set
    background = { -- map the value of 'background' option to a theme
        dark = "dragon", -- try "dragon" !
        light = "lotus",
    },
})

vim.cmd("colorscheme kanagawa-dragon")
