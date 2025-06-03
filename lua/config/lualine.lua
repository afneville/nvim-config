local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

lsp_module = {
  function()
    local msg = "?"
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
  icon = "LSP:",
}

-- local theme_palette = require("catppuccin.palettes").get_palette("mocha")
-- local custom_theme = require("lualine.themes.catppuccin")
-- custom_theme.normal.a.bg = theme_palette["mauve"]
-- custom_theme.normal.b.bg = theme_palette["surface0"]
-- custom_theme.normal.c.bg = theme_palette["surface0"]
-- custom_theme.inactive.c.bg = theme_palette["surface0"]
-- custom_theme.inactive.b.bg = theme_palette["surface1"]
-- -- custom_theme.normal.c.fg = theme_palette["mauve"]
-- custom_theme.normal.b.fg = theme_palette["text"]
-- custom_theme.insert.b.fg = theme_palette["text"]
-- custom_theme.visual.b.fg = theme_palette["text"]
-- custom_theme.replace.b.fg = theme_palette["text"]
-- custom_theme.command.b.fg = theme_palette["text"]
-- custom_theme.inactive.b.fg = theme_palette["text"]

local active_sections_config = {
  lualine_a = { {
    "mode",
  } },
  lualine_b = {
    {
      "filename",
      path = 1,
      symbols = {
        modified = "[*]",
        readonly = "[-] ",
        unnamed = "[?] ",
        newfile = "[+] ",
      },
    },
  },
  lualine_c = {
    { "branch", icon = "" },
    {
      "diff",
      symbols = {
        added = Options.added,
        modified = Options.modified,
        removed = Options.removed,
      },
      source = diff_source,
    },
  },
  lualine_x = {
    {
      "diagnostics",
      symbols = {
        error = Options.error,
        warn = Options.warn,
        info = Options.info,
        hint = Options.hint,
      },
      always_visible = false,
    },
    lsp_module,
  },
  lualine_y = {
    "progress",
    "location",
  },
  lualine_z = {
    "filetype",
  },
}

local inactive_sections_config = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = {
    {
      "filename",
      path = 1,
      symbols = {
        modified = "[*]",
        readonly = "[-] ",
        unnamed = "[?] ",
        newfile = "[+] ",
      },
    },
  },
  lualine_x = { "filetype", "progress", "location" },
  lualine_y = {},
  lualine_z = {},
}

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    -- section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {
        "NvimTree",
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
  sections = active_sections_config,
  inactive_sections = inactive_sections_config,
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
})

-- local navic = require("nvim-navic")

local tabline = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = {
    -- {
    --   function()
    --       return navic.get_location()
    --   end,
    --   cond = function()
    --       return navic.is_available()
    --   end
    -- },
  },
  lualine_x = {
    {
      "diff",
      symbols = {
        added = Options.added,
        modified = Options.modified,
        removed = Options.removed,
      },
      source = diff_source,
    },
    { "branch", icon = "" },
    {
      "diagnostics",
      symbols = {
        error = Options.error,
        warn = Options.warn,
        info = Options.info,
        hint = Options.hint,
      },
      always_visible = false,
    },
    lsp_module,
  },
  lualine_y = {
    {
      "filename",
      path = 1,
      symbols = {
        modified = "[*]",
        readonly = "[-]",
        unnamed = "[?]",
        newfile = "[+]",
      },
    },
  },
  lualine_z = {
    {
      "mode",
    },
  },
}
