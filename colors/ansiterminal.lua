local function reset_highlights()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.opt.background = "dark"
  vim.g.colors_name = "ansiterminal"

  local all_groups = {
    "ColorColumn",
    "Conceal",
    "CurSearch",
    "Cursor",
    "lCursor",
    "CursorIM",
    "CursorColumn",
    "CursorLine",
    "Directory",
    "DiffAdd",
    "DiffChange",
    "DiffDelete",
    "DiffText",
    "EndOfBuffer",
    "TermCursor",
    "TermCursorNC",
    "ErrorMsg",
    "WinSeparator",
    "Folded",
    "FoldColumn",
    "SignColumn",
    "IncSearch",
    "Substitute",
    "LineNr",
    "LineNrAbove",
    "LineNrBelow",
    "CursorLineNr",
    "CursorLineFold",
    "CursorLineSign",
    "MatchParen",
    "ModeMsg",
    "MsgArea",
    "MsgSeparator",
    "MoreMsg",
    "NonText",
    "Normal",
    "NormalFloat",
    "FloatBorder",
    "FloatTitle",
    "NormalNC",
    "Pmenu",
    "PmenuSel",
    "PmenuKind",
    "PmenuKindSel",
    "PmenuExtra",
    "PmenuExtraSel",
    "PmenuSbar",
    "PmenuThumb",
    "Question",
    "QuickFixLine",
    "Search",
    "SpecialKey",
    "SpellBad",
    "SpellCap",
    "SpellLocal",
    "SpellRare",
    "StatusLine",
    "StatusLineNC",
    "TabLine",
    "TabLineFill",
    "TabLineSel",
    "Title",
    "Visual",
    "VisualNOS",
    "WarningMsg",
    "Whitespace",
    "WildMenu",
    "WinBar",
    "WinBarNC",
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
    "Underlined",
    "Ignore",
    "Error",
    "Todo",
    "Added",
    "Changed",
    "Removed",
    "DiagnosticError",
    "DiagnosticWarn",
    "DiagnosticInfo",
    "DiagnosticHint",
    "DiagnosticOk",
    "DiagnosticVirtualTextError",
    "DiagnosticVirtualTextWarn",
    "DiagnosticVirtualTextInfo",
    "DiagnosticVirtualTextHint",
    "DiagnosticVirtualTextOk",
    "DiagnosticUnderlineError",
    "DiagnosticUnderlineWarn",
    "DiagnosticUnderlineInfo",
    "DiagnosticUnderlineHint",
    "DiagnosticUnderlineOk",
    "DiagnosticFloatingError",
    "DiagnosticFloatingWarn",
    "DiagnosticFloatingInfo",
    "DiagnosticFloatingHint",
    "DiagnosticFloatingOk",
    "DiagnosticSignError",
    "DiagnosticSignWarn",
    "DiagnosticSignInfo",
    "DiagnosticSignHint",
    "DiagnosticSignOk",
    "DiagnosticDeprecated",
    "DiagnosticUnnecessary",
    "LspReferenceText",
    "LspReferenceRead",
    "LspReferenceWrite",
    "LspCodeLens",
    "LspCodeLensSeparator",
    "LspSignatureActiveParameter",
    "healthError",
    "healthSuccess",
    "healthWarning",
    "IblIndent",
    "IblScope",
    "IblWhitespace",
  }

  for _, group in ipairs(all_groups) do
    vim.api.nvim_set_hl(0, group, {})
  end
end

vim.opt.termguicolors = false
reset_highlights()
reset_highlights()

-- ANSI color palette (using numeric codes for explicit control)
-- 0-7: Normal colors, 8-15: Bright colors
local fg = 7          -- Normal white (not bright white)
local bg = 0          -- Black
local faded = 8       -- Bright black (gray)
local red = 9         -- Bright red
local green = 10      -- Bright green
local yellow = 11     -- Bright yellow
local blue = 12       -- Bright blue
local magenta = 13    -- Bright magenta
local cyan = 14       -- Bright cyan
local black = 0       -- Black

-- Semantic color mappings
local comment = green
local keyword = red
local statement = yellow
local func = blue
local string = green
local constant = magenta
local type = yellow
local preproc = red
local variable = fg
local property = cyan
local operator = red
local error = red
local todo = yellow

vim.api.nvim_set_hl(0, "Normal", { ctermfg = fg, ctermbg = bg })
vim.api.nvim_set_hl(0, "NormalNC", { ctermfg = fg, ctermbg = bg })
vim.api.nvim_set_hl(0, "Visual", { ctermbg = faded })
vim.api.nvim_set_hl(0, "CursorLine", {})
vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg = faded })
vim.api.nvim_set_hl(0, "SignColumn", { ctermfg = faded, ctermbg = bg })
vim.api.nvim_set_hl(0, "LineNr", { ctermfg = faded, ctermbg = bg })
vim.api.nvim_set_hl(0, "LineNrAbove", { ctermfg = faded, ctermbg = bg })
vim.api.nvim_set_hl(0, "LineNrBelow", { ctermfg = faded, ctermbg = bg })
vim.api.nvim_set_hl(0, "NonText", { ctermfg = faded })
vim.api.nvim_set_hl(0, "EndOfBuffer", { link = "NonText" })
vim.api.nvim_set_hl(0, "Statement", { ctermfg = keyword, italic = true })
vim.api.nvim_set_hl(0, "Conditional", { ctermfg = keyword, italic = true })
vim.api.nvim_set_hl(0, "Repeat", { ctermfg = keyword, italic = true })
vim.api.nvim_set_hl(0, "Keyword", { ctermfg = keyword, italic = true })
vim.api.nvim_set_hl(0, "Operator", { ctermfg = operator })
vim.api.nvim_set_hl(0, "String", { ctermfg = string })
vim.api.nvim_set_hl(0, "Character", { link = "String" })
vim.api.nvim_set_hl(0, "Constant", { ctermfg = constant })
vim.api.nvim_set_hl(0, "Number", { link = "Constant" })
vim.api.nvim_set_hl(0, "Boolean", { link = "Constant" })
vim.api.nvim_set_hl(0, "Type", { ctermfg = type })
vim.api.nvim_set_hl(0, "Function", { ctermfg = func })
vim.api.nvim_set_hl(0, "PreProc", { ctermfg = preproc })
vim.api.nvim_set_hl(0, "Comment", { ctermfg = comment })
vim.api.nvim_set_hl(0, "Special", { link = "PreProc" })
vim.api.nvim_set_hl(0, "Error", { ctermfg = fg, ctermbg = error })
vim.api.nvim_set_hl(0, "Todo", { ctermfg = black, ctermbg = todo })
vim.api.nvim_set_hl(0, "CursorLineNr", { ctermfg = fg, ctermbg = bg })
vim.api.nvim_set_hl(0, "CursorLineSign", { ctermfg = faded, ctermbg = bg })
vim.api.nvim_set_hl(0, "SignColumn", { ctermfg = faded, ctermbg = bg })
vim.api.nvim_set_hl(0, "NonText", { ctermfg = faded })
vim.api.nvim_set_hl(0, "EndOfBuffer", { link = "NonText" })
vim.api.nvim_set_hl(0, "Whitespace", { ctermfg = faded })
vim.api.nvim_set_hl(0, "VertSplit", { ctermfg = faded })
vim.api.nvim_set_hl(0, "WinSeparator", { ctermfg = faded })
vim.api.nvim_set_hl(0, "Folded", { ctermfg = faded, ctermbg = bg })
vim.api.nvim_set_hl(0, "StatusLine", { ctermfg = faded, ctermbg = fg, reverse = true })
vim.api.nvim_set_hl(0, "StatusLineNC", { ctermfg = faded, ctermbg = fg, reverse = true })
vim.api.nvim_set_hl(0, "Pmenu", { ctermfg = fg, ctermbg = faded })
vim.api.nvim_set_hl(0, "PmenuSel", { ctermfg = fg, ctermbg = faded, reverse = true })
vim.api.nvim_set_hl(0, "PmenuSbar", { ctermbg = faded })
vim.api.nvim_set_hl(0, "PmenuThumb", { ctermbg = fg })
vim.api.nvim_set_hl(0, "DiffAdd", { ctermfg = string, ctermbg = bg })
vim.api.nvim_set_hl(0, "DiffChange", { ctermfg = statement, ctermbg = bg })
vim.api.nvim_set_hl(0, "DiffDelete", { ctermfg = error, ctermbg = bg })
vim.api.nvim_set_hl(0, "DiffText", { ctermfg = fg, ctermbg = property })

-- LSP Semantic Tokens & Treesitter
vim.api.nvim_set_hl(0, "@variable", { ctermfg = variable })
vim.api.nvim_set_hl(0, "@variable.builtin", { ctermfg = magenta })
vim.api.nvim_set_hl(0, "@variable.parameter", { ctermfg = variable })
vim.api.nvim_set_hl(0, "@variable.member", { ctermfg = property })
vim.api.nvim_set_hl(0, "@constant", { ctermfg = constant })
vim.api.nvim_set_hl(0, "@constant.builtin", { ctermfg = constant })
vim.api.nvim_set_hl(0, "@constant.macro", { ctermfg = preproc })
vim.api.nvim_set_hl(0, "@module", { ctermfg = property })
vim.api.nvim_set_hl(0, "@label", { ctermfg = statement })
vim.api.nvim_set_hl(0, "@string", { ctermfg = string })
vim.api.nvim_set_hl(0, "@string.documentation", { ctermfg = string })
vim.api.nvim_set_hl(0, "@string.regexp", { ctermfg = type })
vim.api.nvim_set_hl(0, "@string.escape", { ctermfg = statement })
vim.api.nvim_set_hl(0, "@string.special", { ctermfg = statement })
vim.api.nvim_set_hl(0, "@character", { ctermfg = string })
vim.api.nvim_set_hl(0, "@character.special", { ctermfg = statement })
vim.api.nvim_set_hl(0, "@boolean", { ctermfg = constant })
vim.api.nvim_set_hl(0, "@number", { ctermfg = constant })
vim.api.nvim_set_hl(0, "@number.float", { ctermfg = constant })
vim.api.nvim_set_hl(0, "@type", { ctermfg = type })
vim.api.nvim_set_hl(0, "@type.builtin", { ctermfg = type })
vim.api.nvim_set_hl(0, "@type.definition", { ctermfg = type })
vim.api.nvim_set_hl(0, "@attribute", { ctermfg = preproc })
vim.api.nvim_set_hl(0, "@property", { ctermfg = property })
vim.api.nvim_set_hl(0, "@function", { ctermfg = func })
vim.api.nvim_set_hl(0, "@function.builtin", { ctermfg = func })
vim.api.nvim_set_hl(0, "@function.call", { ctermfg = func })
vim.api.nvim_set_hl(0, "@function.macro", { ctermfg = preproc })
vim.api.nvim_set_hl(0, "@method", { ctermfg = func })
vim.api.nvim_set_hl(0, "@method.call", { ctermfg = func })
vim.api.nvim_set_hl(0, "@constructor", { ctermfg = type })
vim.api.nvim_set_hl(0, "@operator", { ctermfg = operator })
vim.api.nvim_set_hl(0, "@keyword", { ctermfg = keyword, italic = true })
vim.api.nvim_set_hl(0, "@keyword.function", { ctermfg = keyword, italic = true })
vim.api.nvim_set_hl(0, "@keyword.operator", { ctermfg = keyword, italic = true })
vim.api.nvim_set_hl(0, "@keyword.import", { ctermfg = keyword, italic = true })
vim.api.nvim_set_hl(0, "@keyword.type", { ctermfg = keyword, italic = true })
vim.api.nvim_set_hl(0, "@keyword.modifier", { ctermfg = keyword, italic = true })
vim.api.nvim_set_hl(0, "@keyword.repeat", { ctermfg = keyword, italic = true })
vim.api.nvim_set_hl(0, "@keyword.return", { ctermfg = keyword, italic = true })
vim.api.nvim_set_hl(0, "@keyword.debug", { ctermfg = keyword, italic = true })
vim.api.nvim_set_hl(0, "@keyword.exception", { ctermfg = keyword, italic = true })
vim.api.nvim_set_hl(0, "@keyword.conditional", { ctermfg = keyword, italic = true })
vim.api.nvim_set_hl(0, "@keyword.conditional.ternary", { ctermfg = keyword, italic = true })
vim.api.nvim_set_hl(0, "@keyword.directive", { ctermfg = keyword, italic = true })
vim.api.nvim_set_hl(0, "@keyword.directive.define", { ctermfg = keyword, italic = true })
vim.api.nvim_set_hl(0, "@punctuation.delimiter", { ctermfg = fg })
vim.api.nvim_set_hl(0, "@punctuation.bracket", { ctermfg = fg })
vim.api.nvim_set_hl(0, "@punctuation.special", { ctermfg = fg })
vim.api.nvim_set_hl(0, "@comment", { ctermfg = comment, italic = true })
vim.api.nvim_set_hl(0, "@comment.documentation", { ctermfg = comment, italic = true })
vim.api.nvim_set_hl(0, "@comment.error", { ctermfg = error, italic = true })
vim.api.nvim_set_hl(0, "@comment.warning", { ctermfg = todo })
vim.api.nvim_set_hl(0, "@comment.todo", { ctermfg = todo })
vim.api.nvim_set_hl(0, "@comment.note", { ctermfg = property })
vim.api.nvim_set_hl(0, "@markup.strong", { ctermfg = fg, bold = true })
vim.api.nvim_set_hl(0, "@markup.italic", { ctermfg = fg, italic = true })
vim.api.nvim_set_hl(0, "@markup.strikethrough", { ctermfg = fg, strikethrough = true })
vim.api.nvim_set_hl(0, "@markup.underline", { ctermfg = fg, underline = true })
vim.api.nvim_set_hl(0, "@markup.heading", { ctermfg = statement, bold = true })
vim.api.nvim_set_hl(0, "@markup.link", { ctermfg = property, underline = true })
vim.api.nvim_set_hl(0, "@markup.link.label", { ctermfg = property })
vim.api.nvim_set_hl(0, "@markup.link.url", { ctermfg = type, underline = true })
vim.api.nvim_set_hl(0, "@markup.raw", { ctermfg = string })
vim.api.nvim_set_hl(0, "@markup.raw.block", { ctermfg = string })
vim.api.nvim_set_hl(0, "@markup.list", { ctermfg = fg })
vim.api.nvim_set_hl(0, "@markup.list.checked", { ctermfg = string })
vim.api.nvim_set_hl(0, "@markup.list.unchecked", { ctermfg = error })
vim.api.nvim_set_hl(0, "@diff.plus", { ctermfg = string })
vim.api.nvim_set_hl(0, "@diff.minus", { ctermfg = error })
vim.api.nvim_set_hl(0, "@diff.delta", { ctermfg = statement })
vim.api.nvim_set_hl(0, "@tag", { ctermfg = keyword })
vim.api.nvim_set_hl(0, "@tag.attribute", { ctermfg = property })
vim.api.nvim_set_hl(0, "@tag.delimiter", { ctermfg = fg })

-- LSP Semantic Tokens
vim.api.nvim_set_hl(0, "@lsp.type.namespace", { ctermfg = property })
vim.api.nvim_set_hl(0, "@lsp.type.type", { ctermfg = type })
vim.api.nvim_set_hl(0, "@lsp.type.class", { ctermfg = type })
vim.api.nvim_set_hl(0, "@lsp.type.enum", { ctermfg = type })
vim.api.nvim_set_hl(0, "@lsp.type.interface", { ctermfg = type })
vim.api.nvim_set_hl(0, "@lsp.type.struct", { ctermfg = type })
vim.api.nvim_set_hl(0, "@lsp.type.parameter", { ctermfg = variable })
vim.api.nvim_set_hl(0, "@lsp.type.variable", { ctermfg = variable })
vim.api.nvim_set_hl(0, "@lsp.type.property", { ctermfg = property })
vim.api.nvim_set_hl(0, "@lsp.type.enumMember", { ctermfg = constant })
vim.api.nvim_set_hl(0, "@lsp.type.function", { ctermfg = func })
vim.api.nvim_set_hl(0, "@lsp.type.method", { ctermfg = func })
vim.api.nvim_set_hl(0, "@lsp.type.macro", { ctermfg = preproc })
vim.api.nvim_set_hl(0, "@lsp.type.keyword", { ctermfg = keyword, italic = true })
vim.api.nvim_set_hl(0, "@lsp.type.modifier", { ctermfg = keyword })
vim.api.nvim_set_hl(0, "@lsp.type.comment", { ctermfg = comment, italic = true })
vim.api.nvim_set_hl(0, "@lsp.type.string", { ctermfg = string })
vim.api.nvim_set_hl(0, "@lsp.type.number", { ctermfg = constant })
vim.api.nvim_set_hl(0, "@lsp.type.regexp", { ctermfg = type })
vim.api.nvim_set_hl(0, "@lsp.type.operator", { ctermfg = operator })
vim.api.nvim_set_hl(0, "@lsp.type.decorator", { ctermfg = preproc })

-- Plugins
vim.api.nvim_set_hl(0, "IblIndent", { ctermfg = faded })
vim.api.nvim_set_hl(0, "IblScope", { ctermfg = faded })
vim.api.nvim_set_hl(0, "IblWhitespace", { ctermfg = faded })
vim.api.nvim_set_hl(0, "TelescopeBorder", { ctermfg = faded })
vim.api.nvim_set_hl(0, 'TelescopeMatching', { link = 'Search' })

-- GitSigns
vim.api.nvim_set_hl(0, "GitSignsAdd", { ctermfg = green, ctermbg = bg })
vim.api.nvim_set_hl(0, "GitSignsChange", { ctermfg = yellow, ctermbg = bg })
vim.api.nvim_set_hl(0, "GitSignsDelete", { ctermfg = red, ctermbg = bg })
vim.api.nvim_set_hl(0, "GitSignsChangedelete", { ctermfg = yellow, ctermbg = bg })
vim.api.nvim_set_hl(0, "GitSignsTopdelete", { ctermfg = red, ctermbg = bg })
vim.api.nvim_set_hl(0, "GitSignsUntracked", { ctermfg = green, ctermbg = bg })
vim.api.nvim_set_hl(0, "GitSignsAddNr", { ctermfg = green })
vim.api.nvim_set_hl(0, "GitSignsChangeNr", { ctermfg = yellow })
vim.api.nvim_set_hl(0, "GitSignsDeleteNr", { ctermfg = red })
vim.api.nvim_set_hl(0, "GitSignsChangedeleteNr", { ctermfg = yellow })
vim.api.nvim_set_hl(0, "GitSignsTopdeleteNr", { ctermfg = red })
vim.api.nvim_set_hl(0, "GitSignsUntrackedNr", { ctermfg = green })
vim.api.nvim_set_hl(0, "GitSignsAddLn", { ctermbg = green, ctermfg = black })
vim.api.nvim_set_hl(0, "GitSignsChangeLn", { ctermbg = yellow, ctermfg = black })
vim.api.nvim_set_hl(0, "GitSignsDeleteLn", { ctermbg = red, ctermfg = black })
vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { ctermfg = faded, italic = true })
-- GitSigns cursor line
vim.api.nvim_set_hl(0, "GitSignsAddCursorLine", { link = "GitSignsAdd" })
vim.api.nvim_set_hl(0, "GitSignsChangeCursorLine", { link = "GitSignsChange" })
vim.api.nvim_set_hl(0, "GitSignsDeleteCursorLine", { link = "GitSignsDelete" })
vim.api.nvim_set_hl(0, "GitSignsChangedeleteCursorLine", { link = "GitSignsChangedelete" })
vim.api.nvim_set_hl(0, "GitSignsTopdeleteCursorLine", { link = "GitSignsTopdelete" })
vim.api.nvim_set_hl(0, "GitSignsUntrackedCursorLine", { link = "GitSignsUntracked" })
-- GitSigns staged
vim.api.nvim_set_hl(0, "GitSignsAddStaged", { ctermfg = green, ctermbg = bg })
vim.api.nvim_set_hl(0, "GitSignsChangeStaged", { ctermfg = yellow, ctermbg = bg })
vim.api.nvim_set_hl(0, "GitSignsDeleteStaged", { ctermfg = red, ctermbg = bg })
vim.api.nvim_set_hl(0, "GitSignsChangedeleteStaged", { ctermfg = yellow, ctermbg = bg })
vim.api.nvim_set_hl(0, "GitSignsTopdeleteStaged", { ctermfg = red, ctermbg = bg })
vim.api.nvim_set_hl(0, "GitSignsAddStagedNr", { ctermfg = green })
vim.api.nvim_set_hl(0, "GitSignsChangeStagedNr", { ctermfg = yellow })
vim.api.nvim_set_hl(0, "GitSignsDeleteStagedNr", { ctermfg = red })
vim.api.nvim_set_hl(0, "GitSignsAddStagedLn", { ctermbg = green, ctermfg = black })
vim.api.nvim_set_hl(0, "GitSignsChangeStagedLn", { ctermbg = yellow, ctermfg = black })
vim.api.nvim_set_hl(0, "GitSignsAddStagedCursorLine", { link = "GitSignsAddStaged" })
vim.api.nvim_set_hl(0, "GitSignsChangeStagedCursorLine", { link = "GitSignsChangeStaged" })
vim.api.nvim_set_hl(0, "GitSignsDeleteStagedCursorLine", { link = "GitSignsDeleteStaged" })
vim.api.nvim_set_hl(0, "GitSignsChangedeleteStagedCursorLine", { link = "GitSignsChangedeleteStaged" })
vim.api.nvim_set_hl(0, "GitSignsTopdeleteStagedCursorLine", { link = "GitSignsTopdeleteStaged" })
-- GitSigns inline and preview
vim.api.nvim_set_hl(0, "GitSignsAddInline", { ctermbg = green, ctermfg = black })
vim.api.nvim_set_hl(0, "GitSignsDeleteInline", { ctermbg = red, ctermfg = black })
vim.api.nvim_set_hl(0, "GitSignsChangeInline", { ctermbg = yellow, ctermfg = black })
vim.api.nvim_set_hl(0, "GitSignsAddPreview", { link = "GitSignsAddInline" })
vim.api.nvim_set_hl(0, "GitSignsDeletePreview", { link = "GitSignsDeleteInline" })

-- Spell
vim.api.nvim_set_hl(0, "SpellBad", { underline = true})
vim.api.nvim_set_hl(0, "SpellCap", { underline = true })
vim.api.nvim_set_hl(0, "SpellRare", { underline = true })
vim.api.nvim_set_hl(0, "SpellLocal", { underline = true })
