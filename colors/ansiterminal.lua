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

local fg = "White"
local bg = "Black"
local faded = 8
local red = "Red"
local green = "Green"
local yellow = "Yellow"
local blue = "Blue"
local magenta = "Magenta"
local cyan = "Cyan"
local black = "Black"

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
vim.api.nvim_set_hl(0, "Statement", { ctermfg = yellow })
vim.api.nvim_set_hl(0, "Conditional", { link = "Statement" })
vim.api.nvim_set_hl(0, "Repeat", { link = "Statement" })
vim.api.nvim_set_hl(0, "Keyword", { link = "Statement" })
vim.api.nvim_set_hl(0, "Operator", { link = "Statement" })
vim.api.nvim_set_hl(0, "String", { ctermfg = green })
vim.api.nvim_set_hl(0, "Character", { link = "String" })
vim.api.nvim_set_hl(0, "Constant", { ctermfg = magenta })
vim.api.nvim_set_hl(0, "Number", { link = "Constant" })
vim.api.nvim_set_hl(0, "Boolean", { link = "Constant" })
vim.api.nvim_set_hl(0, "Type", { ctermfg = cyan })
vim.api.nvim_set_hl(0, "Function", { link = "Type" })
vim.api.nvim_set_hl(0, "PreProc", { ctermfg = red })
vim.api.nvim_set_hl(0, "Special", { link = "PreProc" })
vim.api.nvim_set_hl(0, "Error", { ctermfg = fg, ctermbg = red })
vim.api.nvim_set_hl(0, "Todo", { ctermfg = black, ctermbg = yellow })
vim.api.nvim_set_hl(0, "CursorLineNr", { ctermfg = fg, ctermbg = bg })
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
vim.api.nvim_set_hl(0, "DiffAdd", { ctermfg = green, ctermbg = bg })
vim.api.nvim_set_hl(0, "DiffChange", { ctermfg = yellow, ctermbg = bg })
vim.api.nvim_set_hl(0, "DiffDelete", { ctermfg = red, ctermbg = bg })
vim.api.nvim_set_hl(0, "DiffText", { ctermfg = fg, ctermbg = blue })

-- LSP Semantic Tokens & Treesitter
vim.api.nvim_set_hl(0, "@variable", { ctermfg = fg })
vim.api.nvim_set_hl(0, "@variable.builtin", { ctermfg = red })
vim.api.nvim_set_hl(0, "@variable.parameter", { ctermfg = fg })
vim.api.nvim_set_hl(0, "@variable.member", { ctermfg = blue })
vim.api.nvim_set_hl(0, "@constant", { ctermfg = magenta })
vim.api.nvim_set_hl(0, "@constant.builtin", { ctermfg = magenta })
vim.api.nvim_set_hl(0, "@constant.macro", { ctermfg = red })
vim.api.nvim_set_hl(0, "@module", { ctermfg = blue })
vim.api.nvim_set_hl(0, "@label", { ctermfg = yellow })
vim.api.nvim_set_hl(0, "@string", { ctermfg = green })
vim.api.nvim_set_hl(0, "@string.documentation", { ctermfg = green })
vim.api.nvim_set_hl(0, "@string.regexp", { ctermfg = cyan })
vim.api.nvim_set_hl(0, "@string.escape", { ctermfg = yellow })
vim.api.nvim_set_hl(0, "@string.special", { ctermfg = yellow })
vim.api.nvim_set_hl(0, "@character", { ctermfg = green })
vim.api.nvim_set_hl(0, "@character.special", { ctermfg = yellow })
vim.api.nvim_set_hl(0, "@boolean", { ctermfg = magenta })
vim.api.nvim_set_hl(0, "@number", { ctermfg = magenta })
vim.api.nvim_set_hl(0, "@number.float", { ctermfg = magenta })
vim.api.nvim_set_hl(0, "@type", { ctermfg = cyan })
vim.api.nvim_set_hl(0, "@type.builtin", { ctermfg = cyan })
vim.api.nvim_set_hl(0, "@type.definition", { ctermfg = cyan })
vim.api.nvim_set_hl(0, "@attribute", { ctermfg = red })
vim.api.nvim_set_hl(0, "@property", { ctermfg = blue })
vim.api.nvim_set_hl(0, "@function", { ctermfg = yellow })
vim.api.nvim_set_hl(0, "@function.builtin", { ctermfg = yellow })
vim.api.nvim_set_hl(0, "@function.call", { ctermfg = yellow })
vim.api.nvim_set_hl(0, "@function.macro", { ctermfg = red })
vim.api.nvim_set_hl(0, "@method", { ctermfg = yellow })
vim.api.nvim_set_hl(0, "@method.call", { ctermfg = yellow })
vim.api.nvim_set_hl(0, "@constructor", { ctermfg = cyan })
vim.api.nvim_set_hl(0, "@operator", { ctermfg = fg })
vim.api.nvim_set_hl(0, "@keyword", { ctermfg = red, bold = true })
vim.api.nvim_set_hl(0, "@keyword.function", { ctermfg = red, bold = true })
vim.api.nvim_set_hl(0, "@keyword.operator", { ctermfg = red, bold = true })
vim.api.nvim_set_hl(0, "@keyword.import", { ctermfg = red, bold = true })
vim.api.nvim_set_hl(0, "@keyword.type", { ctermfg = red, bold = true })
vim.api.nvim_set_hl(0, "@keyword.modifier", { ctermfg = red, bold = true })
vim.api.nvim_set_hl(0, "@keyword.repeat", { ctermfg = red, bold = true })
vim.api.nvim_set_hl(0, "@keyword.return", { ctermfg = red, bold = true })
vim.api.nvim_set_hl(0, "@keyword.debug", { ctermfg = red, bold = true })
vim.api.nvim_set_hl(0, "@keyword.exception", { ctermfg = red, bold = true })
vim.api.nvim_set_hl(0, "@keyword.conditional", { ctermfg = red, bold = true })
vim.api.nvim_set_hl(0, "@keyword.conditional.ternary", { ctermfg = red, bold = true })
vim.api.nvim_set_hl(0, "@keyword.directive", { ctermfg = red, bold = true })
vim.api.nvim_set_hl(0, "@keyword.directive.define", { ctermfg = red, bold = true })
vim.api.nvim_set_hl(0, "@punctuation.delimiter", { ctermfg = fg })
vim.api.nvim_set_hl(0, "@punctuation.bracket", { ctermfg = fg })
vim.api.nvim_set_hl(0, "@punctuation.special", { ctermfg = fg })
vim.api.nvim_set_hl(0, "@comment", { ctermfg = green, italic = true })
vim.api.nvim_set_hl(0, "@comment.documentation", { ctermfg = green, italic = true })
vim.api.nvim_set_hl(0, "@comment.error", { ctermfg = red, italic = true })
vim.api.nvim_set_hl(0, "@comment.warning", { ctermfg = yellow })
vim.api.nvim_set_hl(0, "@comment.todo", { ctermfg = yellow })
vim.api.nvim_set_hl(0, "@comment.note", { ctermfg = blue })
vim.api.nvim_set_hl(0, "@markup.strong", { ctermfg = fg, bold = true })
vim.api.nvim_set_hl(0, "@markup.italic", { ctermfg = fg, italic = true })
vim.api.nvim_set_hl(0, "@markup.strikethrough", { ctermfg = fg, strikethrough = true })
vim.api.nvim_set_hl(0, "@markup.underline", { ctermfg = fg, underline = true })
vim.api.nvim_set_hl(0, "@markup.heading", { ctermfg = yellow, bold = true })
vim.api.nvim_set_hl(0, "@markup.link", { ctermfg = blue, underline = true })
vim.api.nvim_set_hl(0, "@markup.link.label", { ctermfg = blue })
vim.api.nvim_set_hl(0, "@markup.link.url", { ctermfg = cyan, underline = true })
vim.api.nvim_set_hl(0, "@markup.raw", { ctermfg = green })
vim.api.nvim_set_hl(0, "@markup.raw.block", { ctermfg = green })
vim.api.nvim_set_hl(0, "@markup.list", { ctermfg = fg })
vim.api.nvim_set_hl(0, "@markup.list.checked", { ctermfg = green })
vim.api.nvim_set_hl(0, "@markup.list.unchecked", { ctermfg = red })
vim.api.nvim_set_hl(0, "@diff.plus", { ctermfg = green })
vim.api.nvim_set_hl(0, "@diff.minus", { ctermfg = red })
vim.api.nvim_set_hl(0, "@diff.delta", { ctermfg = yellow })
vim.api.nvim_set_hl(0, "@tag", { ctermfg = red })
vim.api.nvim_set_hl(0, "@tag.attribute", { ctermfg = blue })
vim.api.nvim_set_hl(0, "@tag.delimiter", { ctermfg = fg })

-- LSP Semantic Tokens
vim.api.nvim_set_hl(0, "@lsp.type.namespace", { ctermfg = blue })
vim.api.nvim_set_hl(0, "@lsp.type.type", { ctermfg = cyan })
vim.api.nvim_set_hl(0, "@lsp.type.class", { ctermfg = cyan })
vim.api.nvim_set_hl(0, "@lsp.type.enum", { ctermfg = cyan })
vim.api.nvim_set_hl(0, "@lsp.type.interface", { ctermfg = cyan })
vim.api.nvim_set_hl(0, "@lsp.type.struct", { ctermfg = cyan })
vim.api.nvim_set_hl(0, "@lsp.type.parameter", { ctermfg = fg })
vim.api.nvim_set_hl(0, "@lsp.type.variable", { ctermfg = fg })
vim.api.nvim_set_hl(0, "@lsp.type.property", { ctermfg = blue })
vim.api.nvim_set_hl(0, "@lsp.type.enumMember", { ctermfg = magenta })
vim.api.nvim_set_hl(0, "@lsp.type.function", { ctermfg = yellow })
vim.api.nvim_set_hl(0, "@lsp.type.method", { ctermfg = yellow })
vim.api.nvim_set_hl(0, "@lsp.type.macro", { ctermfg = red })
vim.api.nvim_set_hl(0, "@lsp.type.keyword", { ctermfg = red, bold = true })
vim.api.nvim_set_hl(0, "@lsp.type.modifier", { ctermfg = red })
vim.api.nvim_set_hl(0, "@lsp.type.comment", { ctermfg = green, italic = true })
vim.api.nvim_set_hl(0, "@lsp.type.string", { ctermfg = green })
vim.api.nvim_set_hl(0, "@lsp.type.number", { ctermfg = magenta })
vim.api.nvim_set_hl(0, "@lsp.type.regexp", { ctermfg = cyan })
vim.api.nvim_set_hl(0, "@lsp.type.operator", { ctermfg = fg })
vim.api.nvim_set_hl(0, "@lsp.type.decorator", { ctermfg = red })

-- Plugins
vim.api.nvim_set_hl(0, "IblIndent", { ctermfg = faded })
vim.api.nvim_set_hl(0, "IblScope", { ctermfg = faded })
vim.api.nvim_set_hl(0, "IblWhitespace", { ctermfg = faded })
vim.api.nvim_set_hl(0, "TelescopeBorder", { ctermfg = faded })
vim.api.nvim_set_hl(0, 'TelescopeMatching', { link = 'Search' })
