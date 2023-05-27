require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = "auto",
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = "", right = "" },
        -- component_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        disabled_filetypes = {
            statusline = {
                "NvimTree"
            },
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
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            "mode",
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
        lualine_x = {
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
            "progress",
            "location",
        },
        lualine_y = {},
        lualine_z = {},
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
