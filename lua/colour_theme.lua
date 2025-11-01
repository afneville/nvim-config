local M = {}

local function reset_highlights()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.opt.background = "dark"

  local groups_to_link = {
    "Comment",
    "Constant",
    "String",
    "Character",
    "Number",
    "Boolean",
    "Float",
    "Identifier",
    "Function",
    "Statement",
    "Conditional",
    "Repeat",
    "Label",
    "Operator",
    "Keyword",
    "Exception",
    "PreProc",
    "Include",
    "Define",
    "Macro",
    "PreCondit",
    "Type",
    "StorageClass",
    "Structure",
    "Typedef",
    "Special",
    "SpecialChar",
    "Tag",
    "Delimiter",
    "SpecialComment",
    "Debug",
    "Title",
    "Underlined",
    "Error",
  }

  for _, group in ipairs(groups_to_link) do
    vim.api.nvim_set_hl(0, group, { link = "Normal" })
  end
end

--- Loads the minimal monochrome theme.
M.load = function()
  -- Ensure termguicolours is off, as requested.
  vim.opt.termguicolors = false

  -- Run the reset function
  reset_highlights()

  -- Define the base monochrome palette (using 256-color names)
  local fg = "White" -- cterm color 15 or 253
  local bg = "Black" -- cterm color 0 or 232
  local ui_fg = "Grey" -- cterm color 244

  -- Set base editor colors
  -- '0' is the default namespace
  vim.api.nvim_set_hl(0, "Normal", { ctermfg = fg, ctermbg = bg })
  vim.api.nvim_set_hl(0, "NormalNC", { ctermfg = fg, ctermbg = bg }) -- Non-current windows

  -- Minimal UI elements
  vim.api.nvim_set_hl(0, "Visual", { reverse = true }) -- Selection
  vim.api.nvim_set_hl(0, "CursorLine", { underline = true }) -- Highlight current line
  vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg = ui_fg }) -- e.g., 'set colorcolumn=80'
  vim.api.nvim_set_hl(0, "SignColumn", { ctermfg = ui_fg, ctermbg = bg })
  vim.api.nvim_set_hl(0, "LineNr", { ctermfg = ui_fg, ctermbg = bg }) -- Line numbers

  -- Status line
  vim.api.nvim_set_hl(0, "StatusLine", { ctermfg = bg, ctermbg = fg, reverse = true })
  vim.api.nvim_set_hl(0, "StatusLineNC", { ctermfg = ui_fg, ctermbg = bg, reverse = false }) -- Inactive status lines

  -- Pop-up menu (completion)
  vim.api.nvim_set_hl(0, "Pmenu", { ctermfg = fg, ctermbg = ui_fg })
  vim.api.nvim_set_hl(0, "PmenuSel", { ctermfg = bg, ctermbg = fg, reverse = true })

  -- Text placeholders
  vim.api.nvim_set_hl(0, "NonText", { ctermfg = ui_fg }) -- '~' at end of buffer
  vim.api.nvim_set_hl(0, "EndOfBuffer", { link = "NonText" }) -- Same as NonText

  -- We now override the links for specific groups.

  -- Comments -> Blue
  vim.api.nvim_set_hl(0, "Comment", { ctermfg = "Grey" })

  -- Statements, Keywords, Operators -> Yellow
  vim.api.nvim_set_hl(0, "Statement", { ctermfg = "Yellow" })
  vim.api.nvim_set_hl(0, "Conditional", { link = "Statement" })
  vim.api.nvim_set_hl(0, "Repeat", { link = "Statement" })
  vim.api.nvim_set_hl(0, "Keyword", { link = "Statement" })
  vim.api.nvim_set_hl(0, "Operator", { link = "Statement" })

  -- Strings -> Green
  vim.api.nvim_set_hl(0, "String", { ctermfg = "Green" })
  vim.api.nvim_set_hl(0, "Character", { link = "String" })

  -- Constants, Numbers, Booleans -> Magenta
  vim.api.nvim_set_hl(0, "Constant", { ctermfg = "Magenta" })
  vim.api.nvim_set_hl(0, "Number", { link = "Constant" })
  vim.api.nvim_set_hl(0, "Boolean", { link = "Constant" })

  -- Types and Functions -> Cyan
  vim.api.nvim_set_hl(0, "Type", { ctermfg = "Cyan" })
  vim.api.nvim_set_hl(0, "Function", { link = "Type" })
  -- Note: 'Identifier' (variables) remains linked to 'Normal' (White).

  -- Preprocessor and Special tokens -> Red
  vim.api.nvim_set_hl(0, "PreProc", { ctermfg = "Red" })
  vim.api.nvim_set_hl(0, "Special", { link = "PreProc" })

  -- Errors and Todos
  vim.api.nvim_set_hl(0, "Error", { ctermfg = "White", ctermbg = "Red" })
  vim.api.nvim_set_hl(0, "Todo", { ctermfg = "Black", ctermbg = "Yellow" })

  -- Line Numbers
  vim.api.nvim_set_hl(0, "LineNr", { ctermfg = ui_fg, ctermbg = bg })
  vim.api.nvim_set_hl(0, "SignColumn", { ctermfg = ui_fg, ctermbg = bg })

  -- Indent characters (for 'set list' and plugins)
  vim.api.nvim_set_hl(0, "NonText", { ctermfg = ui_fg })
  vim.api.nvim_set_hl(0, "EndOfBuffer", { link = "NonText" }) -- '~' at end of buffer
  vim.api.nvim_set_hl(0, "Whitespace", { ctermfg = ui_fg }) -- For 'listchars'

  -- indent-blankline.nvim plugin (if you use it)
  vim.api.nvim_set_hl(0, "IblIndent", { ctermfg = ui_fg })
  vim.api.nvim_set_hl(0, "IblScope", { ctermfg = ui_fg })
  vim.api.nvim_set_hl(0, "IblWhitespace", { ctermfg = ui_fg })

  -- Other UI elements
  vim.api.nvim_set_hl(0, "VertSplit", { ctermfg = ui_fg, ctermbg = ui_fg }) -- Window separators
  vim.api.nvim_set_hl(0, "Folded", { ctermfg = ui_fg, ctermbg = bg })

  -- Status Lines
  vim.api.nvim_set_hl(0, "StatusLine", { ctermfg = ui_fg, ctermbg = bg }) -- Active (kept high-contrast)
  vim.api.nvim_set_hl(0, "StatusLineNC", { ctermfg = ui_fg, ctermbg = bg }) -- Inactive windows

  -- Popup Menu (Completion)
  vim.api.nvim_set_hl(0, "Pmenu", { ctermfg = fg, ctermbg = ui_fg })
  vim.api.nvim_set_hl(0, "PmenuSel", { ctermfg = bg, ctermbg = fg, reverse = true })
  vim.api.nvim_set_hl(0, "PmenuSbar", { ctermbg = ui_fg })
  vim.api.nvim_set_hl(0, "PmenuThumb", { ctermbg = fg })
end

return M
