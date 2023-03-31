local theme_palette = require("catppuccin.palettes").get_palette("mocha")
local custom_theme = require("lualine.themes.catppuccin")
custom_theme.normal.a.bg = theme_palette["lavender"]
custom_theme.normal.c.bg = theme_palette["surface0"]
custom_theme.inactive.c.bg = theme_palette["surface0"]
custom_theme.inactive.b.bg = theme_palette["surface1"]
custom_theme.normal.c.fg = theme_palette["mauve"]
custom_theme.normal.b.fg = theme_palette["text"]
custom_theme.insert.b.fg = theme_palette["text"]
custom_theme.visual.b.fg = theme_palette["text"]
custom_theme.replace.b.fg = theme_palette["text"]
custom_theme.command.b.fg = theme_palette["text"]
custom_theme.inactive.b.fg = theme_palette["text"]

require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = custom_theme,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = {
            "branch",
            {
                "diff",
                symbols = {
                    added = " ",
                    modified = " ",
                    removed = " ",
                },
            },
            {
                "diagnostics",
                symbols = {
                    error = Options.error,
                    warn = Options.warn,
                    info = Options.info,
                    hint = Options.hint,
                },
                always_visible = true,
            },
        },
        lualine_c = {
            {
                "filename",
                path = 1,
                symbols = {
                    modified = " ", -- Text to show when the file is modified.
                    readonly = " ", -- Text to show when the file is non-modifiable or readonly.
                    unnamed = " ", -- Text to show for unnamed buffers.
                    newfile = " ",
                },
            },
        },
        lualine_x = {},
        lualine_y = {
            {
                function()
                    local msg = " "
                    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                    local clients = vim.lsp.get_active_clients()
                    if next(clients) == nil then
                        return msg
                    end
                    for _, client in ipairs(clients) do
                        local filetypes = client.config.filetypes
                        if
                            filetypes
                            and vim.fn.index(filetypes, buf_ft) ~= -1
                        then
                            return client.name
                        end
                    end
                    return msg
                end,
                icon = "  LSP:",
                color = { gui = "bold" },
            },
            "filetype",
        },
        lualine_z = { "progress", "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            {
                "filename",
                path = 1,
                symbols = {
                    modified = " ", -- Text to show when the file is modified.
                    readonly = " ", -- Text to show when the file is non-modifiable or readonly.
                    unnamed = " ", -- Text to show for unnamed buffers.
                    newfile = " ",
                },
            },
        },
        lualine_x = { "filetype", "progress", "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
})
