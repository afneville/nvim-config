local colors = require("kanagawa.colors").setup({ theme = 'dragon' })

require("kanagawa").setup({
  compile = false,
  undercurl = true,
  commentStyle = { italic = true },
  functionStyle = {},
  keywordStyle = { bold = false, italic = false },
  statementStyle = { bold = false },
  typeStyle = {},
  transparent = false,
  dimInactive = false,
  terminalColors = true,
  colors = {
    palette = { },
    theme = {
      wave = {},
      lotus = {},
      dragon = {
        ui = {
          bg_m3 = colors.palette.dragonBlack4,
          pmenu = {
            fg = colors.palette.dragonWhite,
            bg = colors.palette.dragonBlack4,
            bg_sel = colors.palette.dragonBlack5,
            bg_sbar = colors.palette.dragonBlack2,
            bg_thumb = colors.palette.dragonBlack4,
          },
        },
      },
      all = {
        ui = {
          bg_gutter = "none",
        },
      },
    },
  },
  overrides = function(colors)
    return {
      MsgArea = { fg = colors.theme.ui.fg },
      StatusLine = { fg = colors.theme.ui.fg, bg = colors.palette.dragonBlack4 },
      StatusLineNC = { fg = colors.theme.syn.comment, bg = colors.palette.dragonBlack2 },
      StatusLineAccent = { bg = colors.palette.dragonPink },
      StatusLineAccentNC = { bg = colors.theme.syn.comment, },
      TreesitterContext = { bg = "none" },
      TreesitterContextLineNumber = { fg = colors.theme.ui.nontext },
      TreesitterContextSeparator = { bg = "none", fg = colors.palette.dragonBlack6 },
      TelescopePromptBorder = { fg = colors.theme.ui.nontext },
      TelescopeResultsBorder = { fg = colors.theme.ui.nontext },
      TelescopePreviewBorder = { fg = colors.theme.ui.nontext },
      Folded = { bg = colors.theme.ui.bg_visual },
    }
  end,
  theme = "dragon",
  background = {
    dark = "dragon",
    light = "lotus",
  },
})

vim.cmd("colorscheme kanagawa-dragon")
