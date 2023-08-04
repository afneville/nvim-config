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
    color_overrides = {},
    highlight_overrides = {
        all = function(colors) -- Global highlight, will be replaced with custom_highlights if exists
            return {
                TabLineFill = { bg = colors.surface0, fg = colors.overlay0 },
                TabLineSel = { bg = colors.surface0 },
                BufferVisible = { bg = colors.surface1 },
                BufferInactive = { bg = colors.surface0, style = { "italic" } },
                BufferCurrent = { bg = colors.surface1 },
                BufferCurrentIndex = { bg = colors.surface1 },
                BufferCurrentMod = { bg = colors.surface1 },
                BufferCurrentSign = {
                    bg = colors.surface1,
                    fg = colors.overlay0,
                },
                BufferCurrentTarget = { bg = colors.surface1 },
                BufferVisibleIndex = { bg = colors.surface1 },
                BufferVisibleMod = { bg = colors.surface1 },
                BufferVisibleSign = {
                    bg = colors.surface1,
                    fg = colors.overlay0,
                },
                BufferVisibleTarget = { bg = colors.surface1 },
                BufferInactiveIndex = { bg = colors.surface0 },
                BufferInactiveMod = { bg = colors.surface0 },
                BufferInactiveSign = {
                    bg = colors.surface0,
                    fg = colors.overlay0,
                },
                BufferInactiveTarget = { bg = colors.surface0 },
                NormalFloat = { bg = colors.base },
                Pmenu = { bg = colors.base },
                TroubleNormal = { bg = colors.base },
                CursorColumn = { bg = colors.surface0 },
                StatusLine = { bg = colors.surface0 },
                StatusLineNC = { bg = colors.surface0 },
                TreesitterContextSeparator = { fg = colors.surface1 }
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
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

vim.cmd.colorscheme("catppuccin")
