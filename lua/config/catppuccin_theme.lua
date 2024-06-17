require("catppuccin").setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  -- flavour = "latte", -- latte, frappe, macchiato, mocha
  background = { -- :h background
    light = "latte",
    dark = "mocha",
  },
  transparent_background = false,
  show_end_of_buffer = false, -- show the '~' characters after the end of buffers
  term_colors = false,
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  no_italic = false, -- Force no italic
  no_bold = false, -- Force no bold
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  color_overrides = {
    -- mocha = {
    --     base =   "#070018",
    --     mantle = "#070018",
    --     crust =  "#070018",
    -- },
  },
  highlight_overrides = {
    all = function(colors) -- Global highlight, will be replaced with custom_highlights if exists
      return {
        NormalFloat = { bg = colors.base },
        Pmenu = { bg = colors.base },
        TroubleNormal = { bg = colors.base },
        CursorColumn = { bg = colors.surface0 },
        StatusLine = { bg = colors.surface0 },
        StatusLineNC = { bg = colors.surface0 },
        TreesitterContextSeparator = { fg = colors.surface1 },
        TelescopeBorder = { fg = colors.surface0 },
        WinSeparator = { fg = colors.surface0 },
        markdownLinkText = { style = {} },
        TreesitterContextLineNumber = { bg = colors.base },
        TreesitterContextBottom = { style = {} },
        TreesitterContextLineNumberBottom = { style = {} },
        lualine_c_normal = { bg = colors.base },
        -- VertSplit = { fg = colors.surface1 }
        -- StatusLineNC
      }
    end, -- Same for each flavour
    -- latte = function(latte) end,
    -- frappe = function(frappe) end,
    -- macchiato = function(macchiato) end,
    -- mocha = function(mocha) end,
  },
  -- custom_highlights = {},
  integrations = {
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    navic = {
      enabled = true,
      custom_bg = "NONE",
    },
    cmp = true,
    gitsigns = true,
    nvimtree = false,
    telescope = true,
    barbar = true,
    lsp_trouble = true,
    lsp_saga = true,
    markdown = true,
    mason = true,
    treesitter = true,
  },
})

vim.cmd.colorscheme("catppuccin")

vim.cmd("hi clear markdownError")
vim.cmd("hi clear Error")
-- vim.cmd("syn clear mkdLink")
