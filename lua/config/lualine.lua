local lualine = require("lualine")
local tree_extension = {
    sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    filetypes = { "NvimTree" },
}

-- local colors = {
--     bg       = '#1D2026',
--     fg       = '#ABB2BF',
--     inactive = '#353B45',
--     red      = '#E06C75',
--     green    = '#98C379',
--     blue     = '#61AFEF',
--     yellow   = '#E5C07B',
--     orange   = '#D19A66',
--     magenta  = '#C678DD',
--     cyan     = '#56B6C2',
--     purple   = '#C678DD',
-- }

-- local colors = {
--     bg       = '#373737',
--     fg       = '#d4d4d4',
--     inactive = '#373737',
--     red      = '#D16969',
--     green    = '#579C4C',
--     yellow   = '#D9DAA2',
--     blue     = '#339CDB',
--     orange   = '#DB8E73',
--     magenta  = '#C586c0',
--     cyan     = '#85DDFF',
--     purple   = '#C586c0',
-- }

local colors = {
    bg = Colors.base02,
    fg = Colors.base05,
    inactive = Colors.base01,
    red = Colors.base08,
    green = Colors.base0B,
    yellow = Colors.base0A,
    blue = Colors.base0D,
    orange = Colors.base09,
    magenta = Colors.base0E,
    cyan = Colors.base0C,
    purple = Colors.base0E,
}

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

local config = {
    options = {
        theme = {
            normal = { c = { fg = colors.fg, bg = colors.bg } },
            inactive = { c = { fg = colors.fg, bg = colors.bg } },
        },
        section_separators = { "", "" },
        component_separators = { "", "" },
    },
    extensions = {
        tree_extension,
    },
    sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
}

local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
    table.insert(config.inactive_sections.lualine_c, component)
end

local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
    table.insert(config.inactive_sections.lualine_x, component)
end

ins_left({
    function()
        return "▊"
    end,
    color = { fg = colors.blue }, -- Sets highlighting of component
    padding = { left = 0, right = 1 }, -- We don't need space before this
})

ins_left({
    -- mode component
    function()
        -- auto change color according to neovims mode
        local mode_color = {
            n = colors.green,
            i = colors.yellow,
            v = colors.orange,
            [""] = colors.orange,
            V = colors.orange,
            c = colors.yellow,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            [""] = colors.orange,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ["r?"] = colors.cyan,
            ["!"] = colors.red,
            t = colors.red,
        }
        vim.api.nvim_command(
            "hi! LualineMode guifg="
                .. mode_color[vim.fn.mode()]
                .. " guibg="
                .. colors.bg
        )
        return ""
    end,
    color = "LualineMode",
    padding = { right = 1 },
})

-- ins_left({
--   -- filesize component
--   'filesize',
--   cond = conditions.buffer_not_empty,
-- })

ins_left({
    "filename",
    cond = conditions.buffer_not_empty,
    color = { fg = colors.magenta },
})

ins_left({ "progress" })
ins_left({ "location" })

-- -- Insert mid section. You can make any number of sections in neovim :)
-- -- for lualine it's any number greater then 2
-- ins_left({
--   function()
--     return '%='
--   end,
-- })

ins_left({
    -- Lsp server name .
    function()
        local msg = "..."
        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
            return msg
        end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
        return msg
    end,
    icon = " LSP:",
    color = { fg = colors.fg, gui = "bold" },
})

ins_left({
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", hint = " ", info = " " },
    diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_hint = { fg = colors.yellow },
        color_info = { fg = colors.cyan },
    },
})
-- -- Add components to right sections
-- ins_right({
--   'o:encoding', -- option component same as &encoding in viml
--   fmt = string.upper, -- I'm not sure why it's upper case either ;)
--   cond = conditions.hide_in_width,
--   color = { fg = colors.green, gui = 'bold' },
-- })
--
-- ins_right({
--   'fileformat',
--   fmt = string.upper,
--   icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
--   color = { fg = colors.green, gui = 'bold' },
-- })

ins_right({
    "diff",
    symbols = { added = " ", modified = " ", removed = " " },
    diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
    },
    cond = conditions.hide_in_width,
})

ins_right({
    "branch",
    icon = "",
    color = { fg = colors.magenta, gui = "bold" },
})

ins_right({
    function()
        return "▊"
    end,
    color = { fg = colors.blue },
    padding = { left = 1 },
})

lualine.setup(config)
