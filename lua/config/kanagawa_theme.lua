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

            TabLineFill = { bg = colors.palette.dragonBlack4 },
            TabLineSel = { bg = colors.palette.dragonBlack4 },

            BufferCurrent = {
                bg = colors.palette.dragonBlack3,
                fg = colors.theme.ui.fg,
            },
            BufferCurrentADDED = {
                bg = colors.palette.dragonBlack3,
                fg = colors.theme.vcs.added,
            },
            BufferCurrentCHANGED = {
                bg = colors.palette.dragonBlack3,
                fg = colors.theme.vcs.changed,
            },
            BufferCurrentDELETED = {
                bg = colors.palette.dragonBlack3,
                fg = colors.theme.vcs.removed,
            },
            BufferCurrentERROR = {
                bg = colors.palette.dragonBlack3,
                fg = colors.theme.diag.error,
            },
            BufferCurrentHINT = {
                bg = colors.palette.dragonBlack3,
                fg = colors.theme.diag.hint,
            },
            BufferCurrentIcon = {
                bg = colors.palette.dragonBlack3,
                fg = colors.palette.dragonBlue2,
            },
            BufferCurrentIndex = { bg = colors.palette.dragonBlack3 },
            BufferCurrentINFO = {
                bg = colors.palette.dragonBlack3,
                fg = colors.theme.diag.info,
            },
            BufferCurrentMod = {
                bg = colors.palette.dragonBlack3,
                fg = colors.theme.diag.warning,
            },
            BufferCurrentNumber = { bg = colors.palette.dragonBlack3 },
            BufferCurrentSign = {
                bg = colors.palette.dragonBlack3,
                fg = colors.palette.dragonBlack3,
            },
            BufferCurrentSignRight = {
                bg = colors.palette.dragonBlack3,
                fg = colors.palette.dragonBlack3,
            },
            BufferCurrentTarget = { bg = colors.palette.dragonBlack3 },
            BufferCurrentWarn = {
                bg = colors.palette.dragonBlack3,
                fg = colors.theme.diag.warning,
            },

            BufferVisible = {
                bg = colors.palette.dragonBlack3,
                fg = colors.theme.syn.comment,
            },
            BufferVisibleADDED = {
                bg = colors.palette.dragonBlack3,
                fg = colors.theme.vcs.added,
            },
            BufferVisibleCHANGED = {
                bg = colors.palette.dragonBlack3,
                fg = colors.theme.vcs.changed,
            },
            BufferVisibleDELETED = {
                bg = colors.palette.dragonBlack3,
                fg = colors.theme.vcs.removed,
            },
            BufferVisibleERROR = {
                bg = colors.palette.dragonBlack3,
                fg = colors.theme.diag.error,
            },
            BufferVisibleHINT = {
                bg = colors.palette.dragonBlack3,
                fg = colors.theme.diag.hint,
            },
            BufferVisibleIcon = {
                bg = colors.palette.dragonBlack3,
                fg = colors.theme.syn.comment,
            },
            BufferVisibleIndex = { bg = colors.palette.dragonBlack3 },
            BufferVisibleINFO = {
                bg = colors.palette.dragonBlack3,
                fg = colors.theme.diag.info,
            },
            BufferVisibleMod = {
                bg = colors.palette.dragonBlack3,
                fg = colors.theme.syn.comment,
            },
            BufferVisibleNumber = { bg = colors.palette.dragonBlack3 },
            BufferVisibleSign = {
                bg = colors.palette.dragonBlack3,
                fg = colors.palette.dragonBlack3,
            },
            BufferVisibleSignRight = {
                bg = colors.palette.dragonBlack3,
                fg = colors.palette.dragonBlack3,
            },
            BufferVisibleTarget = { bg = colors.palette.dragonBlack3 },
            BufferVisibleWarn = {
                bg = colors.palette.dragonBlack3,
                fg = colors.theme.diag.warning,
            },

            BufferInactive = {
                bg = colors.palette.dragonBlack4,
                fg = colors.theme.syn.comment,
            },
            BufferInactiveADDED = {
                bg = colors.palette.dragonBlack4,
                fg = colors.theme.vcs.added,
            },
            BufferInactiveCHANGED = {
                bg = colors.palette.dragonBlack4,
                fg = colors.theme.vcs.changed,
            },
            BufferInactiveDELETED = {
                bg = colors.palette.dragonBlack4,
                fg = colors.theme.vcs.removed,
            },
            BufferInactiveERROR = {
                bg = colors.palette.dragonBlack4,
                fg = colors.theme.diag.error,
            },
            BufferInactiveHINT = {
                bg = colors.palette.dragonBlack4,
                fg = colors.theme.diag.hint,
            },
            BufferInactiveIcon = {
                bg = colors.palette.dragonBlack4,
                fg = colors.theme.syn.comment,
            },
            BufferInactiveIndex = { bg = colors.palette.dragonBlack4 },
            BufferInactiveINFO = {
                bg = colors.palette.dragonBlack4,
                fg = colors.theme.diag.info,
            },
            BufferInactiveMod = {
                bg = colors.palette.dragonBlack4,
                fg = colors.theme.syn.comment,
            },
            BufferInactiveNumber = { bg = colors.palette.dragonBlack4 },
            BufferInactiveSign = {
                bg = colors.palette.dragonBlack4,
                fg = colors.palette.dragonBlack4,
            },
            BufferInactiveSignRight = {
                bg = colors.palette.dragonBlack4,
                fg = colors.palette.dragonBlack4,
            },
            BufferInactiveTarget = { bg = colors.palette.dragonBlack4 },
            BufferInactiveWarn = {
                bg = colors.palette.dragonBlack4,
                fg = colors.theme.diag.warning,
            },

            BufferAlternate = {
                bg = colors.palette.dragonBlack4,
                fg = colors.theme.syn.comment,
            },
            BufferAlternateADDED = {
                bg = colors.palette.dragonBlack4,
                fg = colors.theme.vcs.added,
            },
            BufferAlternateCHANGED = {
                bg = colors.palette.dragonBlack4,
                fg = colors.theme.vcs.changed,
            },
            BufferAlternateDELETED = {
                bg = colors.palette.dragonBlack4,
                fg = colors.theme.vcs.removed,
            },
            BufferAlternateERROR = {
                bg = colors.palette.dragonBlack4,
                fg = colors.theme.diag.error,
            },
            BufferAlternateHINT = {
                bg = colors.palette.dragonBlack4,
                fg = colors.theme.diag.hint,
            },
            BufferAlternateIcon = {
                bg = colors.palette.dragonBlack4,
                fg = colors.theme.syn.comment,
            },
            BufferAlternateIndex = { bg = colors.palette.dragonBlack4 },
            BufferAlternateINFO = {
                bg = colors.palette.dragonBlack4,
                fg = colors.theme.diag.info,
            },
            BufferAlternateMod = {
                bg = colors.palette.dragonBlack4,
                fg = colors.theme.syn.comment,
            },
            BufferAlternateNumber = { bg = colors.palette.dragonBlack4 },
            BufferAlternateSign = {
                bg = colors.palette.dragonBlack4,
                fg = colors.palette.dragonBlack4,
            },
            BufferAlternateSignRight = {
                bg = colors.palette.dragonBlack4,
                fg = colors.palette.dragonBlack4,
            },
            BufferAlternateTarget = { bg = colors.palette.dragonBlack4 },
            BufferAlternateWarn = {
                bg = colors.palette.dragonBlack4,
                fg = colors.theme.diag.warning,
            },
        }
    end,
    theme = "dragon", -- Load "wave" theme when 'background' option is not set
    background = { -- map the value of 'background' option to a theme
        dark = "dragon", -- try "dragon" !
        light = "lotus",
    },
})

vim.cmd("colorscheme kanagawa-dragon")
